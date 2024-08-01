import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shart/screens/auth/login_screen.dart';
import 'package:shart/styling/shart_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 238, 238, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text(
          'Мой профиль',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: ShartColors.neutralBlack),
        ),
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => LoginScreen(),
                  ),
                  (route) => false,
                );
              },
              child: SvgPicture.asset('assets/ic_exit.svg')),
          SizedBox(width: 16)
        ],
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.white),
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/ic_doc.svg'),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Личные данные',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: ShartColors.neutralBlack,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        SvgPicture.asset('assets/ic_arrow_right.svg')
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/ic_doc.svg'),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Язык',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: ShartColors.neutralBlack,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          'Русский',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: ShartColors.neutral3,
                          ),
                        ),
                        SizedBox(width: 12),
                        SvgPicture.asset('assets/ic_arrow_right.svg')
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/ic_lock.svg'),
                        SizedBox(width: 8),
                        Text(
                          'Безопасность',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: ShartColors.neutralBlack,
                          ),
                        ),
                        SizedBox(width: 12),
                        Spacer(),
                        SvgPicture.asset('assets/ic_arrow_right.svg')
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/ic_push_green.svg'),
                        SizedBox(width: 8),
                        Text(
                          'Push-уведомления',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: ShartColors.neutralBlack,
                          ),
                        ),
                        SizedBox(width: 12),
                        Spacer(),
                        CupertinoSwitch(
                          // This bool value toggles the switch.
                          value: switchValue,
                          activeColor: ShartColors.primaryColor,
                          onChanged: (bool? value) {
                            setState(() {
                              switchValue = value ?? false;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(color: Colors.white),
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/ic_law.svg'),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Помощь юриста',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: ShartColors.neutralBlack,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          'WhatsApp',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: ShartColors.primaryColor,
                          ),
                        ),
                        SizedBox(width: 12),
                        SvgPicture.asset(
                          'assets/ic_arrow_right.svg',
                          colorFilter: ColorFilter.mode(
                              ShartColors.primaryColor, BlendMode.srcIn),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/ic_faq.svg'),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'FAQ',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: ShartColors.neutralBlack,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        SvgPicture.asset('assets/ic_arrow_right.svg')
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    child: Row(
                      children: [
                        Text(
                          'Политика конфиденциальности',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: ShartColors.neutralBlack,
                          ),
                        ),
                        SizedBox(width: 12),
                        Spacer(),
                        SvgPicture.asset('assets/ic_arrow_right.svg')
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    child: Row(
                      children: [
                        Text(
                          'Пользовательское соглашение',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: ShartColors.neutralBlack,
                          ),
                        ),
                        SizedBox(width: 12),
                        Spacer(),
                        SvgPicture.asset('assets/ic_arrow_right.svg')
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    child: Row(
                      children: [
                        Text(
                          'О приложении',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: ShartColors.neutralBlack,
                          ),
                        ),
                        SizedBox(width: 12),
                        Spacer(),
                        SvgPicture.asset('assets/ic_arrow_right.svg')
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/ic_instagram.svg'),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Instagram',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: ShartColors.neutralBlack,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.0),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/ic_flash.svg'),
                      SizedBox(width: 8.0),
                      Text(
                        'Оцените наше приложение',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: ShartColors.neutralBlack,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    'Будем рады если вы оставите оценку или отзыв',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: ShartColors.neutral2,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                    decoration: BoxDecoration(
                        color: ShartColors.lightPrimaryColor,
                        borderRadius: BorderRadius.circular(6.0)),
                    child: Text(
                      'Оценить',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: ShartColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 150),
          ],
        ),
      ),
    );
  }
}
