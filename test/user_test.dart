import 'package:flutter_test/flutter_test.dart';
import 'package:user_directory_app/models/user.dart';

void main() {
  test('User.copyWith() updates fields correctly', () {
    final user = User(
      id: 1,
      name: 'John',
      job: 'Developer',
      email: 'john@example.com',
      phone: '+380501234567',
    );

    final updated = user.copyWith(name: 'Jane');

    expect(updated.name, 'Jane');
    expect(updated.id, 1);
    expect(updated.job, 'Developer');
  });
}
