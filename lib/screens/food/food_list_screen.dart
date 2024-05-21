import 'package:flutter/material.dart';
import 'package:food_app/utils/constants/app_colors.dart';
import 'package:food_app/widgets/grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../providers/providers.dart';
import '../../widgets/widgets.dart';
import 'food_grid_item.dart';

class FoodListScreen extends HookConsumerWidget {
  const FoodListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final token = ref.watch(setAccessTokenStateProvider);
    final foodListState = ref.watch(foodListNotifierProvider);
    final foodListNotifier = ref.read(foodListNotifierProvider.notifier);

    useEffect(() {
      if (token != null && token.isNotEmpty && foodListState.foodList.isEmpty) {
        Future.microtask(() {
          foodListNotifier.fetchFoodList(token);
        });
      }
      return null;
    }, [token, foodListState.foodList.isEmpty]);

    useEffect(() {
      if (foodListState.error.isNotEmpty && foodListState.foodList.isNotEmpty) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showSnackBar(context, foodListState.error);
        });
      }
      return null;
    }, [foodListState.error]);

    Future<void> handleRefresh() async {
      if (token != null && token.isNotEmpty) {
        await foodListNotifier.fetchFoodList(token);
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
      return Scaffold(
        appBar: AppBar(
          title: TextField(
            onChanged: (query) {
              foodListNotifier.updateSearchQuery(query);
            },
            decoration: InputDecoration(
              hintText: 'Search...',
              hintStyle: const TextStyle(color: AppColor.primaryColor),
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: AppColor.darkColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: AppColor.primaryColor,
                  width: 1.4,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            style: const TextStyle(color: AppColor.darkColor),
          ),
          actions: [
            PopupMenuButton<String>(
              icon: const Icon(Icons.filter_list, size: 34),
              onSelected: (category) {
                foodListNotifier.updateSelectedCategory(category);
              },
              itemBuilder: (context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: '',
                  child: Text('All'),
                ),
                const PopupMenuItem<String>(
                  value: 'Burgers',
                  child: Text('Burgers'),
                ),
                const PopupMenuItem<String>(
                  value: 'Pasta',
                  child: Text('Pasta'),
                ),
                const PopupMenuItem<String>(
                  value: 'Main Course',
                  child: Text('Main Course'),
                ),
                const PopupMenuItem<String>(
                  value: 'Italian',
                  child: Text('Italian'),
                ),
              ],
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: handleRefresh,
          child: CustomListGridView(
            isLoading: foodListState.isLoading,
            items: foodListNotifier.filteredFoodList,
            itemBuilder: (context, food) => FoodGridItem(food: food),
          ),
        ),
      );
    }
  }
}
