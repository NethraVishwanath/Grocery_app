import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../utils/constants.dart';
import '../../../../utils/dummy_helper.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_card.dart';
import '../../../components/custom_icon_button.dart';
import '../../../components/product_count_item.dart';
import '../controllers/product_details_controller.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.w), // Consistent horizontal padding
          children: [
            SizedBox(
              height: 330.h,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: SvgPicture.asset(
                      Constants.container,
                      fit: BoxFit.fill,
                      color: theme.cardColor,
                    ),
                  ),
                  Positioned(
                    top: 24.h,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomIconButton(
                          onPressed: () => Get.back(),
                          icon: SvgPicture.asset(
                            Constants.backArrowIcon,
                            fit: BoxFit.none,
                            color: theme.appBarTheme.iconTheme?.color,
                          ),
                        ),
                        CustomIconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            Constants.searchIcon,
                            fit: BoxFit.none,
                            color: theme.appBarTheme.iconTheme?.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 80.h,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      controller.product.image,
                      width: 250.w,
                      height: 225.h,
                    ).animate().fade().scale(
                      duration: 800.ms,
                      curve: Curves.fastOutSlowIn,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h), // Updated spacing for consistency
            Row(
              children: [
                Text(
                  controller.product.name,
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: theme.primaryColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 22.sp, // Responsive font size
                  ),
                ).animate().fade().slideX(
                  duration: 300.ms,
                  begin: -1,
                  curve: Curves.easeInSine,
                ),
                const Spacer(),
                ProductCountItem(product: controller.product).animate().fade(
                  duration: 200.ms,
                ),
              ],
            ),
            SizedBox(height: 8.h), // Updated spacing
            Text(
              '1kg, ${controller.product.price}\$',
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.colorScheme.secondary,
                fontSize: 20.sp, // Responsive font size
              ),
            ).animate().fade().slideX(
              duration: 300.ms,
              begin: -1,
              curve: Curves.easeInSine,
            ),
            SizedBox(height: 8.h), // Updated spacing
            Text(
              controller.product.description,
              style: theme.textTheme.bodyLarge,
            ).animate().fade().slideX(
              duration: 300.ms,
              begin: -1,
              curve: Curves.easeInSine,
            ),
            SizedBox(height: 20.h), // Updated spacing
            GridView.builder(
              shrinkWrap: true,
              primary: false,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 10.h,
                mainAxisExtent: 90.h, // Adjust item height
              ),
              itemCount: DummyHelper.cards.length,
              itemBuilder: (context, index) {
                final card = DummyHelper.cards[index];
                return CustomCard(
                  title: card['title']!,
                  subtitle: card['subtitle']!,
                  icon: card['icon']!,
                ).animate().fade().slideY(
                  duration: 300.ms,
                  begin: 1,
                  curve: Curves.easeInSine,
                );
              },
            ),
            SizedBox(height: 10.h), // Updated spacing
            CustomButton(
              text: 'Add to cart',
              onPressed: () => controller.onAddToCartPressed(),
              fontSize: 16.sp, // Responsive font size
              radius: 50.r,
              verticalPadding: 16.h,
              hasShadow: false,
            ).animate().fade().slideY(
              duration: 300.ms,
              begin: 1,
              curve: Curves.easeInSine,
            ),
            //SizedBox(height: 30.h), // Updated spacing
          ],
        ),
      ),
    );
  }
}
