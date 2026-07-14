import '../../../../src_export.dart';

class LiveStreamPage extends StatelessWidget {
  const LiveStreamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomNetworkImage(
            imageUrl: 'https://images.unsplash.com/photo-1521572267360-ee0c2909d518?q=80&w=1000',
            height: double.infinity,
            width: double.infinity,
          ),
          // Top Header Overlay
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(color: Colors.black45, borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      children: [
                        const CircleAvatar(radius: 18, backgroundImage: NetworkImage('https://i.pravatar.cc/100')),
                        space8W,
                        const Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText('Sneaker Head', fontSize: 12, fontWeight: FontWeight.bold),
                            CustomText('● Live 1.8k', fontSize: 10, color: Colors.red),
                          ],
                        ),
                        space8W,
                      ],
                    ),
                  ),
                  const Spacer(),
                  const _CircleIcon(icon: AppAssets.shoppingCart),
                  space8W,
                  GestureDetector(onTap: () => context.pop(), child: const _CircleIcon(icon: null, customIcon: Icons.close)),
                ],
              ),
            ),
          ),
          // Comments and Product Overlay
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.transparent, Colors.black87]),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _CommentTile(user: 'PokeFan88', text: 'Omgg that card condition is crazy!'),
                  const _CommentTile(user: 'PokeFan88', text: 'Omgg that card'),
                  space16H,
                  const _LiveProductCard(),
                  space16H,
                  const CustomTextField(
                    hintText: 'Write a comment....',
                    fillColor: Colors.black45,
                    suffixIcon: Icon(Icons.send, color: Colors.white),
                    borderRadius: 30,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _CircleIcon extends StatelessWidget {
  final String? icon;
  final IconData? customIcon;
  const _CircleIcon({this.icon, this.customIcon});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(color: Colors.black45, shape: BoxShape.circle),
      child: icon != null ? SvgPicture.asset(icon!, width: 20) : Icon(customIcon, color: Colors.white),
    );
  }
}

class _CommentTile extends StatelessWidget {
  final String user, text;
  const _CommentTile({required this.user, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.circular(20)),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(text: '$user: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: text),
        ]),
      ),
    );
  }
}

class _LiveProductCard extends StatelessWidget {
  const _LiveProductCard();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Row(
            children: [
              const CustomNetworkImage(imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=500', height: 60, width: 60, radius: 8),
        
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText('Nike Sneaker', fontWeight: FontWeight.bold),
                    CustomText('PSA 10 Gem Mint...', fontSize: 10, color: AppColors.kGreyTextColor, maxLines: 2),
                  ],
                ),
              ),
              const CustomText('£2.500', fontWeight: FontWeight.bold),
            ],
          ),
          space12H,
          Row(
            children: [
              Expanded(child: CustomButton(text: 'Add To Cart', onPressed: () {}, isOutlined: true, icon: Icons.shopping_cart)),
              Expanded(child: CustomButton(text: 'Buy Now', onPressed: () {})),
            ],
          )
        ],
      ),
    );
  }
}
