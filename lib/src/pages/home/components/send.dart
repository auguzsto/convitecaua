import 'package:convitecaua/src/controllers/home_controller.dart';
import 'package:convitecaua/src/handlers/handlers_messages.dart';
import 'package:convitecaua/src/pages/confirmed/confirmed_page.dart';
import 'package:convitecaua/src/pages/error/error_page.dart';
import 'package:convitecaua/src/services/util_services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SendDialog extends StatefulWidget {
  const SendDialog({super.key});

  @override
  State<SendDialog> createState() => _SendDialogState();
}

List<String> labels = [
  'Nome e sobrenome',
  'Número celular',
];

List<IconData> iconData = [
  Icons.person,
  Icons.phone_iphone_rounded,
];

final utilService = UtilServices();
final homeController = HomeController();
final handlersMessages = HandlersMessages();
String nameLabel = "";
String phoneLabel = "";

List<TextEditingController> controllers = [
  TextEditingController(),
  TextEditingController(),
];

bool isConfirmed = false;

class _SendDialogState extends State<SendDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      title: Text(
        "Confirme sua presença",
        style: GoogleFonts.roboto(
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              labels.length,
              (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),

                  //Labels
                  child: TextFormField(
                    onChanged: index == 0
                        ? (value) {
                            if (controllers[0].text.length > 8) {
                              setState(() {
                                nameLabel = controllers[0].text;
                              });
                            }
                          }
                        : index == 1
                            ? (value) {
                                setState(() {
                                  phoneLabel = controllers[1].text;
                                });
                              }
                            : null,
                    controller: controllers[index],
                    inputFormatters:
                        index == 1 ? [utilService.maskFormatterPhone] : null,
                    decoration: InputDecoration(
                      prefixIcon: Icon(iconData[index]),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      label: Text(labels[index]),
                    ),
                  ),
                );
              },
            ),
          ),

          //Button
          SizedBox(
            height: 45,
            child: OutlinedButton.icon(
              onPressed: controllers[0].text.length >= 8 &&
                      controllers[1].text.length == 17
                  ? () async {
                      setState(() {
                        isConfirmed = true;
                      });

                      //Send data to confirmed.
                      await Future.delayed(const Duration(seconds: 2),
                          () async {
                        return homeController
                            .confirmed(controllers[0].text, controllers[1].text,
                                context)
                            .then(
                              (value) => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ConfirmedPage(
                                    name: nameLabel,
                                  ),
                                ),
                              ),
                            )
                            .catchError(
                              (error) =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const ErrorPage(),
                              )),
                            );
                      });

                      setState(() {
                        isConfirmed = false;
                      });
                    }
                  : () {},
              icon: isConfirmed == false
                  ? Icon(
                      Icons.card_giftcard_rounded,
                      color: nameLabel.length >= 8 && phoneLabel.length == 17
                          ? Colors.blue
                          : Colors.grey,
                    )
                  : const Center(
                      child: SizedBox(
                        width: 15,
                        height: 15,
                        child: CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                      ),
                    ),
              label: Text(
                isConfirmed == false ? "Estarei presente" : "",
                style: TextStyle(
                  color: nameLabel.length >= 8 && phoneLabel.length == 17
                      ? Colors.blue
                      : Colors.grey,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
