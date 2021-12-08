import 'package:compos/page/searchlist.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:compos/page/qr_create_page.dart';
import 'package:compos/page/qr_scan_page.dart';
import 'package:compos/widget/button_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'QR Code Scanner';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primaryColor: Colors.red,
          scaffoldBackgroundColor: Colors.black,
        ),
        home: const MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
           backgroundColor: Color(0xff050505),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ButtonWidget(
              //   text: 'Create QR Code',
              //   onClicked: () => Navigator.of(context).push(MaterialPageRoute(
              //     builder: (BuildContext context) => QRCreatePage(),
              //   )), key: null,
              // ),
              //   const SizedBox(height: 32),
              ButtonWidget(
                text: 'Search',
                
                onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>searchlist(),
                )), key: null,
              ),
              const SizedBox(height: 32),
              ButtonWidget(
                text: 'Scan QR Code',
                onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => QRScanPage(),
                )),
              ),
            ],
          ),
        ),
      );
}