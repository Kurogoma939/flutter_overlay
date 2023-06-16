import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OverlayMiniPlayer extends HookConsumerWidget {
  const OverlayMiniPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          decoration: BoxDecoration(border: Border.all()),
          width: size.width,
          height: size.height * 0.1,
          child: Row(
            children: [
              Container(
                height: size.height * 0.1,
                width: size.width * 0.25,
                color: Colors.grey,
              ),
              const SizedBox(width: 16),
              SizedBox(
                width: size.width * 0.75 - 50,
                height: size.height * 0.1,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('コンテンツタイトル'),
                    Text('コンテンツ説明文'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
