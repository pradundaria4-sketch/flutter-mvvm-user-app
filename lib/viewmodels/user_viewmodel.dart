import '../models/user.dart';

class UserViewModel {
  final List<User> users = [
    User(
      name: 'Дарія',
      email: 'daria@gmail.com',
      phone: '+380000000000',
    ),
  ];

  void addUser(User user) {
    users.add(user);
  }
}