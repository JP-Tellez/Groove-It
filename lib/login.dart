import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text(
        //     'Login',
        //   ),
        // ),
        body: Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.all(50.0),
            child: Icon(
              Icons.supervised_user_circle,
              size: 100,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Sign In",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Email",
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Password",
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {},
            child: Text(
              "Log In",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.deepPurple,
          ),
          MaterialButton(
            onPressed: () {},
            child: Text("Sign Up"),
          ),
        ],
      ),
    ));
  }
}
