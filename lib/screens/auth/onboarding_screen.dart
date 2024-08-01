import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shart/screens/auth/login_screen.dart';
import 'package:shart/styling/shart_colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  final List<Widget> widgetList = [
    Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SvgPicture.asset('assets/onboarding1.svg'),
          SizedBox(height: 120.0),
          Container(
            margin: EdgeInsets.only(left: 16.0, right: 16.0),
            padding: EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text(
                  'Безопасные займы',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: ShartColors.neutralBlack,
                  ),
                ),
                SizedBox(height: 12.0),
                Text(
                  'Мы обеспечиваем безопасность через юридические онлайн-договоры между сторонами, предотвращая финансовые риски и непредвиденные обстоятельства.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: ShartColors.neutral2,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 48.0)
        ],
      ),
    ),
    Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SvgPicture.asset('assets/onboarding2.svg'),
          SizedBox(height: 120.0),
          Container(
            margin: EdgeInsets.only(left: 16.0, right: 16.0),
            padding: EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text(
                  'Беспроцентные займы',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: ShartColors.neutralBlack,
                  ),
                ),
                SizedBox(height: 12.0),
                Text(
                  'В нашем приложении вы можете получить доступ к займам без процентов — быстро и удобно. Возьмите нужную сумму в долг без лишних комиссий и переплат.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: ShartColors.neutral2,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 48.0)
        ],
      ),
    ),
    Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SvgPicture.asset('assets/onboarding3.svg'),
          SizedBox(height: 120.0),
          Container(
            margin: EdgeInsets.only(left: 16.0, right: 16.0),
            padding: EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text(
                  'Контроль сделок',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: ShartColors.neutralBlack,
                  ),
                ),
                SizedBox(height: 12.0),
                Text(
                  'Управляйте своими займами через удобное приложение, получайте уведомления о сроках и запросах на займы, чтобы быть в курсе всех финансовых операций.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: ShartColors.neutral2,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 48.0)
        ],
      ),
    ),
    Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SvgPicture.asset('assets/onboarding4.svg'),
          SizedBox(height: 120.0),
          Container(
            margin: EdgeInsets.only(left: 16.0, right: 16.0),
            padding: EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text(
                  'Повышайте рейтинг',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: ShartColors.neutralBlack,
                  ),
                ),
                SizedBox(height: 12.0),
                Text(
                  'Мы предоставляем вам рейтинг пользователя, чтобы помочь вам принимать решение о сотрудничестве. Чем больше успешных сделок, тем выше рейтинг!\n',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: ShartColors.neutral2,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 48.0)
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                child: CarouselSlider(
                  items: widgetList,
                  carouselController: _controller,
                  options: CarouselOptions(
                      height: double.infinity,
                      autoPlay: true,
                      viewportFraction: 1.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widgetList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: _current == entry.key ? 10.0 : 8.0,
                      height: _current == entry.key ? 10.0 : 8.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 0.0, horizontal: 6.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == entry.key
                            ? ShartColors.primaryColor
                            : ShartColors.neutral5,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 32.0),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) => LoginScreen(),
                    ),
                  );
                },
                child: Text('Войти или зарегистрироваться'),
              ),
            ),
            SizedBox(height: 20.0)
          ],
        ),
      ),
    );
  }
}
