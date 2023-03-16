import 'package:supabase_flutter/supabase_flutter.dart';

class InviteController {
  final supabase = Supabase.instance.client;
  Future<List> getConfirmed() async {
    return await supabase.from('confirmed').select('*');
  }

  Future<List> getConfirmedByName(String name) async {
    return await supabase.from('confirmed').select('*').like('name', '%$name%');
  }
}
