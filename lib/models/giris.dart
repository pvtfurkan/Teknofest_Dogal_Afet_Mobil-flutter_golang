class giris{
    int id;
    String errors;
    String message;
    bool status;
    String token;

    giris(this.id,this.errors,this.message,this.status,this.token);
    
    factory giris.fromJson(Map<String,dynamic> json){
        return giris(json["id"] as int, json["errors"] as String,json["message"] as String,json["status"] as bool,json["token"] as String);
    }
}