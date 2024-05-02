// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_kyc/signup.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
   final TextEditingController _usernameController = TextEditingController();
  
  final TextEditingController _passwordController = TextEditingController();
  

  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         backgroundColor: Color(0xFF03312b),
        body: Container(
          
          margin: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _logo(), 
              _header(context),
              _inputField(context),
             
              _signup(context),
            ],
          ),
        ),
      ),
    );
  }
_logo() {
  return Align(
    alignment: Alignment.topLeft,
    child: Image.asset(
      'assets/images/logo.png',
      width: 100, // Adjust the width as needed
      height: 100, // Adjust the height as needed
    ),
  );
}

  _header(context) {
    return Column(
      children: [
        Text(
          "LOGIN",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,color: Colors.white),
        ),
        Text("Enter your credential to login",style: TextStyle(color: Colors.white),),
      ],
    );
  }

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _usernameController,
          decoration: InputDecoration(

              hintText: "Username",
              fillColor:  Color(0xFF003A31),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none),
             
              filled: true,
              prefixIcon: Icon(Icons.person)),
        ),
        SizedBox(height: 10),
        TextField(
          controller: _passwordController,
          decoration: InputDecoration(
            hintText: "Password",
            fillColor:  Color(0xFF003A31),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            
            filled: true,
            prefixIcon: Icon(Icons.password_outlined),
          ),
          obscureText: true,
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            _validateLogin(context);
          },
          child: Text(
            "Login",
            style: TextStyle(fontSize: 20,color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor:  Color(0xFFEE7A0A),
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
        )
      ],
    );
  }
  _signup(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Dont have an account? ",style: TextStyle(color: Colors.white),),
        TextButton(onPressed: () {  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpScreen()), // Replace LoginPage with the actual name of your login page class
    );
    }, child: Text("Sign Up",
    style: TextStyle(color: Color(0xFFEE7A0A))))
      ],
    );
  }
  void _showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(message),
    duration: Duration(seconds: 2), // Adjust the duration as needed
    
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
void _validateLogin(BuildContext context) {
    String username = _usernameController.text;
    
    String password = _passwordController.text;
   

    if (username.isEmpty || password.isEmpty ) {
      _showSnackBar(context, "Please fill in all fields.");
      return;
    }
}



}