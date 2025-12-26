import 'package:flutter/material.dart';
import '../viewmodels/user_viewmodel.dart';
import '../models/user.dart';
import 'add_user_view.dart';

class UserView extends StatefulWidget {
  final VoidCallback onThemeChanged;

  UserView({required this.onThemeChanged});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  final UserViewModel viewModel = UserViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: Text('Users'),
  actions: [
    IconButton(
      icon: Icon(Icons.brightness_6),
      onPressed: widget.onThemeChanged,
    ),
  ],
),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              'Location: Kyiv (GPS)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: viewModel.users.length,
              itemBuilder: (context, index) {
                final User user = viewModel.users[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
         final User? newUser = await Navigator.push(
  context,
  PageRouteBuilder(
    pageBuilder: (_, __, ___) => AddUserView(),
    transitionsBuilder: (_, animation, __, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  ),
);

          if (newUser != null) {
            setState(() {
              viewModel.addUser(newUser);
            });
          }
        },
      ),
    );
  }
}