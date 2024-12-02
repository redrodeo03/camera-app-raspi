from flask import Flask, Response, jsonify
from picamera2 import Picamera2
from picamera2.encoders import JpegEncoder
from picamera2.outputs import FileOutput
import io
import logging
from threading import Condition
import base64

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger('PiStream')

app = Flask(__name__)
picam2 = None
output = None


class StreamingOutput(io.BufferedIOBase):
    def __init__(self):
        self.frame = None
        self.condition = Condition()

    def write(self, buf):
        with self.condition:
            self.frame = buf
            self.condition.notify_all()


def init_camera():
    global picam2, output
    picam2 = Picamera2()

    # Configure the camera for video streaming (640x480)
    video_config = picam2.create_video_configuration(
        main={"size": (640, 480)},
        controls={"FrameDurationLimits": (16666, 16666)}  # ~60fps
    )
    picam2.configure(video_config)
    output = StreamingOutput()
    picam2.start_recording(JpegEncoder(), FileOutput(output))
    logger.info("Camera initialized")


def generate_frames():
    try:
        while True:
            with output.condition:
                output.condition.wait()
                frame = output.frame
            yield (b'--frame\r\n'
                   b'Content-Type: image/jpeg\r\n\r\n' + frame + b'\r\n')
    except Exception as e:
        logger.error(f"Frame generation error: {str(e)}")


@app.route('/')
def index():
    """Homepage showing live video stream."""
    return """
    <html>
        <head>
            <title>Raspberry Pi Camera Stream</title>
        </head>
        <body>
            <h1>Live Stream from Raspberry Pi Camera</h1>
            <img src="/video_feed" width="640" height="480" />
        </body>
    </html>
    """


@app.route('/video_feed')
def video_feed():
    """Stream the video feed."""
    return Response(generate_frames(),
                    mimetype='multipart/x-mixed-replace; boundary=frame')


@app.route('/capture', methods=['GET'])
def capture_photo():
    """Captures a photo from the Raspberry Pi camera and returns the image data as Base64."""
    try:
        # Stop the video recording before capturing the photo
        logger.info("Stopping video recording for photo capture")
        picam2.stop_recording()

        # Configure the camera for still capture (photo mode)
        still_config = picam2.create_still_configuration(main={"size": (640, 480)})
        picam2.configure(still_config)
        picam2.start()

        # Capture the still image
        logger.info("Capturing photo")
        image_data = picam2.capture_array()

        # Encode the image data to JPEG
        jpeg_encoder = JpegEncoder()
        jpeg_buffer = io.BytesIO()
        jpeg_encoder.encode(image_data, jpeg_buffer)

        # Convert the binary JPEG data to Base64
        encoded_image = base64.b64encode(jpeg_buffer.getvalue()).decode('utf-8')

        # Stop still capture and reconfigure for video streaming
        logger.info("Reconfiguring for video streaming")
        picam2.stop()
        video_config = picam2.create_video_configuration(
            main={"size": (640, 480)},
            controls={"FrameDurationLimits": (16666, 16666)}  # ~60fps
        )
        picam2.configure(video_config)
        picam2.start_recording(JpegEncoder(), FileOutput(output))

        # Return the Base64-encoded image as a JSON response
        logger.info("Photo captured successfully, sending JSON response")
        return jsonify({"image_data": encoded_image})

    except Exception as e:
        logger.error(f"Error capturing photo: {str(e)}")
        return jsonify({"error": str(e)}), 500


if __name__ == '__main__':
    try:
        init_camera()
        app.run(host='0.0.0.0', port=5000, threaded=True)
    except Exception as e:
        logger.error(f"Server error: {str(e)}")
    finally:
        if picam2:
            picam2.stop_recording()
