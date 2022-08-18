class user{
    int id;
    String username;
    String email;
    String token;
    String user_contact;

    user(this.id,this.username,this.email,this.token,this.user_contact);
    
    factory user.fromJson(Map<String,dynamic> json){
        return user(json["id"] as int, json["username"] as String,json["email"] as String,json["token"] as String,json["user_contact"] as String);
    }
}