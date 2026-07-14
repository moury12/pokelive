import '../../../../src_export.dart';

class RaffleDetailPage extends StatelessWidget {
  const RaffleDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const BackButton(color: Colors.white), title: const CustomText('Raffle')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: [
                  const CustomNetworkImage(
                    imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=1000',
                    height: 250,
                    radius: 20,
                  ),
                  Positioned(
                    top: 15,
                    left: 15,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(4)),
                      child: const CustomText('● Live Raffle', fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText('Win Nike Special sneaker', variant: TextVariant.headlineMedium),
                  space8H,
                  const CustomText(
                    'Join our weekly community raffle! For just £1, you could own one of the rarest cards in existence...',
                    color: AppColors.kGreyTextColor,
                  ),
                  space24H,
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(color: AppColors.kBorderColor.withOpacity(0.2), borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      children: [
                        const CustomText('RAFFLE ENDS IN', color: AppColors.kGreyTextColor),
                        space16H,
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _TimerUnit(val: '03', label: 'DAYS'),
                            _TimerSeparator(),
                            _TimerUnit(val: '12', label: 'HRS'),
                            _TimerSeparator(),
                            _TimerUnit(val: '45', label: 'MINS'),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: _RaffleBottomBar(),
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
        CustomText(val, fontSize: 32, fontWeight: FontWeight.bold, color: Colors.red),
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
      padding: EdgeInsets.symmetric(horizontal: 10,),
      child: CustomText(':', fontSize: 32, fontWeight: FontWeight.bold, color: Colors.red),
    );
  }
}

class _RaffleBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(color: Colors.black, borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.remove, color: Colors.white)),
                    const CustomText('0'),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.add, color: Colors.white)),
                  ],
                ),
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomText('Total cost', color: AppColors.kGreyTextColor),
                  CustomText('£1.00', variant: TextVariant.headlineMedium),
                ],
              )
            ],
          ),
          space24H,
          CustomButton(text: 'Buy 1 Entry (\$1.00)', onPressed: () {}, borderRadius: 30),
        ],
      ),
    );
  }
}
