import '../../../../src_export.dart';

class SetNewAddressPage extends StatelessWidget {
  const SetNewAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text(AppStaticStrings.setNewShippingAddress),
      ),
      body: SingleChildScrollView(
        padding: AppPadding.getPadding12H(context),
        child: Column(
          spacing: 12,
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    title: AppStaticStrings.firstName,
                    hintText: 'First Name',
                  ),
                ),
                space12W,
                Expanded(
                  child: CustomTextField(
                    title: AppStaticStrings.lastName,
                    hintText: 'Last Name',
                  ),
                ),
              ],
            ),
            // space12H,
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    title: AppStaticStrings.streetAddress,
                    hintText: 'Street name',
                  ),
                ),
                space12W,
                Expanded(
                  child: CustomTextField(
                    title: AppStaticStrings.apartment,
                    hintText: 'Apt, no',
                  ),
                ),
              ],
            ),
            // space12H,
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    title: AppStaticStrings.city,
                    hintText: 'Enter City',
                  ),
                ),
                space12W,
                Expanded(
                  child: CustomTextField(
                    title: AppStaticStrings.postalCode,
                    hintText: 'Enter post code',
                  ),
                ),
              ],
            ),
            // space12H,
            const CustomTextField(
              title: AppStaticStrings.state,
              hintText: 'Enter state name',
            ),
            // space12H,
            const CustomTextField(
              title: AppStaticStrings.contactNumber,
              hintText: 'eg, 01234566',
              // prefixIcon: Padding(
              //   padding: EdgeInsets.all(12.0),
              //   child: CustomText('🇧🇩 ⌵', variant: TextVariant.bodyLarge),
              // ),
            ),
            // const SizedBox(height: 40),
            CustomButton(
              text: AppStaticStrings.saveChanges,
              onPressed: () => context.pop(),
            ),
          ],
        ),
      ),
    );
  }
}
