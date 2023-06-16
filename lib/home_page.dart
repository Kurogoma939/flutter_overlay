import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'overlay/overlay.dart';

class HomePage extends StatefulHookConsumerWidget with OverlayMixin {
  HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final overlayNotifier = ref.watch(overlayNotifierProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Overlay'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                overlayNotifier.showOverlayPage();
              },
              child: const Text('Show OverlayContents'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                overlayNotifier.showOverlayMiniPlayer();
              },
              child: const Text('Show OverlayMiniPlayer'),
            ),
          ],
        ),
      ),
    );
  }
}
