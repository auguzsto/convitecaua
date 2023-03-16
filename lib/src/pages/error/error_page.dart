import 'package:convitecaua/src/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Container background
      body: Container(
        padding: const EdgeInsets.all(22),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Images.background),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              //Container guest confirmed
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.red),
                  color: Colors.red.shade50,
                ),
                child: Column(
                  children: [
                    Text(
                      "Ocorreu um problema.",
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                            color: Colors.red,
                            fontSize: 26,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Divider(),
                    Text(
                      "Cara, o número do seu celular já foi confirmado. Tá com amnésia, doidão? kkkkkkkkk Qualquer coisa fala comigo ou com a Bruna. Tamo junto.",
                      style: GoogleFonts.roboto(
                        textStyle:
                            const TextStyle(color: Colors.red, fontSize: 18),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
