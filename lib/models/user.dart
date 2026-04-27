class User {
  final int id;
  final String name;
  final String job;
  final String email;
  final String phone;

  User({
    required this.id,
    required String name,
    required String job,
    required String email,
    required String phone,
  }) : name = _validateString(name, 'Name'),
       job = _validateString(job, 'Job'),
       email = _validateString(email, 'Email'),
       phone = _validateString(phone, 'Phone');

  static String _validateString(String v, String fieldName) {
    if (v.trim().isEmpty) throw ArgumentError('$fieldName is empty');
    return v;
  }

  User copyWith({
    int? id,
    String? name,
    String? job,
    String? email,
    String? phone,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      job: job ?? this.job,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }
}
