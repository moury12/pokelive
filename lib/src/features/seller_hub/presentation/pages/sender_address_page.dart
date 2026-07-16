import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../src_export.dart';

final returnSwitchProvider = StateProvider<bool>((ref) => true);

class SenderAddressPage extends ConsumerWidget {
  const SenderAddressPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const CustomText(AppStaticStrings.senderAddress,
            variant: TextVariant.headlineMedium),
      ),
      body: SingleChildScrollView(
        padding: AppPadding.getPadding12(context),
        child: Column(
          children: [
            const CustomText(
              AppStaticStrings.senderAddressSub,
              color: AppColors.kGreyTextColor,
              textAlign: TextAlign.center,
            ),
            space16H,
            const CustomTextField(title: 'Contact Name', hintText: 'Name'),
            space12H,
            const CustomTextField(
              title: AppStaticStrings.contactNumber,
              hintText: 'eg, 01234566',
            ),
            space12H,
            const CustomTextField(
                title: 'Address Line 1', hintText: 'Enter Address'),
            space12H,
            const CustomTextField(
                title: 'Address Line 2', hintText: 'Enter Address'),
            space12H,
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                      title: AppStaticStrings.city, hintText: 'Enter City'),
                ),
                space12W,
                Expanded(
                  child: CustomTextField(
                      title: AppStaticStrings.postalCode,
                      hintText: 'Enter post code'),
                ),
              ],
            ),
            space12H,
            const CustomTextField(
                title: 'Country', hintText: 'Enter Country name'),
            space16H,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: CustomText(AppStaticStrings.useAddressForReturns),
                ),
                Switch.adaptive(
                  value: ref.watch(returnSwitchProvider),
                  onChanged: (v) =>
                      ref.read(returnSwitchProvider.notifier).state = v,
                  activeColor: AppColors.kGreenColor,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12)
            .copyWith(bottom: MediaQuery.of(context).viewPadding.bottom + 12),
        child: CustomButton(
          text: 'Save Address',
          onPressed: () => context.pop(),
        ),
      ),
    );
  }
}
