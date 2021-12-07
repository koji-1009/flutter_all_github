import 'package:flutter/widgets.dart';
import 'package:flutter_all_github/app.dart';
import 'package:flutter_all_github/model/instance/shared_preferences.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  final pref = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        /// provide SharedPreferences in a synchronous process
        sharedPreferenceProvider.overrideWithValue(pref),
      ],
      child: const App(),
    ),
  );
}
