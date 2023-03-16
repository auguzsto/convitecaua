import 'package:convitecaua/src/constants/images.dart';
import 'package:convitecaua/src/controllers/home_controller.dart';
import 'package:convitecaua/src/pages/home/components/send.dart';
import 'package:convitecaua/src/pages/key/key_page.dart';
import 'package:convitecaua/src/pages/invites_confirmed/invites_confirmed_page.dart';
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
      //Body
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

                      //Title
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Wrap(
                          spacing: 10,
                          children: [
                            Text(
                              '2 anos do Cauã',
                              style: GoogleFonts.pacifico(
                                textStyle: const TextStyle(fontSize: 41),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Local
                      Container(
                        padding: const EdgeInsets.all(8),
                        color: const Color.fromRGBO(237, 229, 216, 1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: const [
                            Text(
                              "Local:",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Salão Quatro Estações, Estr. Paciência, Cosmos",
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 2),

                      //Data
                      Container(
                        padding: const EdgeInsets.all(8),
                        color: const Color.fromRGBO(237, 229, 216, 1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: const [
                            Text(
                              "Data:",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "10 de junho ás 19:00, um sábadão",
                            ),
                          ],
                        ),
                      ),

                      //Text inside inivite
                      Container(
                        padding: const EdgeInsets.all(12),
                        child: const Text(
                            "Tudo bem com você? 08 de junho completo 2 anos de vida, gostaria que você participasse da minha festinha para comemorar essa alegria comigo. Confirme a presença para meus pais saberem que podem contar com a sua presença. Valeu."),
                      ),

                      //Call dialog for data
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            isLoading = true;
                          });

                          await Future.delayed(
                            const Duration(seconds: 1),
                            () async {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return const SendDialog();
                                },
                              );
                            },
                          );

                          setState(() {
                            isLoading = false;
                          });
                        },

                        //Confirmed
                        child: Padding(
                          padding: const EdgeInsets.only(top: 68),
                          child: Container(
                            color: const Color.fromRGBO(237, 229, 216, 1),
                            width: size.width,
                            height: 80,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                isLoading == false
                                    ? const Icon(
                                        Icons.card_giftcard_rounded,
                                        color: Color.fromARGB(230, 89, 53, 1),
                                        size: 25,
                                      )
                                    : const Center(
                                        child: SizedBox(
                                          width: 25,
                                          height: 25,
                                          child: CircularProgressIndicator(
                                            color:
                                                Color.fromARGB(230, 89, 53, 1),
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
                                      color: Color.fromARGB(230, 89, 53, 1),
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
            ),
            GestureDetector(
              onDoubleTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => KeyPage(),
              )),
              child: Container(
                height: 50,
                color: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
