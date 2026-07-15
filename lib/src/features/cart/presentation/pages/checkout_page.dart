import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../src_export.dart';

class CheckoutPage extends ConsumerWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedAddress = ref.watch(selectedAddressProvider);

    return Scaffold(
      appBar: AppBar(
        title: const CustomText('Check Out'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(border: Border.all(color: AppColors.kBorderColor), borderRadius: BorderRadius.circular(12)),
              child: selectedAddress == null
                  ? ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.location_off, color: Colors.white),
                      title: const CustomText('No Address Selected', fontSize: 14),
                      trailing: GestureDetector(
                        onTap: () => context.push(AppRoutes.selectAddress),
                        child: const CustomText('Select', color: AppColors.kRedColor),
                      ),
                    )
                  : ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.location_on, color: Colors.white),
                      title: CustomText('${selectedAddress.name}, ${selectedAddress.phone}', fontSize: 14),
                      subtitle: CustomText('${selectedAddress.street}, ${selectedAddress.city}...', fontSize: 12, color: AppColors.kGreyTextColor),
                      trailing: GestureDetector(
                        onTap: () => context.push(AppRoutes.selectAddress),
                        child: const CustomText('Edit', color: AppColors.kRedColor),
                      ),
                    ),
            ),
            space24H,
            const CustomText('Order Summary'),
            _summaryRow('Subtotal', '\$2000.00'),
            _summaryRow('Platform Fee', '\$5.00'),
            _summaryRow('Shipping Fee Total', '\$100.00'),
            const Divider(color: AppColors.kBorderColor),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomButton(
          text: 'Proceed To Pay (\$2105)',
          onPressed: () {
            CustomSnackbar.show(context, 'Payment Successful');
          },
          borderRadius: 30,
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
          CustomText(label, color: AppColors.kGreyTextColor),
          CustomText(value),
        ],
      ),
    );
  }
}
