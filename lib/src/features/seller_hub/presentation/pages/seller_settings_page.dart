import '../../../../src_export.dart';

class SellerSettingsPage extends StatelessWidget {
  const SellerSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const CustomText(AppStaticStrings.sellerHubSettings,
            variant: TextVariant.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SellerHeaderSection(),
            Padding(
              padding: AppPadding.getPadding12(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(AppStaticStrings.financePayouts,
                      variant: TextVariant.titleLarge),
                  space8H,
                  ProfileMenuItem(
                    title: AppStaticStrings.manageBank,
                    icon: AppAssets.bank,
                    onTap: () {},
                  ),
                  ProfileMenuItem(
                    title: AppStaticStrings.payoutHistory,
                    icon: AppAssets.history,
                    onTap: () => context.push(AppRoutes.payoutHistory),
                  ),
                  space16H,
                  const CustomText(AppStaticStrings.storePreferences,
                      variant: TextVariant.titleLarge),
                  space8H,
                  ProfileMenuItem(
                    title: AppStaticStrings.editStorefront,
                    icon: AppAssets.edit,
                    onTap: () => context.push(AppRoutes.editStorefront),
                  ),
                  ProfileMenuItem(
                    title: AppStaticStrings.myReviews,
                    icon: AppAssets.medalStar,
                    onTap: () {},
                  ),
                  space16H,
                  const CustomText(AppStaticStrings.shippingReturns,
                      variant: TextVariant.titleLarge),
                  space8H,
                  ProfileMenuItem(
                    title: AppStaticStrings.sellerDispatchedAddress,
                    icon: AppAssets.truckFast,
                    onTap: () => context.push(AppRoutes.senderAddress),
                  ),
                  space16H,
                  const CustomText('Preferences',
                      variant: TextVariant.titleLarge),
                  space8H,
                  ProfileMenuItem(
                    title: AppStaticStrings.helpSupport,
                    icon: AppAssets.support24,
                    onTap: () => context.push(AppRoutes.support),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
