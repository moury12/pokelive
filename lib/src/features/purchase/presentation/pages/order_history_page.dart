import '../../../../src_export.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const CustomText(
          AppStaticStrings.ordersReview,
          variant: TextVariant.headlineMedium,
        ),
      ),
      body: ListView(
        padding: AppPadding.getPadding12(context),
        children: [
          OrderCard(
            status: 'Delivered',
            statusColor: Colors.green,
            actionButton: CustomButton(
              text: AppStaticStrings.writeAReview,

              onPressed: () => showDialog(
                context: context,
                builder: (_) => const ReviewDialog(),
              ),
            ),
          ),
          const OrderCard(status: 'Canceled', statusColor: AppColors.kRedColor),
        ],
      ),
    );
  }
}
