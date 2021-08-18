import 'package:flutter/material.dart';
import 'package:flutter_application_1/data_model/DestinationProvider.dart';
import 'package:flutter_application_1/data_model/NotesProvider.dart';
import 'package:flutter_application_1/screens/LoginScreen.dart';
import 'package:provider/provider.dart';

import 'data_model/DescriptionAndOtherProvider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NotesProvider()),
        ChangeNotifierProvider(create: (context) => DestinProvider()),
        ChangeNotifierProvider(create: (context) => DescriptionProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ProviderApp',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
