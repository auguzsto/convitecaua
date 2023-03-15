import 'package:convitecaua/src/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmedPage extends StatelessWidget {
  const ConfirmedPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //Container background
      body: Container(
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
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blue),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Text(
                      "Sua presença foi confirmada!",
                      style: GoogleFonts.roboto(
                        textStyle:
                            const TextStyle(color: Colors.blue, fontSize: 18),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Image.network(
                      'https://images.emojiterra.com/twitter/v13.1/512px/1f973.png',
                      width: 50,
                      height: 50,
                    ),
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
