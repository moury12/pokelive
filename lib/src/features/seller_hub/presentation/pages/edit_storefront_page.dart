import '../../../../src_export.dart';

class EditStorefrontPage extends StatelessWidget {
  const EditStorefrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const CustomText(AppStaticStrings.editStorefront,
            variant: TextVariant.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StorefrontEditorHeader(
              onBannerTap: () async {
                await AppImagePicker.pickImage(context);
              },
              onAvatarTap: () async {
                await AppImagePicker.pickImage(context);
              },
            ),
            const SizedBox(height: 52), // offset for bottom-positioned avatar
            Padding(
              padding: AppPadding.getPadding12(context),
              child: Column(
                children: [
                  const CustomTextField(
                      title: AppStaticStrings.storeName, hintText: 'Name'),
                  space12H,
                  const CustomTextField(
                    title: AppStaticStrings.storeBio,
                    hintText: 'Up to 150 characters',
                    maxLines: 4,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12)
            .copyWith(bottom: MediaQuery.of(context).viewPadding.bottom + 12),
        child: CustomButton(
          text: AppStaticStrings.saveChanges,
          onPressed: () => context.pop(),
        ),
      ),
    );
  }
}
