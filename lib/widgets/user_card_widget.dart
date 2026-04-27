import 'package:flutter/material.dart';
import '../models/user.dart';
import '../widgets/user_avatar.dart';
import '../constants/app_sizes.dart';

class UserCardWidget extends StatelessWidget {
  final User user;
  final VoidCallback onTap;

  const UserCardWidget({super.key, required this.user, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSizes.paddingSmall),
      child: ListTile(
        leading: UserAvatar(
          userName: user.name,
          userId: user.id,
          radius: AppSizes.avatarRadiusSmall,
          isHero: true,
        ),
        title: Text(
          user.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(user.job),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
