import 'package:flutter/material.dart';
import 'package:flutter_application_uts/contact_list.dart';
import 'package:flutter_application_uts/home.dart';

class DynamicBottomNavbar extends StatefulWidget {
  const DynamicBottomNavbar({super.key});

  @override
  State<DynamicBottomNavbar> createState() => _DynamicBottomNavbarState();
}

class _DynamicBottomNavbarState extends State<DynamicBottomNavbar> {
  int _currentPageIndex = 0;

  final List<Widget> _pages = <Widget>[
    const MyHomePage(),
    const ContactList(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _pages[
            _currentPageIndex], // Menampilkan halaman berdasarkan tab yang dipilih
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentPageIndex,
        onTap: onTabTapped, // Menangani aksi tap pada tab
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_work_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Contact List',
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 169, 172, 174),
        selectedItemColor: const Color.fromARGB(255, 3, 3, 3),
        unselectedItemColor: const Color.fromARGB(255, 0, 0, 0),
      ),
    );
  }
}
