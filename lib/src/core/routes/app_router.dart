import '../../src_export.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash, // Usually splash is the initial route
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.register,
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        path: AppRoutes.otpVerification,
        builder: (context, state) => const OtpPage(),
      ),
      GoRoute(
        path: AppRoutes.resetPassword,
        builder: (context, state) => const ResetPasswordPage(),
      ),
      GoRoute(
        path: AppRoutes.emailConfirmation,
        builder: (context, state) => const ForgotPasswordPage(),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const MainLayout(),
      ),
      GoRoute(
        path: AppRoutes.raffleDetail,
        builder: (context, state) => const RaffleDetailPage(),
      ),
      GoRoute(
        path: AppRoutes.liveStream,
        builder: (context, state) => const LiveStreamPage(),
      ),
      GoRoute(
        path: AppRoutes.categoryDetails,
        builder: (context, state) => const CategoryDetailsPage(),
      ),
    ],
  );
}
