import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../src_export.dart';


class CategoryDetailsPage extends ConsumerWidget {
  const CategoryDetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = ref.watch(categoryTabProvider);

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        title: const Text('Sneaker Collection'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.white),
          ),
        ],
      ),
      body: Column(
        children: [
          // Custom Tab Switcher
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              spacing: 8,
              children: [
                _buildTabButton(ref, 'Live', 0, selectedTab),
                _buildTabButton(ref, 'Product', 1, selectedTab),
              ],
            ),
          ),

          Expanded(
            child: selectedTab == 0
                ? _buildLiveGrid(context)
                : _buildProductGrid(),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(WidgetRef ref, String label, int index, int current) {
    bool isActive = index == current;
    return GestureDetector(
      onTap: () => ref.read(categoryTabProvider.notifier).state = index,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: isActive
              ? AppColors.kPrimaryColor
              : AppColors.kBorderColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20),
        ),
        child: CustomText(
          label,
          color: isActive ? Colors.white : AppColors.kGreyTextColor,
        ),
      ),
    );
  }

  Widget _buildLiveGrid(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.75,
      ),
      itemCount: 6,
      itemBuilder: (context, index) =>
          HomeLiveCard(onTap: () => context.push(AppRoutes.liveStream)),
    );
  }

  Widget _buildProductGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.7,
      ),
      itemCount: 8,
      itemBuilder: (context, index) => const ProductCard(),
    );
  }
}
