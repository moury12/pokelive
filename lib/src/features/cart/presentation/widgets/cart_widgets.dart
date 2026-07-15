import '../../../../src_export.dart';

class CartQuantityCounter extends StatelessWidget {
  final int count;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CartQuantityCounter({
    super.key,
    required this.count,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: AppColors.kBorderColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.kBorderColor.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ButtonTapWidget(
            onTap: onDecrement,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Icon(
                Icons.remove,
                size: 16,
                color: AppColors.kGreyTextColor,
              ),
            ),
            // constraints: const BoxConstraints(minWidth: 30, minHeight: 30),
          ),
          CustomText('$count', fontSize: 14),
          ButtonTapWidget(
            onTap: onIncrement,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Icon(
                Icons.add,
                size: 16,
                color: AppColors.kGreyTextColor,
              ),
            ),
            // constraints: const BoxConstraints(minWidth: 30, minHeight: 30),
          ),
        ],
      ),
    );
  }
}

class CartStoreGroup extends StatelessWidget {
  final String storeName;
  final List<Widget> items;
  final bool showCheckboxes;
  final String? shippingMethod;
  final VoidCallback? onShippingChange;

  const CartStoreGroup({
    super.key,
    required this.storeName,
    required this.items,
    this.showCheckboxes = true,
    this.shippingMethod,
    this.onShippingChange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (showCheckboxes) ...[
              const Icon(
                Icons.check_box_outline_blank,
                color: AppColors.kGreyTextColor,
              ),
              space8W,
            ],
            const Icon(Icons.storefront, color: Colors.white, size: 18),
            space8W,
            CustomText(storeName, fontSize: 14, fontWeight: FontWeight.bold),
          ],
        ),
        space8H,
        Container(
          // padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.kBorderColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              ...items,
              if (shippingMethod != null) ...[
                const Divider(color: AppColors.kBorderColor, height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(shippingMethod!, fontSize: 13),
                    GestureDetector(
                      onTap: onShippingChange,
                      child: const Row(
                        children: [
                          CustomText(
                            'Change',
                            fontSize: 13,
                            color: AppColors.kAccentColor,
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: AppColors.kAccentColor,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
        space16H,
      ],
    );
  }
}

class GenericCartItem extends StatelessWidget {
  final bool showCheckbox;
  final String imageUrl;
  final String title;
  final String price;
  final String description;

  const GenericCartItem({
    super.key,
    this.showCheckbox = true,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.kBorderColor.withValues(alpha: 0.5),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showCheckbox)
            const Padding(
              padding: EdgeInsets.only(top: 30),
              child: Icon(Icons.check_box, color: Colors.white),
            ),
          CustomNetworkImage(
            imageUrl: imageUrl,
            height: 80,
            width: 80,
            radius: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      title,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    const Icon(
                      Icons.close,
                      color: AppColors.kRedColor,
                      size: 18,
                    ),
                  ],
                ),
                CustomText(
                  description,
                  fontSize: 10,
                  maxLines: 2,
                  color: AppColors.kGreyTextColor,
                ),
                space8H,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(price, variant: TextVariant.titleLarge),
                    CartQuantityCounter(
                      count: 0,
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
