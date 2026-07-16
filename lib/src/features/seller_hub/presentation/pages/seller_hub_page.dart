import '../../../../src_export.dart';

class SellerHubPage extends StatelessWidget {
  const SellerHubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const CustomNetworkImage(
              imageUrl: 'https://i.pravatar.cc/100',
              height: 32,
              width: 32,
              boxShape: BoxShape.circle,
            ),
            space8W,
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText('Sneaker Head', variant: TextVariant.titleMedium),
                Row(
                  children: [
                    Icon(Icons.star, color: AppColors.kYellowColor, size: 12),
                    CustomText(
                      ' 4.5  120 Reviews',
                      fontSize: 12,
                      color: AppColors.kGreyTextColor,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        actions: [
          DefaultGreyCircleContainer(
            customIcon: Icons.settings_outlined,
            onTap: () => context.push(AppRoutes.sellerSettings),
          ),
          space12W,
        ],
      ),
      body: SingleChildScrollView(
        padding: AppPadding.getPadding12(context),
        child: Column(
          children: [
            const ReadyToLiveCard(),
            space16H,
            const HubInfoCard(
              title: AppStaticStrings.myInventory,
              subtitle: '15 ${AppStaticStrings.activeItem}',
              icon: AppAssets.inventoryIcon,
            ),
            space12H,
            const HubInfoCard(
              title: 'Orders',
              subtitle: '3 ${AppStaticStrings.ordersToShip}',
              icon: AppAssets.bagIcon,
            ),
            space12H,
            const HubBalanceCard(),
          ],
        ),
      ),
    );
  }
}
