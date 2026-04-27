import 'package:flutter/material.dart';
import '../models/user.dart';
import '../models/edit_result.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/edit_form_fields.dart';
import '../constants/app_strings.dart';
import '../constants/app_sizes.dart';

class EditScreen extends StatefulWidget {
  final User user;

  const EditScreen({super.key, required this.user});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _jobController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user.name);
    _jobController = TextEditingController(text: widget.user.job);
    _emailController = TextEditingController(text: widget.user.email);
    _phoneController = TextEditingController(text: widget.user.phone);
  }

  void _saveChanges() {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final updatedUser = widget.user.copyWith(
      name: _nameController.text.trim(),
      job: _jobController.text.trim(),
      email: _emailController.text.trim(),
      phone: _phoneController.text.trim(),
    );

    Navigator.of(context).pop(SavedUser(updatedUser));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _jobController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: AppStrings.editProfile),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.paddingLarge),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              EditFormFields(
                nameController: _nameController,
                jobController: _jobController,
                emailController: _emailController,
                phoneController: _phoneController,
              ),
              const SizedBox(height: AppSizes.spacingLarge),
              ElevatedButton(
                onPressed: _saveChanges,
                child: const Text(AppStrings.saveChanges),
              ),
              const SizedBox(height: AppSizes.spacingSmall),
              OutlinedButton(
                onPressed: () => Navigator.of(context).pop(Cancelled()),
                child: const Text(AppStrings.cancel),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
