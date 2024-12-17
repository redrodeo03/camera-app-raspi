/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/ 
class ErrorResponse {
    int? code;
    String? message;
    Object? errordata;

    ErrorResponse({this.code, this.message, this.errordata}); 

    ErrorResponse.fromJson(Map<String, dynamic> json) {
        code = json['code'];
        message = json['message'];
        errordata = json['errordata'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['code'] = code;
        data['message'] = message;
        data['errordata'] = errordata;
        return data;
    }
}

// class ErrorResponse {
//     Error? error;

//     ErrorResponse({this.error}); 

//     ErrorResponse.fromJson(Map<String, dynamic> json) {
//         error = json['error'] != null ? Error?.fromJson(json['error']) : null;
//     }

//     Map<String, dynamic> toJson() {
//         final Map<String, dynamic> data = <String, dynamic>{};
//         data['error'] = error!.toJson();
//         return data;
//     }
// }

