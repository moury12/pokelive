import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../src_export.dart';

class CheckoutPage extends ConsumerWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedAddress = ref.watch(selectedAddressProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Check Out')),
      body: SingleChildScrollView(
        padding: AppPadding.getPadding12H(context),
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─── Address Section ────────────────
            _buildAddressTile(context, selectedAddress),
            // space24H,

            // ─── Store Group 1 ──────────────────
            CartStoreGroup(
              storeName: 'Sneaker Head',
              showCheckboxes: false,
              shippingMethod: 'Royal Shipping',
              onShippingChange: () => _showShippingDialog(context),
              items: const [
                GenericCartItem(
                  showCheckbox: false,
                  imageUrl:
                      'https://images.unsplash.com/photo-1542291026-7eec264c27ff',
                  title: 'Nike Sneaker',
                  price: '£2.500',
                  description:
                      'PSA 10 Gem Mint. Extremely rare shadowless edition...',
                ),
              ],
            ),

            // ─── Store Group 2 ──────────────────
            CartStoreGroup(
              storeName: 'MR.Shoe',
              showCheckboxes: false,
              shippingMethod: 'Evri Shipping',
              onShippingChange: () {},
              items: const [
                GenericCartItem(
                  showCheckbox: false,
                  imageUrl:
                      'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa',
                  title: 'Nike Sneaker',
                  price: '£2.500',
                  description:
                      'PSA 10 Gem Mint. Extremely rare shadowless edition...',
                ),
              ],
            ),

            // ─── Order Summary ──────────────────
            const CustomText('Order Summary', variant: TextVariant.titleLarge),
            // space12H,
            _summaryRow('Subtotal', '\$2000.00'),
            _summaryRow('Platform Fee', '\$5.00'),
            _summaryRow('Shipping Fee Total', '\$100.00'),
            const Divider(color: AppColors.kBorderColor, height: 32),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  Widget _buildAddressTile(BuildContext context, Address? address) {
    return Container(
      // padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.kBorderColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: SizedBox(
        child: ListTile(
          minVerticalPadding: 0,
          minTileHeight: 20,
          contentPadding: EdgeInsets.all(8),
          leading: const Icon(Icons.location_on, color: Colors.white),
          title: CustomText(
            '${address?.name}, ${address?.phone}',
            fontSize: 14,
          ),
          subtitle: CustomText(
            '${address?.street}, ${address?.city}...',
            fontSize: 11,
            color: AppColors.kGreyTextColor,
          ),
          trailing: GestureDetector(
            onTap: () => context.push(AppRoutes.selectAddress),
            child: const CustomText('Edit', color: AppColors.kAccentColor),
          ),
        ),
      ),
    );
  }

  Widget _summaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(label, color: AppColors.kGreyTextColor, fontSize: 14),
          CustomText(value, fontSize: 14),
        ],
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: CustomButton(
        text: 'Proceed To Pay',
        onPressed: () {},
        borderRadius: 30,
        backgroundColor: AppColors.kPrimaryColor,
        // Trailing price like in your image
        icon: null,
      ),
    );
  }

  void _showShippingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1A1A1A),
        titlePadding: EdgeInsets.all(8),
        contentPadding: EdgeInsets.all(8).copyWith(top: 0),

        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomText('Change Shipping Partner'),
            ButtonTapWidget(
              onTap: () => Navigator.pop(context),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Icon(Icons.close, color: Colors.red),
              ),
            ),
          ],
        ),
        content: Column(
          spacing: 8,
          mainAxisSize: MainAxisSize.min,
          children: [
            _shippingOption(
              'Royal mail',
              '£5.00',
              'Expected delivery 2-3 days',
              true,
            ),
            // space12H,
            _shippingOption(
              'Evri',
              '£2.00',
              'Expected delivery 4-7 days',
              false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _shippingOption(
    String title,
    String price,
    String sub,
    bool isSelected,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? Colors.white : AppColors.kBorderColor,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            isSelected ? Icons.check_box : Icons.check_box_outline_blank,
            color: Colors.white,
          ),
          space8W,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [CustomText(title), CustomText(price)],
                ),
                CustomText(sub, fontSize: 10, color: AppColors.kGreyTextColor),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
