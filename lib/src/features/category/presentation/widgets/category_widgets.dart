import '../../../../src_export.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String liveCount;
  final bool isLarge;
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.liveCount,
    this.isLarge = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          CustomNetworkImage(
            imageUrl: imageUrl,
            height: isLarge ? 180 : 140,
            width: double.infinity,
            radius: 16,
          ),
          // Gradient Overlay for text readability
          Container(
            height: isLarge ? 180 : 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(4)),
              child: CustomText('● $liveCount live', fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 12,
            left: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isLarge) const CustomText('Trending', fontSize: 10, color: Colors.purpleAccent),
                CustomText(title, variant: TextVariant.titleLarge, fontWeight: FontWeight.bold),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomNetworkImage(
          imageUrl: 'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?q=80&w=500',
          height: 160,
          radius: 16,
        ),
        space8H,
        const CustomText('Sports Shoe', fontWeight: FontWeight.bold),
        const CustomText('Best sneaker in town ........', fontSize: 10, color: AppColors.kGreyTextColor),
        space4H,
        const CustomText('£50.00', fontWeight: FontWeight.bold, color: AppColors.kRedColor),
      ],
    );
  }
}
