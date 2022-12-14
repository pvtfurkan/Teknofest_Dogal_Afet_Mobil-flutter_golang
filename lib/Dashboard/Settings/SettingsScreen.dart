import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dogalafetmobil/Dashboard/Settings/About.dart';
import 'package:dogalafetmobil/giris/giris.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool switchValue = false;

  @override
  void initState() {
    super.initState();
    checkService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFCFE),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              "Ayarlar",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Bildirimler",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Expanded(child: Divider())
            ],
          ),
          SwitchListTile(
            onChanged: (val) {
              setState(() {
                switchValue = val;
                controllSafeShake(val);
              });
            },
            value: switchValue,
            secondary: CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: Center(
                  child: Image.asset(
                "assets/shake.png",
                height: 24,
              )),
            ),
            title: Text("G??venli Sars??nt??"),
            subtitle: Text("Cihaz??n??z?? sallayarak uygulamaya girmeden konumuzu ki??ilerinizle payla??mak i??in bu ??zelli??i aktif hale getirin."),
          ),
          Divider(
            indent: 40,
            endIndent: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              "G??venli Sars??nt??, uygulaman??n bir ??zelli??idir. Cihaz?? birka?? defa sallad??????n??zda uygulama bunu dinler. Kullan??c??; afet, k??t?? bir hadise ya??ad??????nda veya kendini rahats??z hissetti??inde SOS uyar??s?? g??ndermenin en uygun karar oldu??unu d??????nd??????nde telefonunu sallayabilir. Uygulamay?? a??madan belirtilen ki??ilere h??zl?? bir ??ekilde SOS uyar??s?? g??ndermek i??in kullan??l??r. Konumunuz ve durumunuz hakk??nda ki??ilerinizin bilgi sahibi olmas??n?? sa??lar.",              style: TextStyle(color: Colors.grey),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Uygulama",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Expanded(child: Divider())
            ],
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AboutUs()));
            },
            title: Text("Hakk??m??zda"),
            leading: CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: Center(
                  child: Image.asset(
                "assets/info.png",
                height: 24,
              )),
            ),
          ),
          ListTile(
            title: Text("Payla??"),
            leading: CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: Center(
                  child: Image.asset(
                "assets/share.png",
                height: 24,
              )),
            ),
          ),
          ListTile(
            onTap: () async{
              GetStorage box = GetStorage();
              await box.remove("kullanici");
              Navigator.pushAndRemoveUntil(
                  context, MaterialPageRoute(builder: (context) => LoginEkrani()), (route) => false);

            },
            title: Text("????k???? Yap"),
            leading: CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: Center(
                  child: Icon(
                    Icons.logout,
                  )
              ),
            ),
          ),

        ],
      ),
    );
  }

  Future<bool> checkService() async {
    bool running = await FlutterBackgroundService().isServiceRunning();
    setState(() {
      switchValue = running;
    });

    return running;
  }

  void controllSafeShake(bool val) async {
    if (val) {
    } else {
      FlutterBackgroundService().sendData(
        {"action": "stopService"},
      );
    }
  }
}
