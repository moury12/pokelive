import '../../../../src_export.dart';
class SetupProductItem extends StatelessWidget {
final String name, price;
const SetupProductItem({super.key, required this.name, required this.price});
@override
Widget build(BuildContext context) {
return Container(
width: 100, margin: const EdgeInsets.only(right: 12),
child: Column(
children: [
Stack(
children: [
const CustomNetworkImage(imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff', height: 80, width: 80, radius: 40),
Positioned(top: 0, right: 0, child: Icon(Icons.delete, color: Colors.red, size: 18)),
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
height: 80, width: 80,
decoration: BoxDecoration(border: Border.all(color: AppColors.kTextColor, style: BorderStyle.none), borderRadius: BorderRadius.circular(40), color: Colors.white10),
child: const Icon(Icons.add, color: AppColors.kTextColor),
);
}
}
class LiveStatusBadge extends StatelessWidget {
final String timer, viewers;
const LiveStatusBadge({super.key, required this.timer, required this.viewers});
@override
Widget build(BuildContext context) {
return Container(
padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
decoration: BoxDecoration(color: Colors.black45, borderRadius: BorderRadius.circular(20)),
child: Row(children: [
const Icon(Icons.storefront, size: 16, color: Colors.white),
space4W,
const CustomText('Sneaker Head', fontSize: 12),
space8W,
Container(padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2), color: Colors.red, child: CustomText('● Live $timer', fontSize: 10)),
space4W,
CustomText(viewers, fontSize: 10),
]),
);
}
}
class LivePurchaseToast extends StatelessWidget {
final String user, product, amount;
const LivePurchaseToast({super.key, required this.user, required this.product, required this.amount});
@override
Widget build(BuildContext context) {
return Container(
padding: const EdgeInsets.all(8),
decoration: BoxDecoration(color: Colors.black.withValues(alpha: 0.6), borderRadius: BorderRadius.circular(20)),
child: Row(children: [
const Icon(Icons.celebration, color: AppColors.kAccentColor, size: 16),
space8W,
Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
CustomText('$user bought $product!', fontSize: 10, color: AppColors.kAccentColor),
CustomText('Transaction confirmed $amount', fontSize: 8, color: AppColors.kGreyTextColor),
]),
]),
);
}
}
class LiveChatItem extends StatelessWidget {
const LiveChatItem({super.key, required this.msg});
final dynamic msg;
@override
Widget build(BuildContext context) {
return Container(
margin: const EdgeInsets.only(bottom: 8),
padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
decoration: BoxDecoration(color: Colors.black.withValues(alpha: 0.4), borderRadius: BorderRadius.circular(8)),
child: Row(mainAxisSize: MainAxisSize.min, children: [
CustomText('${msg.username}: ', fontWeight: FontWeight.bold, fontSize: 12),
CustomText(msg.message, fontSize: 12),
]),
);
}
}
class CurrentStreamProductCard extends StatelessWidget {
const CurrentStreamProductCard({super.key});
@override
Widget build(BuildContext context) {
return Container(
padding: const EdgeInsets.all(12),
decoration: BoxDecoration(color: Colors.black.withValues(alpha: 0.6), borderRadius: BorderRadius.circular(16)),
child: const Row(children: [
CustomNetworkImage(imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff', height: 60, width: 60, radius: 8),
space12W,
Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
CustomText('Nike Sneaker', variant: TextVariant.titleSmall),
CustomText('£2,500', variant: TextVariant.titleLarge),
CustomText('PSA 10 Gem Mint. Extremely rare shadowless...', fontSize: 8, color: AppColors.kGreyTextColor, maxLines: 2),
])),
]),
);
}
}
class ProductSelectionModal extends StatelessWidget {
const ProductSelectionModal({super.key});
@override
Widget build(BuildContext context) {
return Container(
padding: AppPadding.getPadding12(context),
decoration: const BoxDecoration(color: Color(0xFF1A1A1A), borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
child: Column(children: [
Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
const CustomText(AppStaticStrings.selectProductsForStream, variant: TextVariant.titleLarge),
IconButton(onPressed: () => context.pop(), icon: const Icon(Icons.close, color: Colors.red)),
]),
const CustomTextField(hintText: 'Search Product...', prefixIcon: Icon(Icons.search)),
space12H,
Expanded(child: ListView.builder(itemCount: 3, itemBuilder: (context, i) => _SelectableProductItem())),
CustomButton(text: '${AppStaticStrings.addToStream} (5)', onPressed: () => context.pop()),
]),
);
}
}
class _SelectableProductItem extends StatelessWidget {
@override
Widget build(BuildContext context) {
return Container(
margin: const EdgeInsets.only(bottom: 12),
padding: const EdgeInsets.all(8),
decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.05), borderRadius: BorderRadius.circular(12)),
child: Row(children: [
const Icon(Icons.check_box_outline_blank, color: AppColors.kGreyTextColor),
space8W,
const CustomNetworkImage(imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff', height: 60, width: 60, radius: 8),
space12W,
const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
CustomText('Nike Sneaker', variant: TextVariant.titleSmall),
CustomText('£2,500', variant: TextVariant.titleMedium),
])),
const CustomText('Qty: 12', color: AppColors.kGreyTextColor, fontSize: 10),
]),
);
}
}