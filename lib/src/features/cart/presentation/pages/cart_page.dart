import '../../../../src_export.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText('My Cart'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: 2,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.kBorderColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.check_box, color: Colors.white),
                    space8W,
                    const Icon(Icons.store, color: Colors.white, size: 16),
                    space4W,
                    const CustomText('Sneaker Head', fontSize: 14),
                  ],
                ),
                space12H,
                Row(
                  children: [
                    const CustomNetworkImage(
                      imageUrl:
                          'https://images.unsplash.com/photo-1542291026-7eec264c27ff',
                      height: 80,
                      width: 80,
                      radius: 8,
                    ),
                    space12W,
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText('Nike Sneaker'),
                          CustomText(
                            'PSA 10 Gem Mint...',
                            fontSize: 10,
                            color: AppColors.kGreyTextColor,
                          ),
                          CustomText('£2.500', fontWeight: FontWeight.bold),
                        ],
                      ),
                    ),
                    const Icon(Icons.close, color: Colors.red, size: 20),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText('Subtotal: \$2720', fontSize: 14),
                CustomText(
                  'Shipping Fee: \$150',
                  fontSize: 12,
                  color: AppColors.kGreyTextColor,
                ),
              ],
            ),
            // CustomButton(text: 'Buy Now(2)', onPressed: () => context.push(AppRoutes.checkout), isExpanding: false),
          ],
        ),
      ),
    );
  }
}
