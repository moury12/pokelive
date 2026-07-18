import '../../../../src_export.dart';
import '../../../../src_export.dart';

class LiveStatusBadge extends StatelessWidget {
  final String timer, viewers;
  const LiveStatusBadge({
    super.key,
    required this.timer,
    required this.viewers,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomNetworkImage(
            imageUrl: 'https://i.pravatar.cc/100?u=seller',
            height: 36,
            width: 36,
            boxShape: BoxShape.circle,
          ),
          space8W,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const CustomText(
                'Sneaker Head',
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 1,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 2,
                          backgroundColor: Colors.white,
                        ),
                        space4W,
                        CustomText(
                          'Live $timer',
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                  space8W,
                  CustomText(
                    viewers,
                    fontSize: 10,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ],
              ),
            ],
          ),
          space12W,
        ],
      ),
    );
  }
}

class LiveChatItem extends StatelessWidget {
  const LiveChatItem({super.key, required this.msg});
  final dynamic msg;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(25),
        ),
        child: ButtonTapWidget(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return UserModerationDialog(
                  username: msg.username,
                  avatarUrl: "https://i.pravatar.cc/100?u=seller",
                );
              },
            );
          },
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '${msg.username}: ',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                TextSpan(
                  text: msg.message,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CurrentStreamProductCard extends StatelessWidget {
  const CurrentStreamProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF261C1A).withOpacity(0.9),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          const CustomNetworkImage(
            imageUrl:
                'https://images.unsplash.com/photo-1542291026-7eec264c27ff',
            height: 90,
            width: 90,
            radius: 12,
          ),
          space12W,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomText(
                  'Nike Sneaker',
                  variant: TextVariant.titleMedium,
                ),
                space2H,
                const CustomText('\$2.500', variant: TextVariant.headlineSmall),
                space4H,
                CustomText(
                  'PSA 10 Gem Mint. Extremely rare shadowless edition from the base set. Perfect centering...',
                  fontSize: 10,
                  color: AppColors.kGreyTextColor,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SetupProductItem extends StatelessWidget {
  final String name, price;
  const SetupProductItem({super.key, required this.name, required this.price});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Stack(
            children: [
              const CustomNetworkImage(
                imageUrl:
                    'https://images.unsplash.com/photo-1542291026-7eec264c27ff',
                height: 80,
                width: 80,
                radius: 40,
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColors.kPrimaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
          space4H,
          CustomText(name, fontSize: 10),
          CustomText(price, variant: TextVariant.titleSmall),
        ],
      ),
    );
  }
}

class AddProductDashedBox extends StatelessWidget {
  const AddProductDashedBox({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.kTextColor,
          style: BorderStyle.none,
        ),
        borderRadius: BorderRadius.circular(40),
        color: Colors.white10,
      ),
      child: const Icon(Icons.add, color: AppColors.kTextColor),
    );
  }
}

class LivePurchaseToast extends StatelessWidget {
  final String user, product, amount;
  const LivePurchaseToast({
    super.key,
    required this.user,
    required this.product,
    required this.amount,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.celebration,
            color: AppColors.kAccentColor,
            size: 16,
          ),
          space8W,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                '$user bought $product!',
                fontSize: 10,
                color: AppColors.kAccentColor,
              ),
              CustomText(
                'Transaction confirmed $amount',
                fontSize: 8,
                color: AppColors.kGreyTextColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProductSelectionModal extends StatelessWidget {
  const ProductSelectionModal({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.getPadding12(context),
      decoration: const BoxDecoration(
        color: AppColors.kBackgroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                AppStaticStrings.selectProductsForStream,
                variant: TextVariant.titleLarge,
              ),
              IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.close, color: Colors.red),
              ),
            ],
          ),
          const CustomTextField(
            hintText: 'Search Product...',
            prefixIcon: Icon(Icons.search),
          ),
          space12H,
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 3,
              itemBuilder: (context, i) => _SelectableProductItem(),
            ),
          ),
          CustomButton(
            text: '${AppStaticStrings.addToStream} (5)',
            onPressed: () => context.pop(),
          ),
        ],
      ),
    );
  }
}

class _SelectableProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.kAccentColor.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.check_box_outline_blank,
            color: AppColors.kGreyTextColor,
          ),
          space8W,
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
                CustomText('Nike Sneaker', variant: TextVariant.titleSmall),
                CustomText('£2,500', variant: TextVariant.titleMedium),
              ],
            ),
          ),
          const CustomText(
            'Qty: 12',
            color: AppColors.kGreyTextColor,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}

class UserModerationDialog extends StatelessWidget {
  final String username;
  final String avatarUrl;

  const UserModerationDialog({
    super.key,
    required this.username,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF1E1E1E),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: AppColors.kBorderColor),
      ),
      child: Padding(
        padding: AppPadding.getPadding16(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.close,
                  color: AppColors.kRedColor,
                  size: 20,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Colors.purple, Colors.orange],
                ),
              ),
              child: CustomNetworkImage(
                imageUrl: avatarUrl,
                height: 60,
                width: 60,
                boxShape: BoxShape.circle,
              ),
            ),
            space8H,
            CustomText(username, variant: TextVariant.titleMedium),
            space16H,
            CustomButton(
              text: AppStaticStrings.muteUser,
              icon: Icons.volume_off_outlined,
              isOutlined: true,
              borderColor: AppColors.kBorderColor,
              textColor: AppColors.kTextColor,
              backgroundColor: Colors.white10,
              onPressed: () => Navigator.pop(context),
            ),
            space8H,
            CustomButton(
              text: AppStaticStrings.blockKick,
              icon: Icons.block,
              backgroundColor: AppColors.kRedColor,
              textColor: Colors.white,
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
