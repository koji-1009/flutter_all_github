import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_all_github/view/tabs/makes.dart';
import 'package:flutter_all_github/view/tabs/reviews.dart';
import 'package:flutter_all_github/view/tabs/settings.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = useState(0);
    final body = useMemoized(
      () => const [
        MakesBody(),
        ReviewsBody(),
        SettingsBody(),
      ],
    );

    return AdaptiveNavigationScaffold(
      appBar: AdaptiveAppBar(
        title: const Text('Home'),
      ),
      selectedIndex: index.value,
      onDestinationSelected: (value) => index.value = value,
      destinations: const [
        AdaptiveScaffoldDestination(
          title: 'Makes',
          icon: Icons.work,
        ),
        AdaptiveScaffoldDestination(
          title: 'Reviews',
          icon: Icons.list,
        ),
        AdaptiveScaffoldDestination(
          title: 'Settings',
          icon: Icons.settings,
        ),
      ],
      body: body[index.value],
    );
  }
}
