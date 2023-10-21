import 'package:flutter/material.dart';
import 'package:liftu_tech_assignment/Screen/home_screen/home_provider/home_provider.dart';
import 'package:provider/provider.dart';

import 'Screen/home_screen/home_page.dart';


late Size mq;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
       providers: [
    ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
    
  ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:  MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

