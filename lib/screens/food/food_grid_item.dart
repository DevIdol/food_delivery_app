import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_app/utils/utils.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../entities/entities.dart';
import '../../widgets/widgets.dart';
import 'food_detail.dart';

class FoodGridItem extends StatelessWidget {
  final FoodModel food;

  const FoodGridItem(
      {super.key, required this.food});

  @override
  Widget build(BuildContext context) {

    return InkWell(
     onTap: () => Get.to(() => FoodDetailScreen(foodId: food.id)),
      child: CustomCard(
        radius: 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.4,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                child: Hero(
                  tag: 'food_image_${food.id}',
                  child: CachedNetworkImage(
                    imageUrl:
                        food.images.isNotEmpty && food.images.first != null
                            ? food.images.first!
                            : 'https://via.placeholder.com/150',
                    fit: BoxFit.fill,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => const Center(
                      child: Icon(Icons.error),
                    ),
                  ),
                ),
              ),
            ),
            const Gap(6),
            Expanded(
              flex: 20,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  food.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 24,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${food.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: AppColor.primaryColorSwatch.shade300,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: AppColor.goldColor,
                          size: 16.0,
                        ),
                        Text(
                          food.rating.toString(),
                          style: const TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
