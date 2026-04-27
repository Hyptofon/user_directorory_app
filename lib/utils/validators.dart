class Validators {
  static String? required(String? value, {String fieldName = 'Field'}) {
    if (value == null || value.trim().isEmpty) return '$fieldName is required';
    return null;
  }

  static String? email(String? value) {
    if (value?.isEmpty ?? true) return null;
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value!)) {
      return 'Invalid email';
    }
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.trim().isEmpty) return 'Phone is required';
    final cleaned = value.replaceAll(RegExp(r'[\s\-\(\)]'), '');
    if (!RegExp(r'^\+?[\d]{10,13}$').hasMatch(cleaned)) {
      return 'Invalid phone number';
    }
    return null;
  }
}
