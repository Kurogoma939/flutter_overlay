import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'home_page.dart';

/// Flutter code sample for [Overlay].

void main() => runApp(
      const ProviderScope(
        child: Application(),
      ),
    );

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Overlay Demo',
      home: HomePage(),
    );
  }
}
