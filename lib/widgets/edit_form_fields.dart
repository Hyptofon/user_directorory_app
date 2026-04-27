import 'package:flutter/material.dart';
import '../constants/app_strings.dart';
import '../constants/app_sizes.dart';
import '../utils/validators.dart';

class EditFormFields extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController jobController;
  final TextEditingController emailController;
  final TextEditingController phoneController;

  const EditFormFields({
    super.key,
    required this.nameController,
    required this.jobController,
    required this.emailController,
    required this.phoneController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          controller: nameController,
          validator: (value) =>
              Validators.required(value, fieldName: AppStrings.name),
          decoration: const InputDecoration(
            labelText: AppStrings.name,
            prefixIcon: Icon(Icons.person),
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: AppSizes.spacingMedium),
        TextFormField(
          controller: jobController,
          validator: (value) =>
              Validators.required(value, fieldName: AppStrings.job),
          decoration: const InputDecoration(
            labelText: AppStrings.job,
            prefixIcon: Icon(Icons.work),
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: AppSizes.spacingMedium),
        TextFormField(
          controller: emailController,
          validator: Validators.email,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            labelText: AppStrings.email,
            prefixIcon: Icon(Icons.email),
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: AppSizes.spacingMedium),
        TextFormField(
          controller: phoneController,
          validator: Validators.phone,
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(
            labelText: AppStrings.phone,
            prefixIcon: Icon(Icons.phone),
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
