import 'package:flutter/material.dart';
import '../models/user.dart';

class UserProvider extends ChangeNotifier {
  final List<User> _users = [
    User(
      id: 1,
      name: 'John Doe',
      job: 'Flutter Developer',
      email: 'john@example.com',
      phone: '+380 50 123 45 67',
    ),
    User(
      id: 2,
      name: 'Jane Smith',
      job: 'UI/UX Designer',
      email: 'jane@example.com',
      phone: '+380 67 765 43 21',
    ),
    User(
      id: 3,
      name: 'Bob Johnson',
      job: 'Project Manager',
      email: 'bob@example.com',
      phone: '+380 93 111 22 33',
    ),
  ];

  List<User> get users => List.unmodifiable(_users);

  void updateUser(User updatedUser) {
    final index = _users.indexWhere((u) => u.id == updatedUser.id);
    if (index != -1) {
      _users[index] = updatedUser;
      notifyListeners();
    }
  }
}
