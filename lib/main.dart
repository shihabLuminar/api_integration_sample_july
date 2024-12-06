import 'package:api_integration_sample/controller/facts_screen_controller.dart';
import 'package:api_integration_sample/controller/nationalise_api_screen_controller.dart';
import 'package:api_integration_sample/view/facts_screen/facts_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FactsScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => NationaliseApiScreenController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FactsScreen(),
      ),
    );
  }
}
