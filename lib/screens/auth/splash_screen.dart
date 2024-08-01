import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shart/screens/auth/onboarding_screen.dart';
import 'package:shart/styling/shart_colors.dart';
import 'package:shart/widgets/helpers.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _logoAtTop = false;
  bool _containerVisible = false;

  String _selectedLanguage = 'rus';

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      setState(() {
        _logoAtTop = true;
        _containerVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double safeAreaVerticalPadding = MediaQuery.of(context).padding.top +
        MediaQuery.of(context).padding.bottom;
    final double availableHeight = screenHeight - safeAreaVerticalPadding;
    const double logoHeight = 153.0;
    const double logoWidth = 130.0;
    final double topPosition =
        (availableHeight - logoHeight) / 2 + MediaQuery.of(context).padding.top;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bg.jpg'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              top: _logoAtTop
                  ? 55 + MediaQuery.of(context).padding.top
                  : topPosition,
              left: MediaQuery.of(context).size.width / 2 - logoWidth / 2,
              child: SizedBox(
                width: logoWidth,
                height: logoHeight,
                child: SvgPicture.asset('assets/ic_shart_rate.svg'),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              bottom: _containerVisible ? 0.0 : -500.0,
              left: 0,
              right: 0,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: _containerVisible ? 1.0 : 0.0,
                child: IntrinsicHeight(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(12.0),
                      ),
                    ),
                    padding: EdgeInsets.only(
                        top: 32.0, left: 16.0, right: 16.0, bottom: 32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(
                              color: ShartColors.neutralBlack,
                              fontSize: 26,
                              fontWeight: FontWeight.w700,
                            ),
                            children: [
                              TextSpan(
                                text: 'Добро пожаловать в приложение ',
                              ),
                              TextSpan(
                                text: 'Shart',
                                style: TextStyle(
                                  color: ShartColors.primaryColor,
                                  fontSize: 26,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          'Ваш надёжный партнёр для комфортных и безопасных займов без процентов. Управляйте сделками легко и быстро!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ShartColors.neutral2,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 32.0),
                        Text(
                          'Выберите язык',
                          style: TextStyle(
                            color: ShartColors.neutralBlack,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 12.0),
                        CheckListTile(
                          value: 'rus',
                          groupValue: _selectedLanguage,
                          onChanged: (dynamic value) {
                            setState(() {
                              _selectedLanguage = value;
                            });
                          },
                          title: Text(
                            'Русский',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(44, 44, 46, 1),
                            ),
                          ),
                          activeIcon: SvgPicture.asset(
                            'assets/ic_rb_active.svg',
                            height: 18,
                            width: 18,
                          ),
                          inactiveIcon: SvgPicture.asset(
                            'assets/ic_rb.svg',
                            height: 18,
                            width: 18,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        CheckListTile(
                          value: 'kaz',
                          groupValue: _selectedLanguage,
                          onChanged: (dynamic value) {
                            setState(() {
                              _selectedLanguage = value;
                            });
                          },
                          title: Text(
                            'Казахский',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(44, 44, 46, 1),
                            ),
                          ),
                          activeIcon: SvgPicture.asset(
                            'assets/ic_rb_active.svg',
                            height: 18,
                            width: 18,
                          ),
                          inactiveIcon: SvgPicture.asset(
                            'assets/ic_rb.svg',
                            height: 18,
                            width: 18,
                          ),
                        ),
                        SizedBox(height: 32.0),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<dynamic>(
                                builder: (BuildContext context) =>
                                    OnboardingScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Продолжить',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(height: 32.0),
                        Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: TextStyle(
                                color: ShartColors.neutral3,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                              children: [
                                TextSpan(
                                  text:
                                      'Нажимая «Продолжить», вы соглашаетесь с',
                                ),
                                TextSpan(
                                  text: '\nпользовательским соглашением',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Color.fromRGBO(58, 112, 226, 1),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 32.0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
