import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/edit_screen.dart';
import '../models/user.dart';
import '../models/edit_result.dart';
import '../constants/app_routes.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute<void>(
          builder: (context) => const HomeScreen(),
        );
      case AppRoutes.profile:
        final user = settings.arguments as User?;
        if (user == null) {
          throw ArgumentError('User argument is required for /profile route');
        }
        return PageRouteBuilder<void>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              ProfileScreen(user: user),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      case AppRoutes.edit:
        final user = settings.arguments as User?;
        if (user == null) {
          throw ArgumentError('User argument is required for /edit route');
        }
        return MaterialPageRoute<EditResult>(
          builder: (context) => EditScreen(user: user),
        );
      default:
        return null;
    }
  }
}
