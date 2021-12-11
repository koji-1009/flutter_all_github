import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const _body = [
  _AlarmBody(),
  _BookBody(),
  _CakeBody(),
];

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = useState(0);

    return AdaptiveNavigationScaffold(
      appBar: AdaptiveAppBar(
        title: const Text('Home'),
      ),
      selectedIndex: index.value,
      onDestinationSelected: (value) => index.value = value,
      destinations: const [
        AdaptiveScaffoldDestination(title: 'Alarm', icon: Icons.alarm),
        AdaptiveScaffoldDestination(title: 'Book', icon: Icons.book),
        AdaptiveScaffoldDestination(title: 'Cake', icon: Icons.cake),
      ],
      body: _body[index.value],
    );
  }
}

class _AlarmBody extends StatelessWidget {
  const _AlarmBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Alarm'),
    );
  }
}

class _BookBody extends StatelessWidget {
  const _BookBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Book'),
    );
  }
}

class _CakeBody extends StatelessWidget {
  const _CakeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Cake'),
    );
  }
}
