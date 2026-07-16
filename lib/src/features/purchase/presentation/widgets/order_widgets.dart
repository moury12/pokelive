import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../src_export.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.status,
    required this.statusColor,
    this.actionButton,
    this.showTracking = false,
  });
  final String status;
  final Color statusColor;
  final Widget? actionButton;
  final bool showTracking;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: AppPadding.getPadding12(context),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.kBorderColor),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText('#PL-20246', color: AppColors.kGreyTextColor),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: CustomText(
                  status,
                  color: statusColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const CustomText(
            'Jun 12, 2026, 04:30 PM',
            fontSize: 10,
            color: AppColors.kGreyTextColor,
          ),
          space8H,
          const Row(
            children: [
              Icon(Icons.storefront, size: 16, color: AppColors.kGreyTextColor),
              space8W,
              CustomText('Sneaker Head', variant: TextVariant.titleSmall),
            ],
          ),
          space8H,
          Row(
            children: [
              const CustomNetworkImage(
                imageUrl:
                    'https://images.unsplash.com/photo-1542291026-7eec264c27ff',
                height: 60,
                width: 60,
                radius: 8,
              ),
              space12W,
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      'Nike Sneaker',
                      variant: TextVariant.titleMedium,
                    ),
                    CustomText(
                      'PSA 10 Gem Mint. Extremely rare shadowless...',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      color: AppColors.kGreyTextColor,
                      fontSize: 12,
                    ),
                    space4H,
                    CustomText('£2,500', variant: TextVariant.titleMedium),
                  ],
                ),
              ),
              const CustomText('1 item', color: AppColors.kGreyTextColor),
            ],
          ),
          space8H,
          const CustomText('Royal Mail', color: AppColors.kGreyTextColor),
          if (actionButton != null) ...[space12H, actionButton!],
          if (showTracking) ...[
            space8H,
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  'Tracking ID: EV987654321',
                  color: AppColors.kGreyTextColor,
                  fontSize: 12,
                ),
                Icon(Icons.copy, size: 16, color: AppColors.kGreyTextColor),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class ReviewDialog extends StatefulWidget {
  const ReviewDialog({super.key});

  @override
  State<ReviewDialog> createState() => _ReviewDialogState();
}

class _ReviewDialogState extends State<ReviewDialog> {
  double _currentRating = 1.0;
  final TextEditingController _reviewController = TextEditingController();
  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.kBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: AppColors.kBorderColor),
      ),
      child: Padding(
        padding: AppPadding.getPadding12H(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(
                  AppStaticStrings.ratePurchase,
                  variant: TextVariant.headlineSmall,
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close, color: AppColors.kRedColor),
                ),
              ],
            ),
            const CustomText(
              'How was your experience?',
              color: AppColors.kGreyTextColor,
            ),
            space8H,
            RatingBar.builder(
              initialRating: _currentRating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemPadding: const EdgeInsets.only(right: 4.0),
              unratedColor: AppColors.kGreyTextColor.withValues(alpha: 0.3),
              itemBuilder: (context, _) =>
                  const Icon(Icons.star, color: AppColors.kYellowColor),
              onRatingUpdate: (rating) {
                setState(() {
                  _currentRating = rating;
                });
              },
            ),

            space8H,
            const CustomTextField(
              title: 'Write Your Review (optional)',
              hintText: AppStaticStrings.reviewHint,
              maxLines: 4,
            ),
            space8H,
            CustomButton(
              text: AppStaticStrings.submitReview,
              onPressed: () => Navigator.pop(context),
            ),
            space12H,
          ],
        ),
      ),
    );
  }
}
