import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:dogalafetmobil/constants.dart';
import 'package:dogalafetmobil/giris/giris.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Dashboard/Dashboard.dart';


class Kayit extends StatefulWidget {
  @override
  _KayitState createState() => _KayitState();
}

class _KayitState extends State<Kayit> {

  bool _isLoading = false ;

  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  String gender;
  var scaffoldKey = new GlobalKey<ScaffoldState>();
  bool loading = false;
  void showInSnackBar(String value) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(content: Text(value)));

  }
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Future<void> kullanicikayit() async {

    setState(() {
      _isLoading = true;
    });
    var username = _nameTextController.text;
    var email = _emailTextController.text;
    var password = _passwordTextController.text;
    var confirmPassword = _confirmPasswordController.text;
    var scaffoldKey = GlobalKey<ScaffoldState>();
    GetStorage box = GetStorage();
    Map<String,String> headers = {'Content-Type':'application/json'};
    final msg = jsonEncode({ "username":username,"email":email, "password":password,"password_confirm":confirmPassword});

    final response = await http.post(Uri.http(api_link, 'api/register'), headers: headers,body:msg );
    Map<String,dynamic> data = json.decode(response.body);

    if(data["status"]) {
      box.write("id",data["data"]["id"].toString());
      box.write("token",data["data"]["token"]);
      box.write("isAuth",true);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard()));
    }else{
      setState(() {
        _isLoading=false;
      });

      if (data["message"] is List) {
        data["message"].forEach((dynamic hata) =>
        {
          alt_mesaj(context, "$hata"),
          }
        );
      }else{
        data["message"].forEach((dynamic hata) => {

        alt_mesaj(context, "$hata"),
         }
        );
      }
      //
    }
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 3;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        title: const Text('Hesap Oluştur', style: TextStyle(
            color: Colors.white
        )),
        backgroundColor:  Color(0xFFFD8080),
        elevation: 0,
        centerTitle: true,
      ),
      key: scaffoldKey,


      body: Container(
      decoration: BoxDecoration(
          color: Color(0xFFFD8080),
      ),
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Align(
                alignment: Alignment.center,
                child: Lottie.asset('assets/blossoms.json',
                    height: MediaQuery.of(context).size.width * 1.2)),
            Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              TextKutulari(hinttext: "Kullanıcı Adı",kontrolcu: _nameTextController,),
              SizedBox(height: 20,),
              TextKutulari(hinttext: "E-mail adresi",kontrolcu: _emailTextController,),
              SizedBox(height: 20),
              TextField(
                obscureText: true,
                controller: _passwordTextController,
                decoration: InputDecoration(
                  fillColor: Colors.pink.shade100,
                  hintText: "Şifre Giriniz",
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 20),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.black, width: 1)),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: true,
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  fillColor: Colors.pink.shade100,
                  hintText: "Şifre Giriniz",
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 20),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.black, width: 1)),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width -40,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Center(
                  child: InkWell(
                    onTap: () {
                      if(_passwordTextController.text  != _confirmPasswordController.text) {
                        alt_mesaj(context, "Şifreler Aynı Değil");
                      }
                      else if(_emailTextController.text.length <3 || !_emailTextController.text.contains("@")) {
                        alt_mesaj(context, "Lütfen Doğru E-Mail Adresi Girin");
                      }
                      else if(_passwordTextController.text.length < 6) {
                        alt_mesaj(context, "Şifre En Az 6 Karakterden Oluşmalıdır");
                      }
                      else {
                        kullanicikayit();
                      }
                    },
                    child:  _isLoading ? Center(child: CircularProgressIndicator(color: Colors.white)):
                    Text(
                      "Hesap Oluştur",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Zaten hesabın var mı ?',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10,),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) =>  LoginEkrani()));

                    },
                    child: Text(
                      'Giriş Yap',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow( // bottomLeft
                            offset: Offset(-1, 0),
                            color: Colors.black,
                          )],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
         ]
        ),
      ),
     ),
    );
  }
}