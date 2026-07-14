import 'package:flutter_svg/svg.dart';

import '../../../../src_export.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) context.push(AppRoutes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppAssets.appLogo, height: 50),
            CustomText(
              AppStaticStrings.appName,
              variant: TextVariant.headlineLarge,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
