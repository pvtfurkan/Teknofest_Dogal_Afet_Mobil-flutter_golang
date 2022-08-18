import 'package:dogalafetmobil/models/user.dart';
class toplu{
    bool status;
    String message;
    String errors;
    user data;

    toplu(this.status,this.message,this.errors,this.data);
    
    factory toplu.fromJson(Map<String,dynamic> json){


        return toplu(json["status"] as bool, json["message"] as String,json["errors"] as String,json["data"] as user);
    }
}