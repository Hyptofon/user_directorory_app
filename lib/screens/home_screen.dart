import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../widgets/user_card_widget.dart';
import '../widgets/custom_app_bar.dart';
import '../constants/app_routes.dart';
import '../constants/app_strings.dart';
import '../constants/app_sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: AppStrings.appTitle),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          final users = userProvider.users;
          return ListView.builder(
            padding: const EdgeInsets.all(AppSizes.paddingMedium),
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];

              return UserCardWidget(
                user: user,
                onTap: () {
                  Navigator.of(
                    context,
                  ).pushNamed(AppRoutes.profile, arguments: user);
                },
              );
            },
          );
        },
      ),
    );
  }
}
