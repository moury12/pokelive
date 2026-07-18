import '../../../../src_export.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStaticStrings.myInventory)),
      body: SingleChildScrollView(
        padding: AppPadding.getPadding12H(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              AppStaticStrings.productImages,
              variant: TextVariant.titleSmall,
            ),
            space8H,
            const ImageUploadPlaceholder(),
            space12H,
            Row(
              children: List.generate(
                4,
                (index) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: const SmallImageUploadBox(),
                  ),
                ),
              ),
            ),
            space16H,
            const CustomTextField(
              title: AppStaticStrings.productTitle,
              hintText: 'e.g Sneaker Head',
            ),
            space12H,
            const CustomTextField(
              title: AppStaticStrings.productDescription,
              hintText: 'Tell us about your product',
              maxLines: 4,
            ),
            space12H,
            const CustomTextField(
              title: 'Category',
              hintText: 'Select Category',
              suffixIcon: Icon(Icons.keyboard_arrow_down),
            ),
            space12H,
            Row(
              children: [
                const Expanded(
                  child: CustomTextField(
                    title: AppStaticStrings.price,
                    hintText: 'Unit Price',
                  ),
                ),
                space12W,
                const Expanded(
                  child: CustomTextField(
                    title: AppStaticStrings.quantity,
                    hintText: 'Item quantity',
                  ),
                ),
              ],
            ),
            space12H,
            const CustomTextField(
              title: AppStaticStrings.packageWeight,
              hintText: 'e.g 1000gm',
            ),
            space24H,
            CustomButton(
              text: AppStaticStrings.listProduct,
              onPressed: () => context.pop(),
            ),
            space24H,
            space24H,
          ],
        ),
      ),
    );
  }
}
