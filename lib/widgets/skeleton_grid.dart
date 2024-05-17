import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../assets/assets.gen.dart';
import '../utils/utils.dart';
import 'widgets.dart';

class SkeletonGridLoading extends StatelessWidget {
  const SkeletonGridLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
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
                child: Image.asset(Assets.images.loadingImage.path,
                    fit: BoxFit.fill),
              ),
            ),
            const Gap(6),
            const Expanded(
              flex: 20,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Main Loading Title',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),
            const Expanded(
              flex: 24,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sub Title',
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: AppColor.goldColor,
                          size: 18.0,
                        ),
                        Text(
                          'Rating',
                          style: TextStyle(
                            fontSize: 14.0,
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
