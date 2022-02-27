import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharmacie/screens/pharmacien.dart';
import 'package:pharmacie/screens/patient.dart';
import 'package:pharmacie/screens/ordonnance.dart';
import 'package:pharmacie/screens/medicament.dart';
import 'package:pharmacie/screens/add_pharmacien.dart';
import 'package:pharmacie/screens/add_patient.dart';
import 'package:pharmacie/screens/add_medicament.dart';
import 'package:pharmacie/screens/add_ordonnance.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp
    (
    
  options: FirebaseOptions(
  apiKey: "AIzaSyDAA3ju94O-rIlXWFIsZbw2Zt9Nt_cjNbQ",
  authDomain: "pharmacie-ad2e2.firebaseapp.com",
  projectId: "pharmacie-ad2e2",
  storageBucket: "pharmacie-ad2e2.appspot.com",
  messagingSenderId: "601773482523",
  appId: "1:601773482523:web:9e17b54692d7afe4720ebe"
    ),
  );
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black.withOpacity(0),
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
eeeeee
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFFFF6F8)),
        title: "Pharmacie",
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(fontFamily: 'Montserrat'),
        initialRoute: '/pharmacie',
        routes: <String, WidgetBuilder>{
          '/pharmacie': (BuildContext context) => const Pharmacien()
        });
  }
}
