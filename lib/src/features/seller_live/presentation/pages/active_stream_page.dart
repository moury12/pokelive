import '../../../../src_export.dart';

class ActiveStreamPage extends ConsumerWidget {
const ActiveStreamPage({super.key});
@override
Widget build(BuildContext context, WidgetRef ref) {
final chat = ref.watch(streamChatProvider);
return Scaffold(
  body: Stack(
    children: [
      // Stream Background
      const CustomNetworkImage(
        imageUrl: 'https://images.unsplash.com/photo-1552058544-f2b08422138a',
        height: double.infinity, width: double.infinity,
      ),

      // Top UI
      Positioned(
        top: 50, left: 20, right: 20,
        child: Row(
          children: [
            const LiveStatusBadge(timer: '01:02:20', viewers: '1.8k'),
            const Spacer(),
            CustomButton(
              text: AppStaticStrings.end,
              onPressed: () => context.pop(),
              backgroundColor: Colors.red, isExpanding: false, borderRadius: 8,
            ),
          ],
        ),
      ),

      // Side Controls
      Positioned(
        top: 150, right: 20,
        child: Column(children: [
          DefaultGreyCircleContainer(customIcon: Icons.switch_camera_outlined),
          space12H,
          DefaultGreyCircleContainer(customIcon: Icons.flashlight_on_outlined),
        ]),
      ),

      // Purchase Notification
      const Positioned(
        top: 250, left: 20,
        child: LivePurchaseToast(user: 'Nm sujon', product: 'Nike sneakers', amount: '€200.00'),
      ),

      // Chat and Current Product Highlight
      Positioned(
        bottom: 20, left: 16, right: 16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: chat.length,
                itemBuilder: (context, i) => LiveChatItem(msg: chat[i]),
              ),
            ),
            space12H,
            const CurrentStreamProductCard(),
          ],
        ),
      ),
    ],
  ),
);}
}