import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stettlerproapp/screens/liste_clients.dart';
import 'package:stettlerproapp/screens/se_connecter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final theme = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 250, 250, 250),
  fontFamily: GoogleFonts.poppins().fontFamily,
  useMaterial3: true,
  /*textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(fontSize: 26),
      bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
      titleSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w300)),*/
);

void main() {
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const ListeClients(),
    );
  }
}
