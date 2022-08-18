import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dogalafetmobil/Dashboard/ContactScreens/MyContacts.dart';
import 'package:dogalafetmobil/Dashboard/Dashboard.dart';
import 'package:dogalafetmobil/Dashboard/Splsah/Splash.dart';




void main() async {

  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  }

class MyApp extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doğal Afet Mobil',
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
    );
  }


}
