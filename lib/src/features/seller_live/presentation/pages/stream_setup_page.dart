import 'dart:ui';
import '../../../../src_export.dart';
class StreamSetupPage extends StatelessWidget {
const StreamSetupPage({super.key});
@override
Widget build(BuildContext context) {
return Scaffold(
body: Stack(
children: [
// Simulated Camera Background
const CustomNetworkImage(
imageUrl: 'https://images.unsplash.com/photo-1552058544-f2b08422138a',
height: double.infinity, width: double.infinity,
),
// Header Actions
      Positioned(
        top: 50, left: 20, right: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DefaultGreyCircleContainer(customIcon: Icons.close, onTap: () => context.pop()),
            Row(children: [
              DefaultGreyCircleContainer(customIcon: Icons.switch_camera_outlined),
              space8W,
              DefaultGreyCircleContainer(customIcon: Icons.flashlight_on_outlined),
            ]),
          ],
        ),
      ),

      // Setup Overlay Box
      Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                padding: AppPadding.getPadding16(context),
                color: Colors.black.withValues(alpha: 0.3),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(AppStaticStrings.streamSetup, variant: TextVariant.headlineSmall),
                    space12H,
                    const CustomTextField(title: AppStaticStrings.streamTitle, hintText: 'e,g Sneaker head'),
                    space16H,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(AppStaticStrings.featuredItems),
                        GestureDetector(
                          onTap: () => showModalBottomSheet(context: context, builder: (_) => const ProductSelectionModal()),
                          child: const CustomText('+ Add Product', color: AppColors.kRedColor, fontSize: 12),
                        ),
                      ],
                    ),
                    space12H,
                    const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        SetupProductItem(name: 'Sports Shoe', price: '50.00'),
                        SetupProductItem(name: 'Sports Shoe', price: '50.00'),
                        AddProductDashedBox(),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),

      // Start Button
      Positioned(
        bottom: 40, left: 0, right: 0,
        child: Center(
          child: GestureDetector(
            onTap: () => context.push(AppRoutes.activeStream),
            child: Container(
              height: 60, width: 60,
              decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
              child: const Icon(Icons.podcasts, color: Colors.white, size: 30),
            ),
          ),
        ),
      ),
    ],
  ),
);}
}