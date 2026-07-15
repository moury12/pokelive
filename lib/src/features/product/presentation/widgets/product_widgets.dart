import '../../../../src_export.dart';

class ReviewTile extends StatelessWidget {
  const ReviewTile({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.kBorderColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(backgroundImage: NetworkImage('https://i.pravatar.cc/150')),
              space12W,
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText('Nm Sujon', fontWeight: FontWeight.bold),
                    CustomText('June 15, 2026', fontSize: 10, color: AppColors.kGreyTextColor),
                  ],
                ),
              ),
              const Icon(Icons.star, color: AppColors.kYellowColor, size: 16),
              const Icon(Icons.star, color: AppColors.kYellowColor, size: 16),
              const Icon(Icons.star, color: AppColors.kYellowColor, size: 16),
              const Icon(Icons.star, color: AppColors.kYellowColor, size: 16),
              const Icon(Icons.star, color: AppColors.kYellowColor, size: 16),
            ],
          ),
          space8H,
          const CustomText(
            'PSA 10 Gem Mint. Extremely rare shadowless edition from the base set. Perfect centering...',
            fontSize: 12, color: AppColors.kGreyTextColor,
          ),
        ],
      ),
    );
  }
}

class SizeOption extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  const SizeOption({super.key, required this.label, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40, width: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.kPrimaryColor : Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: CustomText(label, color: isSelected ? Colors.white : Colors.black),
      ),
    );
  }
}
