import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/user_provider.dart';
import 'routes/app_router.dart';
import 'constants/app_strings.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const UserDirectoryApp(),
    ),
  );
}

class UserDirectoryApp extends StatelessWidget {
  const UserDirectoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      initialRoute: '/',
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
