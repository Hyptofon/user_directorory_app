import 'user.dart';

sealed class EditResult {}

class SavedUser extends EditResult {
  final User user;
  SavedUser(this.user);
}

class Cancelled extends EditResult {}
