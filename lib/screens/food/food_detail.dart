import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:food_app/providers/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FoodDetailScreen extends HookConsumerWidget {
  final String foodId;

  const FoodDetailScreen({super.key, required this.foodId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foodListState = ref.watch(foodListProvider);

    final food = foodListState.foodList.firstWhere(
      (food) => food.id == foodId,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(food.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'food_image_${food.id}',
              child: CachedNetworkImage(
                imageUrl: food.images.isNotEmpty && food.images.first != null
                    ? food.images.first!
                    : 'https://via.placeholder.com/150',
                fit: BoxFit.fill,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                food.description,
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '\$${food.price.toStringAsFixed(2)}',
                style: const TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.bold),
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
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
