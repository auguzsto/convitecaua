import 'package:convitecaua/src/supabase/supabase_config.dart';
import 'package:convitecaua/src/themes/app_widget.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseConfig.run();

  runApp(const AppWidget());
}
