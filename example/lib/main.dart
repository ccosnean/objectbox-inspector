import 'package:example/db/seeder.dart';
import 'package:example/pages/home_page.dart';
import 'package:example/repos/repos.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Repos.initialize();
  await DatabaseSeeder.seed();

  runApp(const ExampleApp());
}

final lightTheme = ThemeData.light(
  useMaterial3: true,
);

final darkTheme = ThemeData.dark(
  useMaterial3: true,
);

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: darkTheme,
      home: const HomePage(),
    );
  }
}
