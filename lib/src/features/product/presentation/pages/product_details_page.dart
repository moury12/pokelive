import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../../../../src_export.dart';

final selectedSizeProvider = StateProvider<int>((ref) => 0);
final productQuantityProvider = StateProvider<int>((ref) => 1);

class ProductDetailsPage extends ConsumerWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSize = ref.watch(selectedSizeProvider);
    final quantity = ref.watch(productQuantityProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                const CustomNetworkImage(
                  imageUrl:
                      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=1000',
                  height: 400,
                  width: double.infinity,
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: DefaultGreyCircleContainer(
                    customIcon: Icons.arrow_back,
                    onTap: () => context.pop(),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    'Sneakers',
                    color: Colors.purple,
                    fontSize: 12,
                  ),
                  const CustomText(
                    'Premium Sports Shoe',
                    variant: TextVariant.headlineMedium,
                  ),
                  GestureDetector(
                    onTap: () => context.push(AppRoutes.reviews),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: AppColors.kYellowColor,
                          size: 18,
                        ),
                        const CustomText(' 4.5  |  8 Reviews', fontSize: 12),
                        const Spacer(),
                        const CustomText(
                          'Weight: 1100gm',
                          color: AppColors.kGreyTextColor,
                          fontSize: 12,
                        ),
                      ],
                    ),
                  ),
                  space12H,
                  const CustomText(
                    '£165.00',
                    variant: TextVariant.displaySmall,
                    color: Colors.white,
                  ),
                  space12H,
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.kBorderColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                if (quantity > 1) {
                                  ref
                                      .read(productQuantityProvider.notifier)
                                      .state--;
                                }
                              },
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                            CustomText('$quantity'),
                            IconButton(
                              onPressed: () {
                                ref
                                    .read(productQuantityProvider.notifier)
                                    .state++;
                              },
                              icon: const Icon(Icons.add, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      space12W,
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.kBorderColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const CustomText(
                          'In stock',
                          color: Colors.green,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  space24H,
                  const CustomText('Select Size'),
                  space8H,
                  Row(
                    children: List.generate(4, (index) {
                      final sizes = ['S', 'M', 'L', 'XL'];
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: SizeOption(
                          label: sizes[index],
                          isSelected: selectedSize == index,
                          onTap: () =>
                              ref.read(selectedSizeProvider.notifier).state =
                                  index,
                        ),
                      );
                    }),
                  ),
                  space24H,
                  const CustomText('Shipping Options'),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.kBorderColor),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(Icons.location_on, color: Colors.white),
                      title: CustomText(
                        'Dhaka, Dhaka city North',
                        fontSize: 14,
                      ),
                      trailing: CustomText(
                        'Change',
                        color: AppColors.kGreyTextColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  space24H,
                  GestureDetector(
                    onTap: () => context.push(AppRoutes.storeDetails),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.kBorderColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            backgroundImage: NetworkImage(
                              'https://i.pravatar.cc/100',
                            ),
                          ),
                          space12W,
                          const CustomText('Sneaker Head'),
                          // const Spacer(),
                          // CustomButton(
                          //   text: 'Visit Store',
                          //   onPressed: () =>
                          //       context.push(AppRoutes.storeDetails),
                          //   isExpanding: true,
                          //   isOutlined: true,
                          //   borderRadius: 8,
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              child: CustomButton(
                text: 'Add To Cart',
                onPressed: () {
                  CustomSnackbar.show(context, 'Added to Cart');
                },
                isOutlined: true,
              ),
            ),
            space12W,
            Expanded(
              child: CustomButton(
                isExpanding: true,
                text: 'Buy Now',
                onPressed: () => context.push(AppRoutes.checkout),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
