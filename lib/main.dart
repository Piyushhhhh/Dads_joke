import 'package:dads_joke/constants/strings.dart';
import 'package:dads_joke/dashboard/provider/jokes_provider.dart';
import 'package:dads_joke/dashboard/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<JokesProvider>(
          create: (context) {
            return JokesProvider();
          },
        ),
      ],
      child: MaterialApp(
        title: Strings.appName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider<JokesProvider>(
              create: (context) {
                return JokesProvider();
              },
            ),
          ],
          child: const DashBoard(),
        ),
      ),
    );
  }
}
