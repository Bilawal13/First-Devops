import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({required this.switchScreen, super.key});

  final void Function(String identifier) switchScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Bookly, Reading Is A Habit'),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              switchScreen('home');
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Wishlist'),
            onTap: () {
              switchScreen('wishlist');
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Account'),
            onTap: () {
              switchScreen('account');
            },
          ),
          ListTile(
            leading: Icon(Icons.filter_list),
            title: Text('Filters'),
            onTap: () {
              switchScreen('filters');
            },
          ),
        ],
      ),
    );
  }
}
