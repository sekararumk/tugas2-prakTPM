import 'package:flutter/material.dart';
import 'package:tugas2_123190135/feature/homepage_body.dart';

class HomePageHome extends StatefulWidget {
  const HomePageHome({Key? key}) : super(key: key);

  @override
  State<HomePageHome> createState() => _HomePageHomeState();
}

class _HomePageHomeState extends State<HomePageHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePageBody(),
    );
  }
}