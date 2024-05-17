import 'package:flutter/material.dart';
import 'widgets.dart';

class CustomListGridView<T> extends StatelessWidget {
  final List<T> items;
  final bool isLoading;
  final Widget Function(BuildContext context, T item) itemBuilder;
  final int crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final double childAspectRatio;

  const CustomListGridView({
    super.key,
    required this.isLoading,
    required this.items,
    required this.itemBuilder,
    this.crossAxisCount = 2,
    this.crossAxisSpacing = 8.0,
    this.mainAxisSpacing = 8.0,
    this.childAspectRatio = 0.88,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
        childAspectRatio: childAspectRatio,
      ),
      itemCount: isLoading ? 6 : items.length,
      itemBuilder: (context, index) {
        if (isLoading) {
          return const SkeletonGridLoading();
        } else if (items.isEmpty && !isLoading) {
          return const Center(
            child: Text('There is no data yet.'),
          );
        }
        return itemBuilder(context, items[index]);
      },
    );
  }
}
