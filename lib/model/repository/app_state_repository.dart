import 'package:flutter/foundation.dart';
import 'package:flutter_all_github/model/instance/shared_preferences.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _usernameKey = 'username';

final appStateRepositoryProvider = ChangeNotifierProvider(
  (ref) => AppStateRepository(
    preferences: ref.read(
      sharedPreferenceProvider,
    ),
  ),
);

class AppStateRepository extends ChangeNotifier {
  AppStateRepository({
    required this.preferences,
  }) : super();

  final SharedPreferences preferences;

  String get username => preferences.getString(_usernameKey) ?? '';

  Future<void> updateUsername(String username) async {
    await preferences.setString(_usernameKey, username);
    notifyListeners();
  }
}
