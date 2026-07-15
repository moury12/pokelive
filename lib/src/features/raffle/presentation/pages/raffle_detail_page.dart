import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../src_export.dart';

class RaffleDetailPage extends ConsumerWidget {
  const RaffleDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countdownAsync = ref.watch(raffleCountdownProvider);

    return Scaffold(
      appBar: AppBar(title: const Text(AppStaticStrings.raffle)),
      body: SingleChildScrollView(
        padding: AppPadding.getPadding12H(context),
        child: Column(
          spacing: 12,
          children: [
            Stack(
              children: [
                const CustomNetworkImage(
                  imageUrl:
                      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=1000',
                  height: 250,
                  radius: 20,
                ),
                Positioned(
                  top: 15,
                  left: 15,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const CustomText(
                      '● Live Raffle',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              spacing: 12,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  'Win Nike Special sneaker',
                  variant: TextVariant.headlineMedium,
                ),
                // space8H,
                const CustomText(
                  'Join our weekly community raffle! For just £1, you could own one of the rarest cards in existence...',
                  color: AppColors.kGreyTextColor,
                ),
                // space24H,
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.kBorderColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      const CustomText(
                        'RAFFLE ENDS IN',
                        color: AppColors.kGreyTextColor,
                      ),
                      // space16H,
                      countdownAsync.when(
                        data: (duration) => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _TimerUnit(
                              val: duration.inDays.toString().padLeft(2, '0'),
                              label: 'DAYS',
                            ),
                            const _TimerSeparator(),
                            _TimerUnit(
                              val: (duration.inHours % 24).toString().padLeft(
                                2,
                                '0',
                              ),
                              label: 'HRS',
                            ),
                            const _TimerSeparator(),
                            _TimerUnit(
                              val: (duration.inMinutes % 60).toString().padLeft(
                                2,
                                '0',
                              ),
                              label: 'MINS',
                            ),
                          ],
                        ),
                        loading: () => const AppLoader(),
                        error: (_, __) => const CustomText('Timer Error'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const _RaffleBottomBar(),
    );
  }
}

class _TimerUnit extends StatelessWidget {
  final String val, label;
  const _TimerUnit({required this.val, required this.label});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          val,
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
        CustomText(label, fontSize: 10, color: AppColors.kGreyTextColor),
      ],
    );
  }
}

class _TimerSeparator extends StatelessWidget {
  const _TimerSeparator();
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: CustomText(
        ':',
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.red,
      ),
    );
  }
}

class _RaffleBottomBar extends ConsumerWidget {
  const _RaffleBottomBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quantity = ref.watch(raffleQuantityProvider);
    const double pricePerTicket = 1.0;

    return Container(
      padding: AppPadding.getPadding12(context),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        spacing: 12,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.kBorderColor),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: quantity > 1
                          ? () => ref
                                .read(raffleQuantityProvider.notifier)
                                .state--
                          : null,
                      icon: const Icon(Icons.remove, color: Colors.white),
                    ),
                    CustomText('$quantity', variant: TextVariant.titleLarge),
                    IconButton(
                      onPressed: () =>
                          ref.read(raffleQuantityProvider.notifier).state++,
                      icon: const Icon(Icons.add, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const CustomText(
                    'Total cost',
                    color: AppColors.kGreyTextColor,
                  ),
                  CustomText(
                    '£${(quantity * pricePerTicket).toStringAsFixed(2)}',
                    variant: TextVariant.headlineMedium,
                  ),
                ],
              ),
            ],
          ),
          CustomButton(
            text:
                'Buy $quantity Entry (£${(quantity * pricePerTicket).toStringAsFixed(2)})',
            onPressed: () {
              CustomSnackbar.show(context, 'Successfully joined the raffle!');
            },
            borderRadius: 30,
          ),
          space24H,
        ],
      ),
    );
  }
}
