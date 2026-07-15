import '../../../../src_export.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const CustomText(
          'Explore Categories',
          variant: TextVariant.headlineMedium,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: AppPadding.getPadding12(context),
        child: Column(
          children: [
            const CustomTextField(
              hintText: 'Search Category...',
              prefixIcon: Icon(Icons.search, color: AppColors.kGreyTextColor),
              borderRadius: 30,
              fillColor: AppColors.kBorderColor,
            ),
            space8H,
            CategoryCard(
              title: 'Sneaker Collection',
              imageUrl:
                  'https://images.unsplash.com/photo-1612817288484-6f916006741a?q=80&w=1000',
              liveCount: '15 stream now',
              isLarge: true,
              onTap: () => context.push(AppRoutes.categoryDetails),
            ),
            space16H,
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.1,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                final titles = ['Bag', 'Laptop', 'Phone', 'Watch'];
                return CategoryCard(
                  title: titles[index],
                  imageUrl:
                      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=400',
                  liveCount: '15 live',
                  onTap: () => context.push(AppRoutes.categoryDetails),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
