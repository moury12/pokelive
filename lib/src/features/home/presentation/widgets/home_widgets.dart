import '../../../../src_export.dart';

class FeaturedEventCard extends StatelessWidget {
  const FeaturedEventCard({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          const CustomNetworkImage(
            imageUrl:
                'https://images.unsplash.com/photo-1595341888016-a392ef81b7de?q=80&w=500',
            height: 200,
            radius: 16,
          ),
          Positioned(
            top: 10,
            left: 10,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.kBackgroundColor.withValues(alpha: .5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(AppStaticStrings.featuredEvent),
                  ),
                ),

                // Spacer(),
                CountdownWidget(
                  endDateTime: DateTime.now().add(const Duration(hours: 1)),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 10,
            // left: 10,
            right: 10,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.kBackgroundColor.withValues(alpha: .2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ButtonTapWidget(
                onTap: onTap,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.arrow_forward, color: AppColors.kTextColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CountdownWidget extends StatelessWidget {
  final DateTime endDateTime;
  const CountdownWidget({super.key, required this.endDateTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.kBackgroundColor.withValues(alpha: .5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CustomText(AppStaticStrings.drawIn),
            space4W,
            CustomText('02:00:00'),
          ],
        ),
      ),
    );
  }
}

class LiveWidget extends StatelessWidget {
  const LiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Row(
        children: [
          CircleAvatar(radius: 3, backgroundColor: Colors.white),
          space4W,
          CustomText('Live 1.8k', fontSize: 10),
        ],
      ),
    );
  }
}

class DefaultGreyCircleContainer extends StatelessWidget {
  final String? asset;
  final IconData? customIcon;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? iconColor;
  const DefaultGreyCircleContainer({
    super.key,
    this.asset,
    this.customIcon,
    this.onTap,
    this.backgroundColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:
            backgroundColor ?? AppColors.kGreyTextColor.withValues(alpha: .2),
        border: Border.all(
          color: backgroundColor ?? AppColors.kBorderColor,
          width: .7,
        ),
        shape: BoxShape.circle,
      ),
      child: ButtonTapWidget(
        onTap: onTap ?? () {},
        shape: CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: asset != null
              ? SvgPicture.asset(
                  asset!,
                  height: 20,
                  colorFilter: ColorFilter.mode(
                    iconColor ?? AppColors.kTextColor,
                    BlendMode.srcIn,
                  ),
                )
              : Icon(
                  customIcon,
                  color: iconColor ?? AppColors.kTextColor,
                  size: 18,
                ),
        ),
      ),
    );
  }
}

class HomeCategoryFilter extends StatelessWidget {
  final String label;
  final String? image;
  final bool isSelected;
  final VoidCallback onTap;

  const HomeCategoryFilter({
    super.key,
    required this.label,
    this.image,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.kPrimaryColor.withValues(alpha: 0.6)
              : AppColors.kGreyTextColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: isSelected
                ? AppColors.kPrimaryColor
                : AppColors.kBorderColor,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            if (image != null) ...[
              CustomNetworkImage(
                imageUrl: image!,
                height: 24,
                width: 24,
                boxShape: BoxShape.circle,
              ),
              space8W,
            ],
            CustomText(
              label,
              color: isSelected ? Colors.white : AppColors.kGreyTextColor,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}

class HomeLiveCard extends StatelessWidget {
  final VoidCallback onTap;
  const HomeLiveCard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                const CustomNetworkImage(
                  imageUrl:
                      'https://images.unsplash.com/photo-1595341888016-a392ef81b7de?q=80&w=500',
                  height: 180,
                  width: double.infinity,
                  radius: 16,
                ),
                const Positioned(top: 8, left: 8, child: LiveWidget()),
                // "Less is More" logo overlay top right (optional based on image)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Opacity(
                    opacity: 0.5,
                    child: SvgPicture.asset(AppAssets.appLogo, height: 15),
                  ),
                ),
              ],
            ),
          ),
          space8H,
          const CustomText(
            'Street wear Drops',
            variant: TextVariant.titleLarge,
            fontWeight: FontWeight.bold,
          ),
          const CustomText(
            'Sneaker',
            color: AppColors.kGreyTextColor,
            variant: TextVariant.bodySmall,
          ),
          space4H,
          Row(
            children: [
              const CustomNetworkImage(
                imageUrl: 'https://i.pravatar.cc/100',
                height: 20,
                width: 20,
                boxShape: BoxShape.circle,
              ),
              space8W,
              const CustomText(
                'Sneaker Head',
                color: AppColors.kGreyTextColor,
                fontSize: 12,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
