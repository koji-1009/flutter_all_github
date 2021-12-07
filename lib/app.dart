import 'package:flutter/material.dart';
import 'package:flutter_all_github/presenter/app_state_presenter.dart';
import 'package:flutter_all_github/view/home.dart';
import 'package:flutter_all_github/view/welcome.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSetUsername = ref.watch(
      appStateProvider.select(
        (value) => value.username.isNotEmpty,
      ),
    );

    return MaterialApp(
      title: 'Flutter all GitHub',
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.indigo,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData.from(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.indigo,
          brightness: Brightness.dark,
        ),
      ),
      home: isSetUsername ? const HomePage() : const WelcomePage(),
    );
  }
}
