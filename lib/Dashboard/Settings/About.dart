import 'package:flutter/material.dart';
import 'package:dogalafetmobil/Dashboard/Settings/AboutCard.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAF7FA),
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Hakkımızda",
              style: TextStyle(color: Colors.black, fontSize: 26),
            ),
            SizedBox(
              width: 10,
            ),
            Image.asset(
              "assets/information.png",
              height: 26,
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.grey,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
        ),
      ),
      body: ListView(
        children: [
          AboutCard(
            asset: "logo2",
            desc:
            """Doğal Afet Mobil Uygulaması, kullanıcının yakını olan kişilerle bağlantıda kalmasını sağlayan bir mobil uygulamadır. Kullanıcıya SOS uyarıları aracılığıyla canlı konumunu kişilerle paylaşma seçeneği sunar ve kullanıcının acil servislere erişmesini sağlar. Kişisel arkadaşınızdır.""",            subtitle: "Innovia Mind",
            title: "Doğal Afet Mobil Uygulaması",
            sizeFactor: 1.8,
          ),

          AboutCard(
            asset: "cui",
            desc:
                """ Furkan Karazeybek, Karan Berk Kuthan""",
            subtitle: "Innovia Mind - MaxDevs Takımı Teknofest 2022 ve Antalya İnovasyon Yarışması",
            title: "Innovia Mind",
            sizeFactor: 2.5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 5,
              child: ListTile(
                  onTap: () {
                    showLicences(context);
                  },
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey[100],
                    child: Center(
                      child: Image.asset("assets/card.png", height: 30),
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                  title: Text("Lisans")),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Expanded(
                child: Divider(
                  indent: 10,
                  endIndent: 10,
                ),
              ),
              Text("© 2022 Innovia Mind Tüm Hakları Saklıdır."),
              Expanded(
                child: Divider(
                  indent: 10,
                  endIndent: 10,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }

  showLicences(context) {
    showAboutDialog(
        context: context,
        applicationVersion: "1.0.0",
        applicationIcon: Image.asset(
          "assets/logo2.png",
          height: 40,
        ),
        applicationName: "Doğal Afet Mobil Uygulaması",
        applicationLegalese:
            "Innovia Mind - Furkan Karazeybek, Karan Berk Kuthan");
  }
}
