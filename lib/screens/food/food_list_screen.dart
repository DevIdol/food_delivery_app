import 'package:flutter/material.dart';
import 'package:food_app/widgets/grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../providers/providers.dart';
import 'food_grid_item.dart';

class FoodListScreen extends HookConsumerWidget {
  const FoodListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final token = ref.watch(setAccessTokenStateProvider);

    useEffect(() {
      Future.microtask(() {
        if (token != null && token.isNotEmpty) {
          ref.read(foodListProvider.notifier).fetchFoodList(token);
        }
      });
      return null;
    }, [token]);

    final foodListState = ref.watch(foodListProvider);

    Future<void> handleRefresh() async {
      if (token != null && token.isNotEmpty) {
        await ref.read(foodListProvider.notifier).fetchFoodList(token);
      }
    }

    return RefreshIndicator(
      onRefresh: handleRefresh,
      child: CustomListGridView(
        isLoading: foodListState.isLoading,
        items: foodListState.foodList,
        itemBuilder: (context, food) => FoodGridItem(food: food),
      ),
    );
  }
}
