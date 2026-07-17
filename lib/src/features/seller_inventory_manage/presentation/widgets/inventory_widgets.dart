import '../../../../src_export.dart';

// ─── Inventory Product Card ──────────────────────────────────────────────────
class InventoryProductCard extends StatelessWidget {
  const InventoryProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.kBorderColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const CustomNetworkImage(
            imageUrl:
                'https://images.unsplash.com/photo-1542291026-7eec264c27ff',
            height: 80,
            width: 80,
            radius: 8,
          ),
          space12W,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText('Nike Sneaker',
                        variant: TextVariant.titleSmall),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppAssets.edit,
                          height: 16,
                          colorFilter: const ColorFilter.mode(
                              AppColors.kTextColor, BlendMode.srcIn),
                        ),
                        space8W,
                        const Icon(Icons.delete_outline,
                            color: Colors.red, size: 18),
                      ],
                    ),
                  ],
                ),
                const CustomText(
                  'PSA 10 Gem Mint. Extremely rare shadowless...',
                  fontSize: 10,
                  color: AppColors.kGreyTextColor,
                  maxLines: 2,
                ),
                space8H,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText('£2,500',
                        variant: TextVariant.titleMedium),
                    CartQuantityCounter(
                      count: 1,
                      onIncrement: () {},
                      onDecrement: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Image Upload Placeholder (large) ───────────────────────────────────────
class ImageUploadPlaceholder extends StatelessWidget {
  const ImageUploadPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.kBorderColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppAssets.camera,
            height: 32,
            colorFilter: const ColorFilter.mode(
                AppColors.kGreyTextColor, BlendMode.srcIn),
          ),
          space8H,
          const CustomText(AppStaticStrings.uploadFrontSide,
              color: AppColors.kGreyTextColor),
        ],
      ),
    );
  }
}

// ─── Small Image Upload Box ──────────────────────────────────────────────────
class SmallImageUploadBox extends StatelessWidget {
  const SmallImageUploadBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.kBorderColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Center(
        child: Icon(Icons.add, color: AppColors.kGreyTextColor),
      ),
    );
  }
}
