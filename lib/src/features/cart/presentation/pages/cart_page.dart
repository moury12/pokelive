import '../../../../src_export.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText('My Cart', variant: TextVariant.headlineMedium),
        // leading: BackButton(onPressed: () => context.pop()),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: 2, // Number of store groups
        itemBuilder: (context, groupIndex) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ─── Store Header ───────────────────
              Row(
                children: [
                  const Icon(
                    Icons.check_box_outline_blank,
                    color: AppColors.kGreyTextColor,
                  ),
                  space8W,
                  const Icon(Icons.storefront, color: Colors.white, size: 18),
                  space8W,
                  const CustomText(
                    'Sneaker Head',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              space8H,

              // ─── Store Items ────────────────────
              Column(
                children: [
                  _buildCartItem(),
                  const Divider(color: AppColors.kBorderColor, height: 24),
                  _buildCartItem(),
                  space8H,

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     const CustomText(
                  //       'Shipping Options',
                  //       fontSize: 13,
                  //       color: Colors.white,
                  //     ),
                  //     GestureDetector(
                  //       child: const Row(
                  //         children: [
                  //           CustomText(
                  //             'Select',
                  //             fontSize: 13,
                  //             color: AppColors.kGreyTextColor,
                  //           ),
                  //           Icon(
                  //             Icons.keyboard_arrow_down,
                  //             color: AppColors.kGreyTextColor,
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  Widget _buildCartItem() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.kBorderColor),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 30),
            child: Icon(Icons.check_box, color: Colors.white),
          ),

          const CustomNetworkImage(
            imageUrl:
                'https://images.unsplash.com/photo-1542291026-7eec264c27ff',
            height: 90,
            width: 90,
            radius: 12,
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(
                      'Nike Sneaker',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    ButtonTapWidget(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Icon(
                          Icons.close,
                          color: AppColors.kRedColor,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                const CustomText(
                  'PSA 10 Gem Mint. Extremely rare shadowless edition from the base set. Perfect centering...',
                  fontSize: 10,
                  maxLines: 2,
                  color: AppColors.kGreyTextColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText('£2.500', variant: TextVariant.titleLarge),
                    CartQuantityCounter(
                      count: 0,
                      onIncrement: () {},
                      onDecrement: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: AppColors.kBackgroundColor,
        border: Border(
          top: BorderSide(color: AppColors.kBorderColor, width: 0.5),
        ),
      ),
      child: SafeArea(
        child: Row(
          spacing: 12,
          children: [
            const Icon(
              Icons.check_box_outline_blank,
              color: AppColors.kGreyTextColor,
            ),

            const CustomText('All', fontSize: 14),
            // const Spacer(),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  RichText(
                    text: const TextSpan(
                      text: 'Subtotal: ',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                      children: [
                        TextSpan(
                          text: '\$2720',
                          style: TextStyle(
                            color: AppColors.kAccentColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const CustomText(
                    'Shipping Fee: \$150',
                    fontSize: 10,
                    color: AppColors.kGreyTextColor,
                  ),
                ],
              ),
            ),

            Expanded(
              child: CustomButton(
                text: 'Buy Now(2)',
                onPressed: () => context.push(AppRoutes.checkout),
                isExpanding: false,
                borderRadius: 30,
                backgroundColor: AppColors.kPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
