import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
      body: const Center(
        child: Text('test'),
      ),
    );
  }
}
