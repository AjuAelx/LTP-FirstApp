import 'package:flutter/material.dart';
import 'package:flutter_application_1/Data_Model/DestinationProvider.dart';
import 'package:flutter_application_1/Data_Model/NotesProvider.dart';
import 'package:flutter_application_1/Data_Model/TimeProvider.dart';
import 'package:flutter_application_1/Screens/Home_Screen.dart';
import 'package:flutter_application_1/Screens/LoginScreen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NotesProvider()),
        ChangeNotifierProvider(create: (context) => TimeProvider()),
        ChangeNotifierProvider(create: (context) => DestinProvider()),
        // Provider<NotesProvider>(
        //   create: (context) => NotesProvider(),
        // ),
        // Provider<TimeProvider>(
        //   create: (context) => TimeProvider(),
        // ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ProviderDemo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
