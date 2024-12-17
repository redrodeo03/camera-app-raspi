// import 'dart:async';

// class ScreenStream {
//   static final StreamController<String> _controller = StreamController<String>.broadcast();

//   static Stream<String> get stream => _controller.stream;

//   static void send(String data) {
//     _controller.add(data);
//   }

//   static void dispose() {
//     _controller.close();
//   }
// }

// import 'package:flutter/material.dart';

// class NotificationScreen extends StatefulWidget {
//   @override
//   _NotificationScreenState createState() => _NotificationScreenState();
// }

// class _NotificationScreenState extends State<NotificationScreen> {
//   String _notificationData = "";

//   @override
//   void initState() {
//     super.initState();
//     ScreenStream.stream.listen((data) {
//       setState(() {
//         _notificationData = data;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Notification Screen"),
//       ),
//       body: Center(
//         child: Text(_notificationData),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:your_app/notification_screen.dart';
// import 'package:your_app/screen_stream.dart';

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Home Screen"),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           child: Text("Send Notification"),
//           onPressed: () {
//             ScreenStream.send("Hello from Home Screen!");
//             Navigator.push(context, MaterialPageRoute(builder: (_) => NotificationScreen()));
//           },
//         ),
//       ),
//     );
//   }
// }
