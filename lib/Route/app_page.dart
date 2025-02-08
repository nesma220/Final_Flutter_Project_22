import 'package:final_project/Route/app_route.dart';
import 'package:final_project/ui/screens/HomeScreen.dart';
import 'package:final_project/ui/screens/Inbox_screen.dart';
import 'package:final_project/ui/screens/allservices_screen%20.dart';
import 'package:final_project/ui/screens/bookmark_screen.dart';
import 'package:final_project/ui/screens/calendar_today_screen.dart';
import 'package:final_project/ui/screens/create_account_screen.dart';
import 'package:final_project/ui/screens/create_new_password_screen.dart';
import 'package:final_project/ui/screens/forgot_password_screen.dart';
import 'package:final_project/ui/screens/home_page.dart';
import 'package:final_project/ui/screens/login_screen_ready.dart';
import 'package:final_project/ui/screens/map_screen.dart';
import 'package:final_project/ui/screens/notification_screen.dart';
import 'package:final_project/ui/screens/onbording_screen.dart';
import 'package:final_project/ui/screens/popular_services_screen.dart';
import 'package:final_project/ui/screens/profile_screen.dart';
import 'package:final_project/ui/screens/search_page.dart';
import 'package:final_project/ui/screens/signIn.dart';
import 'package:final_project/ui/screens/splash_screen.dart';
import 'package:final_project/ui/screens/verification_screen.dart';
import 'package:get/get.dart';

List<GetPage> appPage = [
  GetPage(name: AppRoute.home, page: () => HomePage()),
  GetPage(name: AppRoute.createAcountScreen, page: () => CreateAccountScreen()),
  GetPage(
      name: AppRoute.createNewPasswordScreen,
      page: () => CreateNewPasswordScreen()),
  GetPage(
      name: AppRoute.forgotPasswordScreen, page: () => ForgotPasswordScreen()),
  GetPage(name: AppRoute.loginScreen, page: () => LoginScreenReady()),
  GetPage(name: AppRoute.onbordingScreen, page: () => const OnboardingScreen()),
  GetPage(name: AppRoute.profileScreen, page: () => const FillProfileScreen()),
  GetPage(name: AppRoute.pickPlaceScreen, page: () => const PickPlaceScreen()),
  GetPage(name: AppRoute.signInScreen, page: () => SignInScreen()),
  GetPage(name: AppRoute.splashScreen, page: () => const SplashScreen()),
  GetPage(name: AppRoute.verificationScreen, page: () => VerificationScreen()),
  GetPage(name: AppRoute.bookmarkScreen, page: () => MyBookmarkScreen()),
  GetPage(name: AppRoute.inboxScreen, page: () => InboxScreen()),
  GetPage(name: AppRoute.calendarToday, page: () => const CalendarToday()),
  GetPage(name: AppRoute.allServicesScreen, page: () => AllServicesScreen()),
  GetPage(name: AppRoute.notificationScreen, page: () => NotificationScreen()),
  GetPage(name: AppRoute.searchScreen, page: () => SearchScreen()),
  GetPage(name: AppRoute.homeScreen, page: () => HomeScreen()),
  GetPage(
      name: AppRoute.popularServicesScreen,
      page: () => PopularServicesScreen()),
];
