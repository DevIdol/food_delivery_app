import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final navigationContextProvider = Provider<BuildContext>((ref) {
  final context = navigatorKey.currentContext;
  if (context == null) {
    throw FlutterError('Navigator key context is not yet available');
  }
  return context;
});

