import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_getx/controller_bainder.dart';
import 'package:task_manager_getx/ui/screens/bottom_navigation_screen/add_new_task_list_screen.dart';
import 'package:task_manager_getx/ui/screens/forget_password_screen/forget_password_verify_email_screen.dart';
import 'package:task_manager_getx/ui/screens/forget_password_screen/forget_password_verify_otp_screen.dart';
import 'package:task_manager_getx/ui/screens/bottom_navigation_screen/main_bottom_nav_screen.dart';
import 'package:task_manager_getx/ui/screens/forget_password_screen/reset_password_screen.dart';
import 'package:task_manager_getx/ui/screens/register_screen/sign_in_screen.dart';
import 'package:task_manager_getx/ui/screens/register_screen/sign_up_screen.dart';
import 'package:task_manager_getx/ui/screens/bottom_navigation_screen/splash_screen.dart';
import 'package:task_manager_getx/ui/screens/register_screen/update_profile_screen.dart';
import 'package:task_manager_getx/ui/utils/app_colors.dart';

class TaskManager extends StatelessWidget {
  const TaskManager({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      initialBinding: ControllerBinder(),
      theme: ThemeData(
          colorSchemeSeed: AppColor.themeColor,
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            titleSmall: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            contentPadding: EdgeInsets.symmetric(horizontal: 16),
            filled: true,
            fillColor: Colors.white,
            hintStyle:
                TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
            border: UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.themeColor,
              iconColor: Colors.white,
              iconSize: 24,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              fixedSize: const Size.fromWidth(double.maxFinite),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          )),
      onGenerateRoute: (RouteSettings settings) {
        late Widget routeWidget;
        if (settings.name == SplashScreen.name) {
          routeWidget = const SplashScreen();
        } else if (settings.name == SignInScreen.name) {
          routeWidget = const SignInScreen();
        } else if (settings.name == SignUpScreen.name) {
          routeWidget = const SignUpScreen();
        } else if (settings.name == ForgetPasswordVerifyEmailScreen.name) {
          routeWidget = const ForgetPasswordVerifyEmailScreen();
        } else if (settings.name == ForgetPasswordVerifyOtpScreen.name) {
          routeWidget = const ForgetPasswordVerifyOtpScreen();
        } else if (settings.name == ResetPasswordScreen.name) {
          routeWidget = const ResetPasswordScreen();
        } else if (settings.name == MainBottomNavScreen.name) {
          routeWidget = const MainBottomNavScreen();
        } else if (settings.name == AddNewTaskListScreen.name) {
          routeWidget = const AddNewTaskListScreen();
        } else if (settings.name == UpdateProfileScreen.name) {
          routeWidget = const UpdateProfileScreen();
        }
        return MaterialPageRoute(
          builder: (context) {
            return routeWidget;
          },
        );
      },
    );
  }
}
