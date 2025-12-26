import 'package:flutter/material.dart';
import '../models/user.dart';

class AddUserView extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add User')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
            ),
            SizedBox(height: 20),
            AnimatedScale(
  scale: 1.0,
  duration: Duration(milliseconds: 200),
  child: ElevatedButton(
    onPressed: () {
      final user = User(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
      );
      Navigator.pop(context, user);
    },
    child: Text('Save'),
  ),
),
          ],
        ),
      ),
    );
  }
}