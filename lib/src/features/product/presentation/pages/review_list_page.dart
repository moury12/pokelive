import '../../../../src_export.dart';

class ReviewListPage extends StatelessWidget {
  const ReviewListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reviews')),
      body: ListView.builder(
        padding: AppPadding.getPadding12H(context),
        itemCount: 8,
        itemBuilder: (context, index) => const ReviewTile(),
      ),
    );
  }
}
