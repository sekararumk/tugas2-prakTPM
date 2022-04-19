import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugas2_123190135/feature/homepage_body.dart';
import 'package:tugas2_123190135/tools/common_submit_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // _processLogout();
                    },
                    child: Text('Logout'),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }

 // void _processLogout() async{
 //   SharedPreferences getPref = await _myPref;
 //   await getPref.setBool("loginStatus", false);
 //   Navigator.pushReplacement(
 //       context, new MaterialPageRoute(builder: (context) => HomePageBody())
 //   );
 // }
}
