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
            imageUrl:
                'https://images.unsplash.com/photo-1552058544-f2b08422138a',
            height: double.infinity,
            width: double.infinity,
          ),
          // Header Actions
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DefaultGreyCircleContainer(
                  backgroundColor: Colors.black.withValues(alpha: 0.3),
                  customIcon: Icons.close,
                  onTap: () => context.pop(),
                ),
                Row(
                  children: [
                    DefaultGreyCircleContainer(
                      backgroundColor: Colors.black.withValues(alpha: 0.3),
                      customIcon: Icons.switch_camera_outlined,
                    ),
                    space8W,
                    DefaultGreyCircleContainer(
                      backgroundColor: Colors.black.withValues(alpha: 0.3),
                      customIcon: Icons.flashlight_on_outlined,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Setup Overlay Box
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
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
                        const CustomText(
                          AppStaticStrings.streamSetup,
                          variant: TextVariant.headlineSmall,
                        ),
                        space8H,
                        CustomTextField(
                          title: AppStaticStrings.streamTitle,
                          hintText: 'e,g Sneaker head',
                          fillColor: Colors.transparent,
                        ),
                        space4H,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CustomText(AppStaticStrings.featuredItems),
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.kPrimaryColor,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: ButtonTapWidget(
                                onTap: () => showModalBottomSheet(
                                  context: context,
                                  builder: (_) => const ProductSelectionModal(),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: const CustomText(
                                    '+ Add Product',
                                    color: AppColors.kTextColor,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              SetupProductItem(
                                name: 'Sports Shoe',
                                price: '50.00',
                              ),
                              SetupProductItem(
                                name: 'Sports Shoe',
                                price: '50.00',
                              ),
                              AddProductDashedBox(),
                            ],
                          ),
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
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () => context.push(AppRoutes.activeStream),
                child: SvgPicture.asset("assets/icons/go_live_button.svg"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
