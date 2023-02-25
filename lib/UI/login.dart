import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ui_prj_1/UI/mainpage.dart';
import '../Storage/shared_preferences_manager.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  //Registration data

  final TextEditingController _emailDataController = TextEditingController();
  final TextEditingController _passwordDataController = TextEditingController();

  SharedPreferencesManager sharedPreferencesManager =
      SharedPreferencesManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          //Logo Text
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 70, left: 30),
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
            margin: const EdgeInsets.only(top: 40, left: 30),
            child: const Text(
              "Login",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),

          //Form group

          //email field
          Container(
            margin: const EdgeInsets.only(top: 25),
            alignment: Alignment.center,
            width: 340,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 41, 41, 41),
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
              controller: _emailDataController,
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
            margin: const EdgeInsets.only(top: 25),
            alignment: Alignment.center,
            width: 340,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 41, 41, 41),
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
              controller: _passwordDataController,
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const mainpage(title: 'Netflix Mobile App');
                  }));
                },
                child: const Text("Log In")),
          )
        ]),
      ),
    );
  }

  //DataValidate

  void userDataValidate() async {
    String? email = await sharedPreferencesManager.getData(key: "email");
    String? password = await sharedPreferencesManager.getData(key: "password");

    // print(email);
    // print(password);

    if (email == _emailDataController.text &&
        password == _passwordDataController.text) {
      // ignore: use_build_context_synchronously
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return mainpage(title: 'Netflix');
      }));
    } else {
      Fluttertoast.showToast(
        msg: "Check your email or password",
        backgroundColor: Color.fromARGB(255, 255, 0, 0),
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }
}
