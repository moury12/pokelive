import '../../../../src_export.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class MainLayout extends ConsumerWidget {
  const MainLayout({super.key});
  static const List<Widget> _screens = [
    HomePage(),
    CategoryPage(),
    Center(child: Text('Seller Hub')),
    Center(child: Text('Cart')),
    Center(child: Text('Profile')),
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(navigationProvider);
    return Scaffold(
      body: IndexedStack(index: selectedIndex, children: _screens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) => ref.read(navigationProvider.notifier).state = index,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.kBackgroundColor,
        selectedItemColor: AppColors.kTextColor,
        unselectedItemColor: AppColors.kGreyTextColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          _navItem(AppAssets.home, 'Home'),
          _navItem(AppAssets.category, 'Category'),
          _navItem(AppAssets.sellerHubFill, 'Seller Hub'),
          _navItem(AppAssets.shoppingCart, 'Cart'),
          _navItem(AppAssets.profile, 'Profile'),
        ],
      ),
    );
  }
  BottomNavigationBarItem _navItem(String asset, String label) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: SvgPicture.asset(asset, colorFilter: const ColorFilter.mode(AppColors.kGreyTextColor, BlendMode.srcIn)),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: SvgPicture.asset(asset, colorFilter: const ColorFilter.mode(AppColors.kTextColor, BlendMode.srcIn)),
      ),
      label: label,
    );
  }
}
