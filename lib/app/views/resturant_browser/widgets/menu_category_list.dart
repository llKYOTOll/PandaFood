import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pandafood/app/views/resturant_browser/controller/controller.dart';

import '../../../../data/constants/colors.dart';
import '../../../../data/demo_data/demo_data.dart';

class ResturantBrowserMenuCategories extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 36,
      color: Colors.white,
      child: ResturantBrowserMenuCategoryList(),
    );
  }

  @override
  double get maxExtent => 36;

  @override
  double get minExtent => 36;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class ResturantBrowserMenuCategoryList extends StatelessWidget {
  ResturantBrowserMenuCategoryList({Key? key}) : super(key: key);
  final ResturantBrowserController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          controller:
              controller.resturantBrowserMenuCategoryScrollController.value,
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(
                width: 6,
              ),
              ...List.generate(
                demoResturantMenuCategoryList.length,
                (index) => GestureDetector(
                  onTap: () {
                    controller
                        .updateResturantBrowserPageScrollPositionOnMenuCategoryChange(
                            index);
                  },
                  child: Obx(
                    () => Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 2,
                        ),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 30,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                              ),
                              child: Text(
                                demoResturantMenuCategoryList[index]
                                    .categoryName,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color:
                                      controller.selectedMenuCategory.value ==
                                              index
                                          ? Colors.black
                                          : Colors.black.withOpacity(.5),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            controller.selectedMenuCategory.value == index
                                ? Container(
                                    height: 4,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      color: deepDarkPink,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  )
                                : SizedBox.shrink(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
