import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shart/screens/main/create_loan_screen.dart';
import 'package:shart/screens/main/main_screen.dart';
import 'package:shart/screens/my_loans/my_loans_screen.dart';
import 'package:shart/screens/profile/profile_screen.dart';
import 'package:shart/screens/rating/rating_screen.dart';
import 'package:shart/styling/shart_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final iconList = [
    'assets/ic_home.svg',
    'assets/ic_loans.svg',
    'assets/ic_rating.svg',
    'assets/ic_profile.svg',
  ];

  final List<String> _titles = ["Главная", "Мои займы", "Рейтинг", "Профиль"];

  final List<Widget> _pages = [
    MainScreen(),
    MyLoansScreen(),
    RatingScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _pages[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => CreateLoanScreen(),
            ),
          );
        },
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: SvgPicture.asset('assets/ic_add.svg'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          final color =
              isActive ? ShartColors.primaryColor : ShartColors.neutral;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                iconList[index],
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
              ),
              const SizedBox(height: 4),
              Text(
                _titles[index],
                style: TextStyle(
                  color: color,
                  fontSize: 12,
                ),
              )
            ],
          );
        },
        activeIndex: _currentIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.smoothEdge,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        splashSpeedInMilliseconds: 1,
      ),
    );
  }
}
