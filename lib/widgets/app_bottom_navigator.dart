import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kombe/constants/constants.dart';

class AppBottomNavigator extends StatefulWidget {
  const AppBottomNavigator({Key? key}) : super(key: key);

  @override
  _AppBottomNavigatorState createState() => _AppBottomNavigatorState();
}

class _AppBottomNavigatorState extends State<AppBottomNavigator> {
  int _selectedIndex = 0;
  List<dynamic> menuItems = [
    {
      'icon': 'assets/icons/home.svg',
      'label': 'Home',
    },
    {'icon': 'assets/icons/box.svg', 'label': 'Delivery'},
    {'icon': 'assets/icons/chat.svg', 'label': 'Messages'},
    {'icon': 'assets/icons/wallet.svg', 'label': 'Wallet'},
    {'icon': "assets/icons/profile.svg", 'label': "Profile"}
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      showSelectedLabels: true,
      unselectedItemColor: Colors.black87,
      selectedLabelStyle: TextStyle(height: 1.5, fontSize: 13),
      unselectedLabelStyle: TextStyle(height: 1.5, fontSize: 13),
      elevation: 32.0,
      type: BottomNavigationBarType.fixed,
      items: menuItems.map((i) {
        return BottomNavigationBarItem(
            icon: SvgPicture.asset(i['icon']),
            activeIcon: SvgPicture.asset(
              i['icon'],
              color: primaryColor,
            ),
            label: i['label']);
      }).toList(),
      currentIndex: 0,
      selectedItemColor: primaryColor,
      onTap: _onItemTapped,
    );
  }
}
