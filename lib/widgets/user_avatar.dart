import 'package:flutter/material.dart';
import '../constants/app_sizes.dart';

class UserAvatar extends StatelessWidget {
  final String userName;
  final int userId;
  final double radius;
  final double? fontSize;
  final bool isHero;

  const UserAvatar({
    super.key,
    required this.userName,
    required this.userId,
    this.radius = AppSizes.avatarRadiusLarge,
    this.fontSize,
    this.isHero = false,
  });

  @override
  Widget build(BuildContext context) {
    final avatar = CircleAvatar(
      radius: radius,
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: Text(
        userName[0],
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
          fontSize: fontSize,
        ),
      ),
    );

    if (isHero) {
      return Hero(tag: 'avatar-$userId', child: avatar);
    }

    return avatar;
  }
}
