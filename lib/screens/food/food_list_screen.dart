import 'package:flutter/material.dart';
import 'package:food_app/widgets/custom_card_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../entities/entities.dart';
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
            return GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 0.8,
              ),
              itemCount: foodListState.foodList.length,
              itemBuilder: (context, index) {
                final food = foodListState.foodList[index];
                return FoodGridItem(food: food);
              },
            );
          }
        },
      ),
    );
  }
}

class FoodGridItem extends StatelessWidget {
  final FoodModel food;

  const FoodGridItem({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.4,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
              child: CachedNetworkImage(
                imageUrl: food.images.isNotEmpty && food.images.first != null
                    ? food.images.first!
                    : 'https://via.placeholder.com/150',
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Center(
                  child: Icon(Icons.error),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              food.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  '\$${food.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.green,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 16.0,
                    ),
                    Text(
                      food.rating.toString(),
                      style: const TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
