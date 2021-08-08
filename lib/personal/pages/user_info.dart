import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  final String name;
  final String email;
  final String password;
  final String location;
  const UserInfo({
    Key? key,
    this.name = "",
    this.email = "",
    this.password = "",
    this.location = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Text("Edit"),
            SizedBox(height: 30),
            buildTextField("Full Name", "your full name", false),
            buildTextField("Email", "email@gmail.com", false),
            buildTextField("Password", "pass123", true),
            buildTextField("Location", "home address", false),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, String content, bool isPassword) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          suffixIcon: isPassword ? IconButton(
            onPressed: (){}, 
            icon: Icon(
              Icons.remove_red_eye_outlined,
              color: Colors.blueAccent
            )): null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: label,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: content,
            hintStyle: TextStyle(fontSize: 16, color: Colors.black)),
      ),
    );
  }
}
