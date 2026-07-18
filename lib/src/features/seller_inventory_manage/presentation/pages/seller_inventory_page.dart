import '../../../../src_export.dart';

class SellerInventoryPage extends ConsumerWidget {
  const SellerInventoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilter = ref.watch(inventoryFilterProvider);

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text(AppStaticStrings.myInventory),
        actions: [
          DefaultGreyCircleContainer(
            customIcon: Icons.add,
            onTap: () => context.push(AppRoutes.addProduct),
          ),
          space12W,
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: AppPadding.getPadding12H(context),
            child: const CustomTextField(
              hintText: 'Search Product...',
              prefixIcon: Icon(Icons.search, color: AppColors.kGreyTextColor),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: AppPadding.getPadding12(context),
            child: Row(
              children: ['All', 'Active', 'Stock Out'].map((filter) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: HomeCategoryFilter(
                    label: filter,
                    isSelected: activeFilter == filter,
                    onTap: () =>
                        ref.read(inventoryFilterProvider.notifier).state =
                            filter,
                  ),
                );
              }).toList(),
            ),
          ),
          // space12H,
          Expanded(
            child: ListView.builder(
              padding: AppPadding.getPadding12H(context),
              itemCount: 4,
              itemBuilder: (context, index) => const InventoryProductCard(),
            ),
          ),
        ],
      ),
    );
  }
}
