import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          ListTile(
            title: Text('Cubit method'),
            subtitle: Text('The cubit method for counter app'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              context.push('/cubits');
            },
          ),
          SizedBox(height: 10),
          ListTile(
            title: Text('Bloc method'),
            subtitle: Text('The bloc method for counter app'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              context.push('/bloc');
            },
          ),
          ListTile(
            title: Text('Register'),
            subtitle: Text('Register screen'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              context.push('/register');
            },
          ),
        ],
      ),
    );
  }
}
