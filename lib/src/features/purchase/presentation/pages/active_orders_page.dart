import '../../../../src_export.dart';

class ActiveOrdersPage extends StatelessWidget {
  const ActiveOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const CustomText(
          '${AppStaticStrings.myActiveOrders} ❸',
          variant: TextVariant.headlineMedium,
        ),
        actions: [
          DefaultGreyCircleContainer(
            onTap: () {},
            asset: AppAssets.searchNormal,
          ),
          space8W,
        ],
      ),
      body: ListView(
        padding: AppPadding.getPadding12H(context),
        children: const [
          OrderCard(status: 'Pending', statusColor: Colors.orange),
          OrderCard(status: 'Processing', statusColor: Colors.blue),
          OrderCard(
            status: 'Shipped',
            statusColor: Colors.purple,
            showTracking: true,
          ),
        ],
      ),
    );
  }
}
