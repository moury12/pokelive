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
        builder: (context, state) => const NavigationPage(),
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
      GoRoute(
        path: AppRoutes.productDetail,
        builder: (context, state) => const ProductDetailsPage(),
      ),
      GoRoute(
        path: AppRoutes.reviews,
        builder: (context, state) => const ReviewListPage(),
      ),
      GoRoute(
        path: AppRoutes.storeDetails,
        builder: (context, state) => const StoreDetailsPage(),
      ),
      GoRoute(
        path: AppRoutes.cart,
        builder: (context, state) => const CartPage(),
      ),
      GoRoute(
        path: AppRoutes.checkout,
        builder: (context, state) => const CheckoutPage(),
      ),
      GoRoute(
        path: AppRoutes.selectAddress,
        builder: (context, state) => const SelectAddressPage(),
      ),
      GoRoute(
        path: AppRoutes.storyView,
        builder: (context, state) => const StoryViewPage(),
      ),
      GoRoute(
        path: AppRoutes.editProfile,
        builder: (context, state) => const EditProfilePage(),
      ),
      GoRoute(
        path: AppRoutes.activeOrders,
        builder: (context, state) => const ActiveOrdersPage(),
      ),
      GoRoute(
        path: AppRoutes.orderHistory,
        builder: (context, state) => const OrderHistoryPage(),
      ),
      GoRoute(
        path: AppRoutes.setNewAddress,
        builder: (context, state) => const SetNewAddressPage(),
      ),
      GoRoute(
        path: AppRoutes.becomeSeller,
        builder: (context, state) => const BecomeSellerPage(),
      ),
      GoRoute(
        path: AppRoutes.changePassword,
        builder: (context, state) => const ChangePasswordPage(),
      ),
      GoRoute(
        path: AppRoutes.support,
        builder: (context, state) => const SupportPage(),
      ),
      GoRoute(
        path: AppRoutes.termsCondition,
        builder: (context, state) => const TermsConditionPage(),
      ),
      GoRoute(
        path: AppRoutes.privacyPolicy,
        builder: (context, state) => const PrivacyPolicyPage(),
      ),
      GoRoute(
        path: AppRoutes.sellerSettings,
        builder: (context, state) => const SellerSettingsPage(),
      ),
      GoRoute(
        path: AppRoutes.payoutHistory,
        builder: (context, state) => const PayoutHistoryPage(),
      ),
      GoRoute(
        path: AppRoutes.editStorefront,
        builder: (context, state) => const EditStorefrontPage(),
      ),
      GoRoute(
        path: AppRoutes.senderAddress,
        builder: (context, state) => const SenderAddressPage(),
      ),
      GoRoute(
        path: AppRoutes.sellerInventory,
        builder: (context, state) => const SellerInventoryPage(),
      ),
      GoRoute(
        path: AppRoutes.addProduct,
        builder: (context, state) => const AddProductPage(),
      ),
      GoRoute(
        path: AppRoutes.salesOrders,
        builder: (context, state) => const SalesOrdersPage(),
      ),
      GoRoute(
path: AppRoutes.streamSetup,
builder: (context, state) => const StreamSetupPage(),
),
GoRoute(
path: AppRoutes.activeStream,
builder: (context, state) => const ActiveStreamPage(),
),
    ],
  );
}
