import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../providers/providers.dart';

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
      child: Builder(
        builder: (context) {
          if (foodListState.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (foodListState.error.isNotEmpty) {
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
            return ListView.builder(
              itemCount: foodListState.foodList.length,
              itemBuilder: (context, index) {
                final food = foodListState.foodList[index];
                return ListTile(
                  title: Text(food.name),
                  subtitle: Text(food.description),
                );
              },
            );
          }
        },
      ),
    );
  }
}
