import 'package:convitecaua/src/pages/home/home_page.dart';
import 'package:convitecaua/src/pages/invites_confirmed/invites_confirmed_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "2 anos do Cauã - Convite individual",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        buttonTheme: ButtonThemeData(
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      home: const InvitesConfirmedPage(),
    );
  }
}
