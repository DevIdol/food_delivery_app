import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../providers/providers.dart';

class FoodListScreen extends HookConsumerWidget {
  const FoodListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final token = ref.watch(setJWTTokenStateProvider);

    useEffect(() {
      Future.microtask(() {
        if (token != null && token.isNotEmpty) {
          ref.read(foodListProvider.notifier).fetchFoodList(token);
        }
      });
      return null;
    }, [token]);

    final foodListState = ref.watch(foodListProvider);

    final refreshIndicatorState = useState(false);

    Future<void> handleRefresh() async {
      refreshIndicatorState.value = true;
      try {
        await ref.read(foodListProvider.notifier).fetchFoodList(token!);
      } finally {
        refreshIndicatorState.value = false;
      }
    }

    return RefreshIndicator(
        onRefresh: handleRefresh,
        child: foodListState.isLoading && !refreshIndicatorState.value
            ? const Center(child: CircularProgressIndicator())
            : foodListState.error.isNotEmpty
                ? Center(child: Text('Error: ${foodListState.error}'))
                : ListView.builder(
                    itemCount: foodListState.foodList.length,
                    itemBuilder: (context, index) {
                      final food = foodListState.foodList[index];
                      return ListTile(
                        title: Text(food.name),
                        subtitle: Text(
                            food.description ?? 'No description available'),
                      );
                    },
                  ));
  }
}
