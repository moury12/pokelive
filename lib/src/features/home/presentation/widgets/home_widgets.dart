import '../../../../src_export.dart';

class LiveCard extends StatelessWidget {
  const LiveCard({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              const CustomNetworkImage(
                imageUrl: 'https://images.unsplash.com/photo-1595341888016-a392ef81b7de?q=80&w=500',
                height: 200,
                radius: 16,
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(4)),
                  child: const Row(
                    children: [
                      CircleAvatar(radius: 3, backgroundColor: Colors.white),
                      space4W,
                      CustomText('Live 1.8k', fontSize: 10),
                    ],
                  ),
                ),
              )
            ],
          ),
          space8H,
          const CustomText('Street wear Drops', variant: TextVariant.titleLarge),
          const CustomText('Sneaker', color: AppColors.kGreyTextColor),
          space4H,
          Row(
            children: [
              const CircleAvatar(radius: 12, backgroundImage: NetworkImage('https://i.pravatar.cc/100')),
              space8W,
              const CustomText('Sneaker Head', variant: TextVariant.bodySmall),
            ],
          )
        ],
      ),
    );
  }
}
