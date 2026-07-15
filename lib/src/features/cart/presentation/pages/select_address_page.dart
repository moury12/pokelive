import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../src_export.dart';

class SelectAddressPage extends ConsumerWidget {
  const SelectAddressPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedAddress = ref.watch(selectedAddressProvider);

    final List<Address> sampleAddresses = [
      const Address(
        name: 'Nm Sujon',
        phone: '0125585823',
        street: '39 Thistle Street',
        city: 'Edinburgh',
      ),
      const Address(
        name: 'John Doe',
        phone: '0987654321',
        street: '123 Main Street',
        city: 'London',
      ),
      const Address(
        name: 'Jane Smith',
        phone: '0555123456',
        street: '45 Baker Street',
        city: 'Glasgow',
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Select Address')),
      body: ListView.builder(
        padding: AppPadding.getPadding12H(context),
        itemCount: sampleAddresses.length,
        itemBuilder: (context, index) {
          final address = sampleAddresses[index];
          final isSelected = selectedAddress?.street == address.street;

          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: AppColors.kBorderColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected
                    ? AppColors.kAccentColor
                    : AppColors.kBorderColor,
                width: isSelected ? 2 : 1,
              ),
            ),
            child: ListTile(
              minTileHeight: 20,
              minVerticalPadding: 0,
              contentPadding: const EdgeInsets.all(12),
              leading: Icon(
                isSelected
                    ? Icons.radio_button_checked
                    : Icons.radio_button_off,
                color: isSelected
                    ? AppColors.kAccentColor
                    : AppColors.kGreyTextColor,
              ),
              title: CustomText(
                '${address.name}, ${address.phone}',
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: CustomText(
                  '${address.street}, ${address.city}',
                  fontSize: 12,
                  color: AppColors.kGreyTextColor,
                ),
              ),
              onTap: () {
                ref.read(selectedAddressProvider.notifier).state = address;
                context.pop();
              },
            ),
          );
        },
      ),
    );
  }
}
