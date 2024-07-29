import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobail_shop/login.dart';
import 'package:mobail_shop/model/model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => Model(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            centerTitle: true,
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            titleTextStyle:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}
