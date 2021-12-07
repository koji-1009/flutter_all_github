import 'package:flutter_all_github/model/entity/app_state.dart';
import 'package:flutter_all_github/model/instance/shared_preferences.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _usernameKey = 'username';

final appStateProvider = StateNotifierProvider<AppStatePresenter, AppState>(
  (ref) => AppStatePresenter(
    preferences: ref.read(
      sharedPreferenceProvider,
    ),
  ),
);

class AppStatePresenter extends StateNotifier<AppState> {
  AppStatePresenter({
    required this.preferences,
  }) : super(
          AppState(
            username: preferences.getString(_usernameKey) ?? '',
          ),
        );

  final SharedPreferences preferences;

  Future<void> updateUsername(String username) async {
    await preferences.setString(_usernameKey, username);

    state = state.copyWith(
      username: username,
    );
  }
}
