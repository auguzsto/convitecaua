import 'package:convitecaua/src/handlers/handlers_messages.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeController {
  final handlersMessages = HandlersMessages();
  final supabase = Supabase.instance.client;

  Future confirmed(String name, String phone, BuildContext context) async {
    await supabase.from('confirmed').insert({
      'name': name,
      'phone': phone,
    });
  }
}
