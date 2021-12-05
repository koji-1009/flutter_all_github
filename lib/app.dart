import 'package:flutter/material.dart';
import 'package:flutter_all_github/view/home.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter all GitHub',
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.indigo,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData.from(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.indigo,
          brightness: Brightness.dark,
        ),
      ),
      home: const HomePage(
        title: 'Flutter Demo Home Page',
      ),
    );
  }
}
