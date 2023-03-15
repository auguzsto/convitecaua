import 'package:convitecaua/src/constants/images.dart';
import 'package:convitecaua/src/pages/confirmed/confirmed_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

bool isLoading = false;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Images.background), fit: BoxFit.cover),
        ),

        //Content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              //Container
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 340,
                  height: 630,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.shade100,
                  ),
                  //Content of inside container
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //Background container.
                      Container(
                        width: size.width,
                        height: 180,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(Images.backgroundContainer),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //Avatar cauã.
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Container(
                                width: 121,
                                height: 121,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Image.asset(
                                  Images.avatarCaua,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      //Text
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Wrap(
                          children: [
                            Text(
                              'Lorem ipsum',
                              style: GoogleFonts.roboto(
                                textStyle: const TextStyle(fontSize: 32),
                              ),
                            ),
                            Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                              style: GoogleFonts.roboto(),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            isLoading = true;
                          });

                          await Future.delayed(
                            const Duration(seconds: 3),
                            () async {
                              await Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const ConfirmedPage(),
                                ),
                              );
                            },
                          );

                          setState(() {
                            isLoading = false;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 86),
                          child: Container(
                            color: Colors.blue,
                            width: size.width,
                            height: 80,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                isLoading == false
                                    ? const Icon(
                                        Icons.card_giftcard_rounded,
                                        color: Colors.white,
                                        size: 25,
                                      )
                                    : const Center(
                                        child: SizedBox(
                                          width: 25,
                                          height: 25,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                const SizedBox(width: 10),
                                Text(
                                  isLoading == false
                                      ? "Confirmar minha presença"
                                      : "",
                                  style: GoogleFonts.roboto(
                                    textStyle: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
