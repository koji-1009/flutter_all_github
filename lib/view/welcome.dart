import 'package:flutter/material.dart';
import 'package:flutter_all_github/presenter/app_state_presenter.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WelcomePage extends HookConsumerWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textEditingController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: textEditingController,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final username = textEditingController.text;
          if (username.isEmpty) {
            return;
          }

          final presenter = ref.read(appStateProvider.originProvider);
          await presenter.updateUsername(username);
        },
        tooltip: 'Save',
        child: const Icon(Icons.save),
      ),
    );
  }
}
