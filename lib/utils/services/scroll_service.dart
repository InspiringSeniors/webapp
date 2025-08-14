import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScrollService extends GetxService {
  static ScrollService get to => Get.find<ScrollService>();

  final Map<Object, GlobalKey> _keys = {};

  GlobalKey keyFor(Object section) =>
      _keys.putIfAbsent(section, () => GlobalKey());

  Future<void> scrollTo(Object section,
      {Duration duration = const Duration(milliseconds: 500)}) async {
    final key = _keys[section];
    final ctx = key?.currentContext;
    if (ctx == null) return;
    await Scrollable.ensureVisible(
      ctx,
      duration: duration,
      curve: Curves.easeInOutCubic,
      alignment: 0.08,
    );
  }
}



enum AboutSection { vision, story, stateChapters, advisory, team }
enum JoinUsSection { member, volunteer, partner, work }
enum MediaSection { events, newsletters, gallery, blogs }
enum BlogSection { top } // extend as needed


String enumName(Object e) => e.toString().split('.').last;

extension IterableX<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T element) test) {
    for (var element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}



Future<void> scrollToKey(GlobalKey key,
    {Duration duration = const Duration(milliseconds: 500)}) async {
  final ctx = key.currentContext;
  if (ctx == null) return;
  await Scrollable.ensureVisible(
    ctx,
    duration: duration,
    curve: Curves.easeInOutCubic,
    alignment: 0.08,
  );
}

/// Call this in the page after build, with that page's local keys.
void scrollFromParamIfAny<T>(Map<T, GlobalKey> keys) {
  final sec = Get.parameters['section'];
  if (sec == null || sec.isEmpty) return;

  final match = keys.keys.firstWhereOrNull((e) => enumName(e as Object) == sec);
  if (match == null) return;

  WidgetsBinding.instance.addPostFrameCallback((_) {
    scrollToKey(keys[match]!);
  });
}

