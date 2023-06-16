// OverlayEntryをProviderで定義
import 'package:flutter/material.dart';
import 'package:flutter_overlay/overlay/overlay_contents.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../main.dart';
import 'overlay_mini_player.dart';

final overlayNotifierProvider =
    ChangeNotifierProvider.autoDispose((ref) => OverlayNotifier());

class OverlayNotifier with ChangeNotifier {
  OverlayEntry? overlayEntry;

  void showOverlayPage() {
    removeOverlay();
    overlayEntry = OverlayEntry(
      builder: (context) {
        return const OverlayContents();
      },
    );
    navigatorKey.currentState?.overlay?.insert(overlayEntry!);
    notifyListeners();
  }

  void showOverlayMiniPlayer() {
    removeOverlay();
    overlayEntry = OverlayEntry(
      builder: (context) {
        return const OverlayMiniPlayer();
      },
    );
    navigatorKey.currentState?.overlay?.insert(overlayEntry!);
    notifyListeners();
  }

  void removeOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    removeOverlay();
  }
}

///
/// 案2 OverlayMixinを使う
///
mixin OverlayMixin {
  late final OverlayEntry _overlayEntry;

  void showOverlay(BuildContext context) {
    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return const OverlayContents();
      },
    );

    Overlay.of(context).insert(_overlayEntry);
  }

  void showMiniPlayer(BuildContext context) {
    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return const OverlayMiniPlayer();
      },
    );

    Overlay.of(context).insert(_overlayEntry);
  }

  void hideOverlay() {
    _overlayEntry.remove();
    _overlayEntry =
        OverlayEntry(builder: (BuildContext context) => Container());
  }
}
