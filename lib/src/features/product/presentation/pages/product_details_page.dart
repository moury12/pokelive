import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart' show StateProvider;
import '../../../../src_export.dart';

// UI State
final productQuantityProvider = StateProvider<int>((ref) => 0);

class ProductDetailsPage extends ConsumerWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quantity = ref.watch(productQuantityProvider);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Header Image with Pagination Dots
            Stack(
              children: [
                const CustomNetworkImage(
                  imageUrl:
                      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=1000',
                  height: 400,
                  width: double.infinity,
                ),

                // Pagination Dots
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      space8W,
                      Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Padding(
              padding: AppPadding.getPadding12(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    'Sneakers',
                    color: Colors.purpleAccent,
                    fontSize: 12,
                  ),
                  const CustomText(
                    'Premium Sports Shoe',
                    variant: TextVariant.headlineLarge,
                  ),
                  space8H,
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: AppColors.kYellowColor,
                        size: 18,
                      ),
                      space4W,
                      const CustomText('4.5', fontWeight: FontWeight.bold),
                      ButtonTapWidget(
                        onTap: () => context.push(AppRoutes.reviews),
                        child: CustomText(
                          '  |  0 Reviews',
                          color: AppColors.kAccentColor,
                        ),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_right,
                        color: AppColors.kAccentColor,
                        size: 18,
                      ),
                    ],
                  ),
                  space8H,
                  const CustomText(
                    'weight: 1100gm',
                    color: AppColors.kGreyTextColor,
                    fontSize: 12,
                  ),
                  space8H,
                  const CustomText(
                    '£165.00',
                    variant: TextVariant.displaySmall,
                    fontWeight: FontWeight.bold,
                  ),
                  space8H,

                  // 2. Quantity & In Stock Selector
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.kBorderColor.withOpacity(0.5),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ButtonTapWidget(
                            onTap: () =>
                                ref
                                        .read(productQuantityProvider.notifier)
                                        .state >
                                    0
                                ? ref
                                      .read(productQuantityProvider.notifier)
                                      .state--
                                : null,
                            child: const Icon(
                              Icons.remove,
                              color: AppColors.kGreyTextColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: CustomText('$quantity', fontSize: 16),
                          ),
                          ButtonTapWidget(
                            onTap: () => ref
                                .read(productQuantityProvider.notifier)
                                .state++,
                            child: const Icon(
                              Icons.add,
                              color: AppColors.kGreyTextColor,
                            ),
                          ),
                          const VerticalDivider(
                            color: AppColors.kBorderColor,
                            indent: 8,
                            endIndent: 8,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: CustomText(
                              'In stock',
                              color: AppColors.kAccentColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  space8H,

                  // 3. Shipping Options Card
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.kBorderColor.withOpacity(0.5),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(
                          'Shipping Options',
                          fontWeight: FontWeight.bold,
                        ),
                        space8H,
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: Colors.white,
                            ),
                            space8W,
                            const Expanded(
                              child: CustomText(
                                'Dhaka, Dhaka city North,\nMohakhali',
                                fontSize: 13,
                                height: 1.4,
                              ),
                            ),
                            const CustomText(
                              'Change ',
                              fontSize: 12,
                              color: AppColors.kAccentColor,
                              fontWeight: FontWeight.w700,
                            ),
                            const Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.kAccentColor,
                              size: 20,
                            ),
                          ],
                        ),
                        space16H,
                        const Row(
                          children: [
                            Icon(
                              Icons.local_shipping_outlined,
                              color: Colors.white,
                            ),
                            space12W,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText('Delivery Info', fontSize: 14),
                                CustomText(
                                  'Delivery Time : 1-5 working days',
                                  fontSize: 11,
                                  color: AppColors.kGreyTextColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  space8H,

                  // 4. Store Visit Row
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.kBorderColor.withOpacity(0.5),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const CustomNetworkImage(
                          imageUrl: 'https://i.pravatar.cc/100',
                          height: 40,
                          width: 40,
                          boxShape: BoxShape.circle,
                        ),
                        space12W,
                        const CustomText(
                          'Sneaker Head',
                          fontWeight: FontWeight.bold,
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => context.push(AppRoutes.storeDetails),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.kBorderColor),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const CustomText(
                              'Visit Store',
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  space8H,

                  // 5. Description Section
                  const CustomText('Description', fontWeight: FontWeight.bold),
                  space8H,
                  const CustomText(
                    'This stunning 1999 Base Set Charizard features a high-gloss holofoil pattern and pristine centering. Graded PSA 9 (Mint), it',
                    color: AppColors.kGreyTextColor,
                    height: 1.5,
                    fontSize: 13,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          color: AppColors.kBackgroundColor,
          border: Border(
            top: BorderSide(color: AppColors.kBorderColor, width: 0.5),
          ),
        ),
        child: SafeArea(
          child: Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: 'Add To Cart',
                  onPressed: () => context.push(AppRoutes.cart),
                  isOutlined: true,
                  textColor: AppColors.kAccentColor,
                  borderColor: AppColors.kAccentColor,
                  borderRadius: 30,
                ),
              ),
              space16W,
              Expanded(
                child: CustomButton(
                  text: 'Buy Now',
                  onPressed: () => context.push(AppRoutes.checkout),
                  borderRadius: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
