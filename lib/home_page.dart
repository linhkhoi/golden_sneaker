import 'package:flutter/material.dart';
import 'package:golden_sneaker/responsive/mobile_body.dart';
import 'package:golden_sneaker/responsive/responsive_layout.dart';
import 'package:golden_sneaker/responsive/web_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        mobileBody: MobileBody(),
        webBody: WebBody(),
      ),
    );
  }
}
