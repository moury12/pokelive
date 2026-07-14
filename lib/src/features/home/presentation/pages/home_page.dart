import '../../../../src_export.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const CustomText('Home')),
      body: Center(
        child: LiveCard(onTap: () {}),
      ),
    );
  }
}
