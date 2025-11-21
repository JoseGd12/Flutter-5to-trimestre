import 'package:flutter/material.dart';
import 'pages/agendamiento_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barbería App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const AgendamientoListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}