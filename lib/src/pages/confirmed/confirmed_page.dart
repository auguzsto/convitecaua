import 'package:convitecaua/src/constants/images.dart';
import 'package:convitecaua/src/pages/home/components/send.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmedPage extends StatelessWidget {
  ConfirmedPage({
    super.key,
    this.name,
  });

  String? name;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                  border: Border.all(color: Colors.green),
                  color: Colors.green.shade50,
                ),
                child: Column(
                  children: [
                    Text(
                      "Presença confirmada.",
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                            color: Colors.green,
                            fontSize: 26,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Divider(),
                    Text(
                      "Oi, $nameLabel, muito obrigado por se fazer presente nesse momento da minha vida. Meu papai pediu para avisar que não haverá bebiba alcoólica no local, mas quem quiser tomar seu gelinho, pode levar, incluse ele já avisou minha mamãe que vai beber. Então, te encontro lá, valeu!",
                      style: GoogleFonts.roboto(
                        textStyle:
                            const TextStyle(color: Colors.green, fontSize: 18),
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
