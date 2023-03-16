import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HandlersMessages {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> message(
      BuildContext context, String text) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: const EdgeInsets.all(22),
        backgroundColor: Colors.red,
        content: Text(
          text,
          style: GoogleFonts.roboto(
            textStyle: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
