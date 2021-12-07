import 'package:flutter_all_github/model/repository/app_state_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appStatePresenterProvider = Provider(
  (ref) => AppStatePresenter(
    repository: ref.watch(appStateRepositoryProvider),
  ),
);

class AppStatePresenter {
  AppStatePresenter({
    required this.repository,
  });

  final AppStateRepository repository;

  String get username => repository.username;

  bool get isAuth => username.isNotEmpty;

  Future<void> updateUsername({
    required String username,
  }) async {
    await repository.updateUsername(username);
  }
}
