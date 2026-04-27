import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../models/edit_result.dart';
import '../widgets/info_row_widget.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/user_avatar.dart';
import '../providers/user_provider.dart';
import '../constants/app_routes.dart';
import '../constants/app_strings.dart';
import '../constants/app_sizes.dart';

class ProfileScreen extends StatefulWidget {
  final User user;

  const ProfileScreen({super.key, required this.user});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late User _currentUser;

  @override
  void initState() {
    super.initState();
    _currentUser = widget.user;
  }

  Future<void> _editProfile() async {
    final result = await Navigator.of(
      context,
    ).pushNamed<EditResult>(AppRoutes.edit, arguments: _currentUser);
    if (!mounted) return;
    if (result is SavedUser) {
      final updatedUser = result.user;
      context.read<UserProvider>().updateUser(updatedUser);
      setState(() {
        _currentUser = updatedUser;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text(AppStrings.profileUpdated)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: _currentUser.name),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.paddingLarge),
            child: Column(
              children: [
                UserAvatar(
                  userName: _currentUser.name,
                  userId: _currentUser.id,
                  fontSize: AppSizes.avatarFontSizeLarge,
                  isHero: true,
                ),
                const SizedBox(height: AppSizes.spacingLarge),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSizes.paddingMedium),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InfoRowWidget(
                          label: '${AppStrings.name}:',
                          value: _currentUser.name,
                        ),
                        const Divider(),
                        InfoRowWidget(
                          label: '${AppStrings.job}:',
                          value: _currentUser.job,
                        ),
                        const Divider(),
                        InfoRowWidget(
                          label: '${AppStrings.email}:',
                          value: _currentUser.email,
                        ),
                        const Divider(),
                        InfoRowWidget(
                          label: '${AppStrings.phone}:',
                          value: _currentUser.phone,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: AppSizes.spacingLarge),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _editProfile,
                    child: const Text(AppStrings.editProfile),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
