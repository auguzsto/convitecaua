import 'package:supabase_flutter/supabase_flutter.dart';

class InviteController {
  final supabase = Supabase.instance.client;
  Stream<List> getConfirmed() {
    return supabase.from('confirmed').stream(primaryKey: ['id']);
  }
}
