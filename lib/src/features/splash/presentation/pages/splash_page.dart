
import 'package:video_player/video_player.dart';
import '../../../../src_export.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late VideoPlayerController _controller;
  bool _isVideoInitialized = false;
  bool _showVideo = true;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    _controller = VideoPlayerController.asset('assets/videos/splash.mov');
    try {
      await _controller.initialize();
      if (mounted) {
        setState(() {
          _isVideoInitialized = true;
        });
        _controller.play();
        _controller.addListener(_videoListener);
      }
    } catch (e) {
      debugPrint("Error initializing video: $e");
      if (mounted) {
        setState(() {
          _showVideo = false;
        });
        _startLoginNavigationDelay();
      }
    }
  }

  void _videoListener() {
    if (_controller.value.position >= _controller.value.duration) {
      _controller.removeListener(_videoListener);
      if (mounted) {
        setState(() {
          _showVideo = false;
        });
        _startLoginNavigationDelay();
      }
    }
  }

  void _startLoginNavigationDelay() {
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        context.push(AppRoutes.login);
      }
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_videoListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _showVideo
            ? (_isVideoInitialized
                ? SizedBox.expand(
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: _controller.value.size.width,
                        height: _controller.value.size.height,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                  )
                : const CircularProgressIndicator())
            : Row(
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
