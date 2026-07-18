import '../../../../src_export.dart';

class SalesOrdersPage extends ConsumerWidget {
  const SalesOrdersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTab = ref.watch(orderTabProvider);

    return Scaffold(
      appBar: AppBar(title: const Text(AppStaticStrings.salesOrders)),
      body: Column(
        children: [
          Padding(
            padding: AppPadding.getPadding12H(context),
            child: Row(
              children: [
                OrderTabChip(
                  label: AppStaticStrings.toShip,
                  isSelected: currentTab == 0,
                  onTap: () => ref.read(orderTabProvider.notifier).state = 0,
                ),
                space8W,
                OrderTabChip(
                  label: AppStaticStrings.shipped,
                  isSelected: currentTab == 1,
                  onTap: () => ref.read(orderTabProvider.notifier).state = 1,
                ),
                space8W,
                OrderTabChip(
                  label: AppStaticStrings.completed,
                  isSelected: currentTab == 2,
                  onTap: () => ref.read(orderTabProvider.notifier).state = 2,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: AppPadding.getPadding12(context),
              itemCount: 3,
              itemBuilder: (context, index) =>
                  SellerOrderCard(tabIndex: currentTab),
            ),
          ),
        ],
      ),
    );
  }
}
