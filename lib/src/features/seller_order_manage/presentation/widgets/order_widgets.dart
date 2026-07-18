import '../../../../src_export.dart';

// ─── Seller Order Card ───────────────────────────────────────────────────────
class SellerOrderCard extends StatelessWidget {
  const SellerOrderCard({super.key, required this.tabIndex});

  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: AppPadding.getPadding12(context),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.kBorderColor),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Order ID & Date
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              CustomText('#PL-20246', color: AppColors.kGreyTextColor),
              CustomText(
                'Jun 12, 2026, 04:30 PM',
                fontSize: 12,
                color: AppColors.kGreyTextColor,
              ),
            ],
          ),
          space8H,
          // Buyer Info
          Row(
            children: [
              const CustomNetworkImage(
                imageUrl: 'https://i.pravatar.cc/100',
                height: 40,
                width: 40,
                boxShape: BoxShape.circle,
              ),
              space8W,
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText('Nm Sujon', variant: TextVariant.titleSmall),
                    CustomText(
                      '0181456546465',
                      fontSize: 12,
                      color: AppColors.kGreyTextColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
          space8H,
          // Delivery Address
          const Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 14,
                color: AppColors.kGreyTextColor,
              ),
              space4W,
              Expanded(
                child: CustomText(
                  'Dhaka, Dhaka city North, Mohakhali',
                  fontSize: 12,
                  color: AppColors.kGreyTextColor,
                ),
              ),
            ],
          ),
          space8H,
          // Product Row
          const Row(
            children: [
              CustomNetworkImage(
                imageUrl:
                    'https://images.unsplash.com/photo-1542291026-7eec264c27ff',
                height: 45,
                width: 45,
                radius: 4,
              ),
              space8W,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText('Nike Sneaker', variant: TextVariant.titleSmall),
                    CustomText('£2,500', variant: TextVariant.titleSmall),
                  ],
                ),
              ),
              CustomText(
                '1 item',
                color: AppColors.kGreyTextColor,
                fontSize: 12,
              ),
            ],
          ),
          space8H,
          // Carrier
          const Row(
            children: [
              Icon(
                Icons.local_shipping_outlined,
                size: 14,
                color: AppColors.kGreyTextColor,
              ),
              space4W,
              CustomText(
                'Carrier: Royal Mail',
                fontSize: 12,
                color: AppColors.kGreyTextColor,
              ),
            ],
          ),
          // Action buttons (hidden on Completed tab)
          if (tabIndex != 2) ...[
            space8H,
            CustomButton(
              text: tabIndex == 0
                  ? AppStaticStrings.generateShippingLabel
                  : AppStaticStrings.markAsDelivered,
              onPressed: () {},
            ),
            if (tabIndex == 0) ...[
              space8H,
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      text: AppStaticStrings.markAsShipped,
                      isOutlined: true,
                      textColor: AppColors.kGreyTextColor,
                      borderColor: AppColors.kGreyTextColor,
                      onPressed: () {},
                    ),
                  ),
                  space8W,
                  Expanded(
                    child: CustomButton(
                      text: AppStaticStrings.cancel,
                      isOutlined: true,
                      borderColor: Colors.red,
                      textColor: Colors.red,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ],
        ],
      ),
    );
  }
}

// ─── Tab Chip ────────────────────────────────────────────────────────────────
class OrderTabChip extends StatelessWidget {
  const OrderTabChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.kPrimaryColor
              : AppColors.kBorderColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: CustomText(
          label,
          color: isSelected ? Colors.white : AppColors.kGreyTextColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
