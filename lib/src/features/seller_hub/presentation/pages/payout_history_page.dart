import '../../../../src_export.dart';

class PayoutHistoryPage extends StatelessWidget {
  const PayoutHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const CustomText(AppStaticStrings.payoutHistory,
            variant: TextVariant.headlineMedium),
      ),
      body: SingleChildScrollView(
        padding: AppPadding.getPadding12(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TotalWithdrawnCard(),
            space16H,
            const CustomText(AppStaticStrings.recentPayouts,
                variant: TextVariant.titleLarge),
            space12H,
            const PayoutHistoryItem(
                amount: '£150.00', status: 'Success', statusColor: Colors.green),
            const PayoutHistoryItem(
                amount: '£150.00', status: 'Success', statusColor: Colors.green),
            const PayoutHistoryItem(
                amount: '£150.00',
                status: 'Processing',
                statusColor: Colors.orange),
            const PayoutHistoryItem(
                amount: '£150.00',
                status: 'Processing',
                statusColor: Colors.orange),
            const PayoutHistoryItem(
                amount: '£150.00', status: 'Failed', statusColor: Colors.red),
          ],
        ),
      ),
    );
  }
}
