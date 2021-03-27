import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  SharedPreferences logindata;
  bool newuser;

  void initState() {
    super.initState();
    checkAlready();
  }

  void checkAlready() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == true) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => MyHomePage()));
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            clipBehavior: Clip.hardEdge,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/bgGreen.jpeg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: Alignment(-0.8, -0.8),
                child: Text('Kerala',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                    ),
                    textAlign: TextAlign.start),
              ),
              Align(
                alignment: Alignment(-0.8, -0.7),
                child: Text(
                  ' Gods own country',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
              Positioned(
                top: 150.0,
                child: Container(
                  width: 400.0,
                  height: 500.0,
                  decoration: new BoxDecoration(
                    color: Color(0xFF151c09).withOpacity(0.7),
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.elliptical(240, 150)),
                    // border: new Border.all(color: Colors.white),
                  ),
                  alignment: Alignment.topCenter,
                  child: new Container(
                    width: 300.0,
                    height: 430.0,
                    // decoration: new BoxDecoration(
                    //   border: new Border.all(color: Colors.white),
                    // ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Container(
                                  width: 300.0,
                                  // decoration: new BoxDecoration(
                                  //   border: new Border.all(color: Colors.white),
                                  // ),
                                  child: Text(
                                    'Welcome to Kerala. Login First',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(0.0),
                                    child: Container(
                                      width: 300.0,
                                      // decoration: new BoxDecoration(
                                      //   border: new Border.all(color: Colors.white),
                                      // ),
                                      child: Theme(
                                        data: new ThemeData(
                                          primaryColor: Colors.white,
                                          accentColor: Colors.white,
                                          hintColor: Colors.white,
                                        ),
                                        child: new TextFormField(
                                          controller: emailController,
                                          style: TextStyle(color: Colors.white),
                                          decoration: new InputDecoration(
                                            labelText: "Enter Email",
                                            fillColor: Colors.white,
                                            border: new OutlineInputBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      25.0),
                                              // borderSide: new BorderSide(
                                              //   color: Colors.white,
                                              // ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                              borderSide: BorderSide(
                                                color: Colors.white,
                                              ),
                                            ),
                                            // focusedBorder: OutlineInputBorder(
                                            //   borderRadius: BorderRadius.circular(25.0),
                                            //   // borderSide: BorderSide(color: Colors.white),
                                            // ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(0.0),
                                    child: Container(
                                      width: 300.0,
                                      // decoration: new BoxDecoration(
                                      //   border: new Border.all(color: Colors.white),
                                      // ),
                                      child: Theme(
                                        data: new ThemeData(
                                          primaryColor: Colors.white,
                                          accentColor: Colors.white,
                                          hintColor: Colors.white,
                                        ),
                                        child: new TextFormField(
                                          autofocus: true,
                                          controller: passController,
                                          style: TextStyle(color: Colors.white),
                                          decoration: new InputDecoration(
                                            labelText: "Enter Password",
                                            fillColor: Colors.white,
                                            border: new OutlineInputBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      25.0),
                                              // borderSide: new BorderSide(
                                              //   color: Colors.white,
                                              // ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                              borderSide: BorderSide(
                                                color: Colors.white,
                                              ),
                                            ),
                                            // focusedBorder: OutlineInputBorder(
                                            //   borderRadius: BorderRadius.circular(25.0),
                                            //   // borderSide: BorderSide(color: Colors.white),
                                            // ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(0.0),
                                    child: Container(
                                      width: 300.0,
                                      // decoration: new BoxDecoration(
                                      //   border: new Border.all(color: Colors.white),
                                      // ),
                                      child: Theme(
                                        data: new ThemeData(
                                          primaryColor: Colors.white,
                                          accentColor: Colors.white,
                                          hintColor: Colors.white,
                                        ),
                                        // ignore: deprecated_member_use
                                        child: new FlatButton(
                                          color: Colors.white,
                                          child: Padding(
                                            padding: EdgeInsets.all(20),
                                            child: Text(
                                              'LOGIN',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(25.0),
                                          ),
                                          onPressed: () {
                                            String userEmail =
                                                emailController.text;
                                            String userPassword =
                                                passController.text;

                                            if (userEmail != '' &&
                                                userPassword != '') {
                                              print('Login Successful');

                                              logindata.setBool('login', true);
                                              logindata.setString(
                                                  'username', userEmail);

                                              // Navigator.pushNamed(
                                              //     context, '/HomePage');

                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          MyHomePage()));

                                              // Navigator.push(
                                              //     context,
                                              //     MaterialPageRoute(
                                              //         builder: (context) =>
                                              //             MyHomePage()));
                                            } else {
                                              Toast.show(
                                                  'Login failed due to isufficient data',
                                                  context,
                                                  duration: Toast.LENGTH_LONG,
                                                  gravity: Toast.BOTTOM);
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
