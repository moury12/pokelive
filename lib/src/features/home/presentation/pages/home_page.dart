import '../../../../src_export.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          spacing: 8,
          children: [
            SvgPicture.asset(AppAssets.appLogo, height: 30),
            const CustomText(
              AppStaticStrings.appName,
              variant: TextVariant.headlineMedium,
            ),
          ],
        ),
        actions: [
          DefaultGreyCircleContainer(
            asset: AppAssets.searchStatus,
            onTap: () {},
          ),
          space4W,
          DefaultGreyCircleContainer(
            asset: AppAssets.notificationBing,
            onTap: () {},
          ),
          space4W,
          DefaultGreyCircleContainer(
            asset: AppAssets.shoppingCart,
            onTap: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: AppPadding.getPadding12H(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [FeaturedEventCard(onTap: () {})],
        ),
      ),
    );
  }
}
