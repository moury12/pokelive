import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../src_export.dart';
import '../controllers/store_controller.dart';

class StoreDetailsPage extends ConsumerWidget {
  const StoreDetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = ref.watch(storeTabProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Header with Background and Profile
            Stack(
              clipBehavior: Clip.none,
              children: [
                GestureDetector(
                  onTap: () => context.push(AppRoutes.storyView), // Story view/Live
                  child: const CustomNetworkImage(
                    imageUrl: 'https://images.unsplash.com/photo-1441986300917-64674bd600d8?q=80&w=1000',
                    height: 220,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: DefaultGreyCircleContainer(
                    customIcon: Icons.arrow_back,
                    onTap: () => context.pop(),
                  ),
                ),
                Positioned(
                  bottom: -30,
                  left: 16,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        clipBehavior: Clip.none,
                        children: [
                          const CustomNetworkImage(
                            imageUrl: 'https://i.pravatar.cc/150?img=12',
                            height: 80,
                            width: 80,
                            boxShape: BoxShape.circle,
                            border: Border.fromBorderSide(BorderSide(color: AppColors.kPrimaryColor, width: 2)),
                          ),
                          Positioned(
                            bottom: -8,
                            child: const LiveWidget(),
                          )
                        ],
                      ),
                      space12W,
                      const Padding(
                        padding: EdgeInsets.only(bottom: 35),
                        child: CustomText('Sneaker Head', variant: TextVariant.titleLarge),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 40),

            // 2. Stats & Bio
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.star, color: AppColors.kYellowColor, size: 16),
                      CustomText(' 4.5  |  120 Reviews', fontSize: 12, color: AppColors.kGreyTextColor),
                    ],
                  ),
                  space8H,
                  const CustomText(
                    'Collector of vintage items. Quick shipping via Royal Mail.',
                    fontSize: 12,
                    color: AppColors.kGreyTextColor,
                  ),
                  space24H,

                  // 3. Custom Tab Switcher
                  Row(
                    children: [
                      _buildTabBtn(ref, 'Store', 0, selectedTab),
                      space12W,
                      _buildTabBtn(ref, 'Reviews', 1, selectedTab),
                    ],
                  ),
                  space16H,

                  // 4. Reactive Content Grid/List
                  selectedTab == 0 ? _buildProductGrid() : _buildReviewList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBtn(WidgetRef ref, String label, int index, int current) {
    bool isActive = index == current;
    return GestureDetector(
      onTap: () => ref.read(storeTabProvider.notifier).state = index,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? AppColors.kPrimaryColor : AppColors.kBorderColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: CustomText(label, color: isActive ? Colors.white : AppColors.kGreyTextColor),
      ),
    );
  }

  Widget _buildProductGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 16,
        childAspectRatio: 0.7,
      ),
      itemCount: 4,
      itemBuilder: (context, index) => const ProductCard(),
    );
  }

  Widget _buildReviewList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) => const ReviewTile(),
    );
  }
}
