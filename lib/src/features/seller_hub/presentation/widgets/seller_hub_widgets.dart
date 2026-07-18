import '../../../../src_export.dart';

// ─── Ready to Go Live Card ──────────────────────────────────────────────────
class ReadyToLiveCard extends StatelessWidget {
  const ReadyToLiveCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: AppPadding.getPadding16(context),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xff4F46E5), Color(0xffEF4444)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const CustomText(
            AppStaticStrings.readyToGoLive,
            variant: TextVariant.headlineSmall,
          ),
          space8H,
          const CustomText(
            AppStaticStrings.liveSub,
            textAlign: TextAlign.center,
            color: AppColors.kTextColor,
          ),
          space16H,
          CustomButton(
            text: AppStaticStrings.createStream,
            backgroundColor: Colors.white,
            textColor: AppColors.kPrimaryColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

// ─── Hub Info Card ──────────────────────────────────────────────────────────
class HubInfoCard extends StatelessWidget {
  const HubInfoCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });
  final String title, subtitle, icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.getPadding12(context),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.kBorderColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            // height: 40,
            // colorFilter: const ColorFilter.mode(
            //   AppColors.kTextColor,
            //   BlendMode.srcIn,
            // ),
          ),
          space12W,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(title, variant: TextVariant.titleMedium),
                CustomText(
                  subtitle,
                  color: AppColors.kGreyTextColor,
                  fontSize: 12,
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward,
            color: AppColors.kGreyTextColor,
            size: 18,
          ),
        ],
      ),
    );
  }
}

// ─── Hub Balance Card ───────────────────────────────────────────────────────
class HubBalanceCard extends StatelessWidget {
  const HubBalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.getPadding12(context),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.kBorderColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            AppStaticStrings.availableBalance,
            fontSize: 12,
            color: AppColors.kGreyTextColor,
          ),
          const CustomText(
            '£350.00',
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
          const Row(
            children: [
              Icon(
                Icons.access_time,
                size: 14,
                color: AppColors.kGreyTextColor,
              ),
              space4W,
              CustomText(
                'Pending: £120.00',
                fontSize: 10,
                color: AppColors.kGreyTextColor,
              ),
            ],
          ),
          space12H,
          CustomButton(text: AppStaticStrings.requestPayout, onPressed: () {}),
        ],
      ),
    );
  }
}

// ─── Seller Header Section (used in SellerSettingsPage) ────────────────────
class SellerHeaderSection extends StatelessWidget {
  const SellerHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        const CustomNetworkImage(
          imageUrl:
              'https://images.unsplash.com/photo-1595341888016-a392ef81b7de',
          height: 180,
          width: double.infinity,
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  const CustomNetworkImage(
                    imageUrl: 'https://i.pravatar.cc/100',
                    height: 70,
                    width: 70,
                    boxShape: BoxShape.circle,
                    border: Border.fromBorderSide(
                      BorderSide(color: AppColors.kAccentColor, width: 2),
                    ),
                  ),
                  Positioned(
                    right: -4,
                    bottom: -4,
                    child: DefaultGreyCircleContainer(
                      customIcon: Icons.camera_alt_outlined,
                      onTap: () {},
                      iconColor: AppColors.kBackgroundColor,
                      backgroundColor: AppColors.kAccentColor,
                    ),
                  ),
                ],
              ),
              space8H,
              const CustomText(
                'Sneaker Head',
                variant: TextVariant.headlineSmall,
              ),
              const Row(
                children: [
                  Icon(Icons.star, color: AppColors.kYellowColor, size: 14),
                  CustomText(
                    ' 4.5  120 Reviews',
                    fontSize: 12,
                    color: AppColors.kGreyTextColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ─── Total Withdrawn Card ───────────────────────────────────────────────────
class TotalWithdrawnCard extends StatelessWidget {
  const TotalWithdrawnCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: AppPadding.getPadding16(context),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.kPrimaryColor,
            AppColors.kPrimaryColor.withValues(alpha: 0.5),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            AppStaticStrings.totalWithdrawn,
            fontSize: 12,
            color: AppColors.kGreyTextColor,
          ),
          CustomText('£350.00', fontSize: 32, fontWeight: FontWeight.bold),
          CustomText(
            'Pending: £120.00',
            fontSize: 12,
            color: AppColors.kGreyTextColor,
          ),
        ],
      ),
    );
  }
}

// ─── Payout History Item ────────────────────────────────────────────────────
class PayoutHistoryItem extends StatelessWidget {
  const PayoutHistoryItem({
    super.key,
    required this.amount,
    required this.status,
    required this.statusColor,
  });
  final String amount, status;
  final Color statusColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: AppPadding.getPadding12(context),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.kBorderColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            status == 'Failed'
                ? Icons.error_outline
                : status == 'Processing'
                ? Icons.access_time
                : Icons.check_circle_outline,
            color: statusColor,
          ),
          space12W,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CustomText(
                  '#TR-98375 via Stripe',
                  variant: TextVariant.titleSmall,
                ),
                CustomText(
                  'Visa **** 5678',
                  fontSize: 10,
                  color: AppColors.kGreyTextColor,
                ),
                CustomText(
                  'Jun 12, 2026, 04:30 PM',
                  fontSize: 10,
                  color: AppColors.kGreyTextColor,
                ),
              ],
            ),
          ),
          Column(
            spacing: 6,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomText(amount, variant: TextVariant.titleLarge),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: CustomText(status, color: statusColor, fontSize: 10),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Storefront Editor Header (with image picker callbacks) ─────────────────
class StorefrontEditorHeader extends StatelessWidget {
  const StorefrontEditorHeader({super.key, this.onBannerTap, this.onAvatarTap});
  final VoidCallback? onBannerTap;
  final VoidCallback? onAvatarTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        const CustomNetworkImage(
          imageUrl:
              'https://images.unsplash.com/photo-1595341888016-a392ef81b7de',
          height: 180,
          width: double.infinity,
        ),
        Positioned(
          top: 10,
          right: 10,
          child: DefaultGreyCircleContainer(
            customIcon: Icons.camera_alt_outlined,
            onTap: onBannerTap,
            iconColor: AppColors.kBackgroundColor,
            backgroundColor: AppColors.kAccentColor,
          ),
        ),
        Positioned(
          bottom: -40,
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              const CustomNetworkImage(
                imageUrl: 'https://i.pravatar.cc/100',
                height: 80,
                width: 80,
                boxShape: BoxShape.circle,
                border: Border.fromBorderSide(
                  BorderSide(color: Colors.white, width: 2),
                ),
              ),
              DefaultGreyCircleContainer(
                customIcon: Icons.camera_alt_outlined,
                onTap: onAvatarTap,
                iconColor: AppColors.kBackgroundColor,
                backgroundColor: AppColors.kAccentColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
