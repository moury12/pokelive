import '../../../../src_export.dart';


class ActiveStreamPage extends ConsumerWidget {
  const ActiveStreamPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chat = ref.watch(streamChatProvider);

    return Scaffold(
      body: Stack(
        children: [
          // Background
          const CustomNetworkImage(
            imageUrl:
                'https://images.unsplash.com/photo-1552058544-f2b08422138a',
            height: double.infinity,
            width: double.infinity,
          ),

          // Top Header
          Positioned(
            top: 50,
            left: 12,
            right: 12,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LiveStatusBadge(timer: '01:02:20', viewers: '1.8k'),
                const Spacer(),
                Column(
                  spacing: 8,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.kRedColor,
                      ),
                      child: ButtonTapWidget(
                        onTap: () {
                          context.pop();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 6,
                          ),
                          child: CustomText(
                            AppStaticStrings.end,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    DefaultGreyCircleContainer(
                      customIcon: Icons.flip_camera_ios_outlined,
                      backgroundColor: Colors.black.withOpacity(0.4),
                    ),
                    DefaultGreyCircleContainer(
                      customIcon: Icons.flashlight_on_outlined,
                      backgroundColor: Colors.black.withOpacity(0.4),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Side Icons

          // Chat & Products Overlays
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    height: 180,
                    child: ListView.builder(
                      itemCount: chat.length,
                      itemBuilder: (context, i) => LiveChatItem(msg: chat[i]),
                    ),
                  ),
                ),
                space16H,
                SizedBox(
                  height: 125,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(left: 16),
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    itemBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: CurrentStreamProductCard(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
