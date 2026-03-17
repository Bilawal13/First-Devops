import 'package:bookly/screens/account.dart';
import 'package:bookly/screens/filters.dart';
import 'package:bookly/screens/home_page.dart';
import 'package:bookly/screens/wishlist.dart';
import 'package:bookly/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class Tabscreen extends StatefulWidget {
  const Tabscreen({super.key});

  @override
  State<Tabscreen> createState() => _TabscreenState();
}

class _TabscreenState extends State<Tabscreen> {
  void _selectPage(int index) {
    setState(() {
      this.index = index;
    });
  }

  void switchScreen(String identifier) {
    Navigator.of(context).pop();
    setState(() {
      if (identifier == 'home') {
        index = 0;
      } else if (identifier == 'wishlist') {
        index = 1;
      } else if (identifier == 'account') {
        index = 2;
      } else if (identifier == 'filters') {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => Filters()));
      }
    });
  }

  var index = 0;

  Widget activePage = HomePage();
  String appBarTitle = 'Home';

  @override
  Widget build(BuildContext context) {
    if (index == 0) {
      activePage = HomePage();
      appBarTitle = 'Bookly - Home';
    } else if (index == 1) {
      activePage = Wishlist();
      appBarTitle = 'Bookly - Wish List';
    } else if (index == 2) {
      activePage = Account();
      appBarTitle = 'Bookly - Profile';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          appBarTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'WishList',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      drawer: MainDrawer(switchScreen: switchScreen),
      body: Center(child: activePage),
    );
  }
}
