import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_application/views/home_page/controller.dart';
import 'package:shopping_application/views/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Controller cartController = Controller();

    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ChangeNotifierProvider(
          create: (context) => cartController,
          child: const HomePage(),
        ));
  }
}
