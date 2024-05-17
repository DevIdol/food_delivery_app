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
    final foodListState = ref.watch(foodListProvider);

    useEffect(() {
      if (token != null && token.isNotEmpty) {
        Future.microtask(() {
          ref.read(foodListProvider.notifier).fetchFoodList(token);
        });
      }

      return null;
    }, [token]);

    useEffect(() {
      if (foodListState.error.isNotEmpty && foodListState.foodList.isNotEmpty) {
        final snackBar = SnackBar(
          content: Text(foodListState.error),
        );
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
      }
      return null;
    }, [foodListState.error]);

    Future<void> handleRefresh() async {
      if (token != null && token.isNotEmpty) {
        await ref.read(foodListProvider.notifier).fetchFoodList(token);
      }
    }

    if (foodListState.error.isNotEmpty && foodListState.foodList.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(foodListState.error),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: handleRefresh,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    } else {
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
}
