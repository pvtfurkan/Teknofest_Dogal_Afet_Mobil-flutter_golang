import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'dart:convert';
import 'package:dogalafetmobil/models/response.dart';

import '../Dashboard/Dashboard.dart';
import '../constants.dart';
import '../kayit/kayit.dart';


class LoginEkrani extends StatefulWidget {

  @override
  _LoginEkraniState createState() => _LoginEkraniState();
}

class _LoginEkraniState extends State<LoginEkrani> {

  bool _isLoading = false;



  var tfKullaniciAdi = TextEditingController();
  var tfSifre = TextEditingController();

  var scaffoldKey = GlobalKey<ScaffoldState>();



  Future<void> girisKontrol() async {


    GetStorage box = GetStorage();
    var ka = tfKullaniciAdi.text;
    var s = tfSifre.text;

    setState(() {
      _isLoading = true;
    });




    Map<String,String> headers = {'Content-Type':'application/json'};
    final msg = jsonEncode({ "email":ka, "password":s});

    final response = await http.post(Uri.http(api_link, 'api/login'), headers: headers,body:msg );
    Map<String,dynamic> data = json.decode(response.body);
    print(data);
    if(data["status"]){
      await box.write("kullanici", data);

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Dashboard(),
          ));

    }else {
      setState(() {
        _isLoading=false;
      });
      var hata = data["message"];
      alt_mesaj(context, "$hata");
    }
  }


  // setState(() {
  // _isLoading=true;
  // });
  // GetStorage box = GetStorage();
  // bool durum =  box.write("kullanici", data);
  // if (durum) {
  // Navigator.push(
  // context,
  // MaterialPageRoute(
  // builder: (context) => Dashboard(),
  // ),
  // );
  // }

  oturum_durum() {
    bool x = oturum_kontrol();
    if(x){

      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(
        builder:(context) => Dashboard(),), (route) => false); });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    oturum_durum();
  }
  @override
  Widget build(BuildContext context) {
    oturum_durum();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        title: const Text('Giriş Yap', style: TextStyle(
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

        child: Padding(


          padding: const EdgeInsets.all(8.0),
          child: Stack(

            children: [
              Align(
                  alignment: Alignment.center,
                  child: Lottie.asset('assets/blossoms.json',
                      height: MediaQuery.of(context).size.width * 1.2)),
              Column(


              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                TextKutulari(hinttext: "Email Giriniz", kontrolcu: tfKullaniciAdi),
                SizedBox(height:20),
                TextField(
                  obscureText: true,
                  controller: tfSifre,
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
                Container(
                  width: MediaQuery.of(context).size.width -40,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                       if(tfKullaniciAdi.text.length <3 || !tfKullaniciAdi.text.contains("@")) {
                          alt_mesaj(context, "Lütfen Doğru E-Mail Adresi Girin");
                        }
                        else if (tfSifre.text.length < 6) {
                          alt_mesaj(context, "Şifre En Az 6 Karakterden Oluşmalıdır");
                        }
                        else {
                          girisKontrol();
                          GetStorage box = GetStorage();
                          print(box.read("kullanici"));
                        }
                      },
                      child: _isLoading ? Center(child: CircularProgressIndicator(color:Colors.white),) :
                      Text(
                        "Giriş",
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
                    Text('Hesabın yok mu ?',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10,),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) =>  Kayit()));

                      },
                      child: Text(
                        'Hesap Oluştur',
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
                ),

              ],
            ),
          ]),
        ),
      ),

    );
  }
}
