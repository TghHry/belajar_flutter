import 'package:flutter/material.dart';

class TugasEnam extends StatefulWidget {
  const TugasEnam({super.key});

  @override
  State<TugasEnam> createState() => _TugasEnamState();
}

class _TugasEnamState extends State<TugasEnam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF001F54),
      appBar: AppBar(
        backgroundColor: Color(0xFF001F54),
        centerTitle: true,
        title: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {},
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Hello Welcome Back",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Welcome back please\nsign in again",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
                SizedBox(height: 40),
                TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email),
                    hintStyle: TextStyle(color: Colors.white70),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white54),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                TextField(
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Icon(Icons.lock, color: Colors.white),
                    hintStyle: TextStyle(color: Colors.white70),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white54),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                //login button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      //handle login
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF001F54),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.white24)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "or",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.white24)),
                  ],
                ),
                //facebook
                

              ],
            ),
          ),
        ),
      ),
    );
  }
}
