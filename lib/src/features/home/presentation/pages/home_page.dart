import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../../../../src_export.dart';

// UI State for selected category
final selectedCategoryProvider = StateProvider<int>((ref) => 0);

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIdx = ref.watch(selectedCategoryProvider);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            SvgPicture.asset(AppAssets.appLogo, height: 30),
            space8W,
            const CustomText(
              AppStaticStrings.appName,
              variant: TextVariant.headlineMedium,
            ),
          ],
        ),
        actions: [
          DefaultGreyCircleContainer(
            asset: AppAssets.searchNormal,
            onTap: () {},
          ),
          space8W,
          DefaultGreyCircleContainer(
            asset: AppAssets.notificationBing,
            onTap: () {},
          ),
          space8W,
          DefaultGreyCircleContainer(
            asset: AppAssets.shoppingCart,
            onTap: () => context.push(AppRoutes.cart),
          ),
          // space12W,
        ],
      ),
      body: SingleChildScrollView(
        padding: AppPadding.getPadding12H(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            space12H,
            FeaturedEventCard(
              onTap: () => context.push(AppRoutes.raffleDetail),
            ),
            space8H,

            // Horizontal Categories
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HomeCategoryFilter(
                    label: 'All',
                    isSelected: selectedIdx == 0,
                    onTap: () =>
                        ref.read(selectedCategoryProvider.notifier).state = 0,
                  ),
                  HomeCategoryFilter(
                    label: 'Sneaker',
                    image:
                        'https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=100',
                    isSelected: selectedIdx == 1,
                    onTap: () =>
                        ref.read(selectedCategoryProvider.notifier).state = 1,
                  ),
                  HomeCategoryFilter(
                    label: 'Electronics',
                    image:
                        'https://images.unsplash.com/photo-1498049794561-7780e7231661?q=80&w=100',
                    isSelected: selectedIdx == 2,
                    onTap: () =>
                        ref.read(selectedCategoryProvider.notifier).state = 2,
                  ),
                ],
              ),
            ),

            space8H,

            // Live Streams Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 20,
                childAspectRatio: 0.72,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return HomeLiveCard(
                  onTap: () => context.push(AppRoutes.liveStream),
                );
              },
            ),
            space8H,
          ],
        ),
      ),
    );
  }
}
