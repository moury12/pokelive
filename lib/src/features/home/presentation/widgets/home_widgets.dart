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
  final String asset;
  final VoidCallback? onTap;
  const DefaultGreyCircleContainer({
    super.key,
    required this.asset,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.kGreyTextColor.withValues(alpha: .2),
        border: Border.all(color: AppColors.kBorderColor, width: .7),
        shape: BoxShape.circle,
      ),
      child: ButtonTapWidget(
        onTap: onTap ?? () {},
        shape: CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: SvgPicture.asset(
            asset,
            height: 20,
            colorFilter: const ColorFilter.mode(
              AppColors.kTextColor,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
