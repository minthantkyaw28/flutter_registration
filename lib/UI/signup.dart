import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ui_prj_1/UI/login.dart';
import '../Storage/shared_preferences_manager.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  //Registration data
  SharedPreferencesManager sharedPreferencesManager =
      SharedPreferencesManager();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          //Logo Text
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 70, left: 30),
            child: const Text(
              "Netflix",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 255, 0, 0),
              ),
            ),
          ),

          //Register Title
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 40, left: 30),
            child: const Text(
              "Register",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),

          //Form group

          //name field
          Container(
            margin: EdgeInsets.only(top: 25),
            alignment: Alignment.center,
            width: 340,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 41, 41, 41),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6.0,
                    offset: Offset(0, 2),
                  )
                ]),
            height: 60,
            child: TextField(
              controller: _nameController,
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 15),
                  hintText: "Name",
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 129, 124, 124),
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),

          //email field
          Container(
            margin: EdgeInsets.only(top: 25),
            alignment: Alignment.center,
            width: 340,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 41, 41, 41),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6.0,
                    offset: Offset(0, 2),
                  )
                ]),
            height: 60,
            child: TextField(
              controller: _emailController,
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 15),
                  hintText: "Email",
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 129, 124, 124),
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),

          //password field
          Container(
            margin: EdgeInsets.only(top: 25),
            alignment: Alignment.center,
            width: 340,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 41, 41, 41),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6.0,
                    offset: Offset(0, 2),
                  )
                ]),
            height: 60,
            child: TextField(
              obscureText: true,
              controller: _passwordController,
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 15),
                  hintText: "Password",
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 129, 124, 124),
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),

          //confirm password field
          Container(
            margin: EdgeInsets.only(top: 25),
            alignment: Alignment.center,
            width: 340,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 41, 41, 41),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6.0,
                    offset: Offset(0, 2),
                  )
                ]),
            height: 60,
            child: TextField(
              obscureText: true,
              controller: _passwordConController,
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 15),
                  hintText: "Confirm Password",
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 129, 124, 124),
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),

          //Register Button
          Container(
            margin: EdgeInsets.only(top: 40),
            width: 340,
            height: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 218, 30, 17),
                  foregroundColor: Color.fromARGB(255, 255, 255, 255),
                ),
                onPressed: () {
                  registerUser();
                },
                child: const Text("Register")),
          )
        ]),
      ),
    );
  }

  //Registration

  void registerUser() async {
    if (_nameController == '' ||
        _emailController == '' ||
        _passwordController == '' ||
        _passwordController == '') {
      Fluttertoast.showToast(
        msg: "Fill all the form fields",
        backgroundColor: Color.fromARGB(255, 255, 0, 0),
        toastLength: Toast.LENGTH_LONG,
      );
    } else if (_passwordController.text == _passwordConController.text) {
      sharedPreferencesManager.saveName(
          key: 'name', value: _nameController.text);
      sharedPreferencesManager.saveEmail(
          key: 'email', value: _emailController.text);
      sharedPreferencesManager.savePassword(
          key: 'password', value: _passwordController.text);

      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return login();
      }));
    } else {
      Fluttertoast.showToast(
        msg: "Check your password",
        backgroundColor: Color.fromARGB(255, 255, 0, 0),
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }
}
