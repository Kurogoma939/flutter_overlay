import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'overlay.dart';

class OverlayContents extends HookConsumerWidget {
  const OverlayContents({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final overlayNotifier = ref.watch(overlayNotifierProvider.notifier);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ThumbnailArea(size: size),
          const _DescriptionArea(),
        ],
      ),
    );
  }
}

class _ThumbnailArea extends HookConsumerWidget {
  const _ThumbnailArea({
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final overlayNotifier = ref.watch(overlayNotifierProvider.notifier);

    return Stack(
      children: [
        Container(
          width: size.width,
          height: size.height * 0.28,
          color: Colors.grey,
        ),
        Positioned(
          right: 20,
          top: 30,
          child: IconButton(
            onPressed: () {
              overlayNotifier.removeOverlay();
            },
            icon: const Icon(Icons.close),
          ),
        ),
      ],
    );
  }
}

class _DescriptionArea extends StatelessWidget {
  const _DescriptionArea();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'コンテンツタイトル',
            style: TextStyle(fontSize: 24),
          ),
          Text(
            'コンテンツ説明文',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            '〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜',
            style: TextStyle(fontSize: 16),
            maxLines: 10,
          ),
        ],
      ),
    );
  }
}
