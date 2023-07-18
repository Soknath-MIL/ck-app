import 'package:get/get.dart';
import 'package:lottery/res/routes/routes_name.dart';
import 'package:lottery/view/TC.dart';
import 'package:lottery/view/forget_password.dart';
import 'package:lottery/view/home.dart';
import 'package:lottery/view/login.dart';
import 'package:lottery/view/lottery_history.dart';
import 'package:lottery/view/main.dart';
import 'package:lottery/view/notification.dart';
import 'package:lottery/view/otp.dart';
import 'package:lottery/view/reset_password.dart';
import 'package:lottery/view/signup.dart';
import 'package:lottery/view/splash_screen.dart';
import 'package:lottery/view/user_info.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteName.splash_screen,
          page: () => const SplashScreen(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.login_view,
          page: () => const LoginView(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.home_view,
          page: () => const HomeView(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.tc_view,
          page: () => const TC(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.signup_view,
          page: () => const SignupView(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.otp_view,
          page: () => OTP(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.main_view,
          page: () => MainPage(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.lottery_history_view,
          page: () => LotteryHistoryPage(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.forget_password,
          page: () => ForgetPasswordPage(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.reset_password,
          page: () => ResetPasswordPage(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.notification,
          page: () => NotificationPage(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.user_info,
          page: () => UserInfoPage(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 250),
        ),
      ];
}
