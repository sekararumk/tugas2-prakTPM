import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tugas2_123190135/tools/common_submit_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas2_123190135/feature/register_page.dart';
import 'package:tugas2_123190135/feature/main_page.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  final Future<SharedPreferences> _myPref = SharedPreferences.getInstance();

  final String usernameDB = "mobile";
  final String passwordDB = "mobile123";

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                  hintText: "Username"
              ),
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Password"
              ),
            ),
            _buildLoginButton(),
            _buildLogoutButton(),
            _buildCheckStatusButton(),
            _buildRegisterButton()
          ],
        ),
      ),
    );
  }

  Widget _buildLoginButton(){
    return CommonSubmitButton(
        labelButton: "Login",
        submitCallback: (value){
          _processLogin();
          return MainPage();
        }
    );
  }

  void _processLogin() async{
    String currentUsername = _usernameController.value.text;
    String currentPassword = _passwordController.value.text;

    if(currentUsername == usernameDB && currentPassword == passwordDB){
      SharedPreferences getPref = await _myPref;
      await getPref.setBool("loginStatus", true);
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => MainPage()));
    }
  }

  Widget _buildRegisterButton(){
    return CommonSubmitButton(
        labelButton: "Register",
        submitCallback: (value){
          //return RegisterPage();
        }
    );
  }

   Widget _buildLogoutButton(){
     return CommonSubmitButton(
         labelButton: "Logout",
         submitCallback: (value){
           _processLogout();
         }
     );
   }

   void _processLogout() async{
     SharedPreferences getPref = await _myPref;
     await getPref.setBool("loginStatus", false);
   }

  Widget _buildCheckStatusButton(){
    return CommonSubmitButton(
        labelButton: "Check Status",
        submitCallback: (value){
          _processCheck();
        }
    );
  }

  void _processCheck() async{
    SharedPreferences getPref = await _myPref;
    bool status = getPref.getBool("loginStatus") ?? false;
    _showToast("Current Status : {$status}", duration: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM);
  }

  void _showToast(String msg, {Toast? duration, ToastGravity? gravity}){
    Fluttertoast.showToast(msg: msg, toastLength: duration, gravity: gravity);
  }
}