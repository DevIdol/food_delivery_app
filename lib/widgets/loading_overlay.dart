import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/providers.dart';

class LoadingOverlay extends StatefulHookConsumerWidget {
  const LoadingOverlay({super.key, required this.child});

  final Widget child;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoadingOverlayState();
}

class _LoadingOverlayState extends ConsumerState<LoadingOverlay> {
  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(loadingProvider);
    return Stack(
      children: [
        widget.child,
        if (isLoading)
          const Opacity(
            opacity: 0.8,
            child: ModalBarrier(dismissible: false, color: Colors.black),
          ),
        if (isLoading)
          const Center(
            child: CircularProgressIndicator(),
          ),
      ],
    );
  }
}
