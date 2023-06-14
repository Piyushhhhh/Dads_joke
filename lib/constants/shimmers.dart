import 'package:dads_joke/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget boxShimmer(double width, double hight) {
  return Shimmer.fromColors(
    baseColor: AppColors.containerBackground(),
    highlightColor: AppColors.primary(),
    child: Container(
      height: width,
      width: hight,
      decoration: BoxDecoration(
        color: AppColors.containerBackground(),
        borderRadius: BorderRadius.circular(15),
      ),
    ),
  );
}

Widget shimmerList() {
  return Shimmer.fromColors(
    baseColor: AppColors.background(),
    highlightColor: AppColors.primary(),
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.containerBackground(),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 48.0,
              height: 48.0,
              color: Colors.white,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 8.0,
                    color: Colors.white,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.0),
                  ),
                  Container(
                    width: double.infinity,
                    height: 8.0,
                    color: Colors.white,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.0),
                  ),
                  Container(
                    width: 40.0,
                    height: 8.0,
                    color: Colors.white,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
