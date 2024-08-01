import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shart/screens/main/create_loan_screen.dart';
import 'package:shart/styling/shart_colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> cards = [
    'assets/banner1.jpg',
    'assets/banner1.jpg',
    'assets/banner1.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 238, 238, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SvgPicture.asset('assets/ic_logo.svg'),
        centerTitle: false,
        actions: [
          SvgPicture.asset('assets/ic_notification.svg'),
          SizedBox(
            width: 16,
          )
        ],
      ),
      body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 240, 219, 1),
                      borderRadius: BorderRadius.circular(8.0)),
                  padding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset('assets/ic_warning.svg'),
                      SizedBox(width: 6),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Подтвердите личность аккаунта',
                              style: TextStyle(
                                  color: ShartColors.neutralBlack,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 6.0),
                            Text(
                              'Для оформления сделок и взаимодействия с пользователями пройдите верификацию',
                              style: TextStyle(
                                  color: ShartColors.neutral2,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(height: 12.0),
                            ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                ),
                              ),
                              child: Text(
                                'Пройти верификацию',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 12),
                      SvgPicture.asset('assets/ic_close.svg'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                padding: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    SizedBox(height: 16),
                    ImageSlideshow(
                      width: double.infinity,
                      height: 240,
                      indicatorRadius: 4,
                      indicatorColor: Color.fromRGBO(156, 165, 172, 1),
                      indicatorBackgroundColor:
                          Color.fromRGBO(218, 225, 231, 1),
                      onPageChanged: (value) {},
                      autoPlayInterval: 5000,
                      isLoop: true,
                      children: cards
                          .map(
                            (card) => Padding(
                              padding: EdgeInsets.only(
                                  left: 16.0, right: 16.0, bottom: 32),
                              child: GestureDetector(
                                onTap: () {},
                                child: Card(
                                  clipBehavior: Clip.antiAlias,
                                  margin: EdgeInsets.zero,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(12.0)),
                                  child: SvgPicture.asset('assets/banner.svg'),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute<dynamic>(
                                    builder: (BuildContext context) =>
                                        CreateLoanScreen(),
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.all(6.0),
                                child: Column(
                                  children: [
                                    SvgPicture.asset('assets/ic_loan.svg'),
                                    SizedBox(height: 8),
                                    Text(
                                      'Взять в долг\n',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: ShartColors.neutralBlack,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(6.0),
                              child: Column(
                                children: [
                                  SvgPicture.asset('assets/ic_trust.svg'),
                                  SizedBox(height: 8),
                                  Text(
                                    'Доверие\n',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(156, 165, 172, 1),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(6.0),
                              child: Column(
                                children: [
                                  SvgPicture.asset('assets/ic_advances.svg'),
                                  SizedBox(height: 8),
                                  Text(
                                    'Авансы\n',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(156, 165, 172, 1),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(6.0),
                              child: Column(
                                children: [
                                  SvgPicture.asset('assets/ic_trust.svg'),
                                  SizedBox(height: 8),
                                  Text(
                                    'Товарный\nзайм',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(156, 165, 172, 1),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(6.0),
                              child: Column(
                                children: [
                                  SvgPicture.asset('assets/ic_trust.svg'),
                                  SizedBox(height: 8),
                                  Text(
                                    'Клуб\nдоверие',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(156, 165, 172, 1),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Container(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                padding: EdgeInsets.all(0),
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultTabController(
                      length: 2,
                      child: SizedBox(
                        height: 700,
                        child: Scaffold(
                          backgroundColor: Colors.white,
                          appBar: AppBar(
                            backgroundColor: Colors.white,
                            title: Text(
                              'Статистика по займам',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: ShartColors.neutralBlack),
                            ),
                            centerTitle: false,
                            bottom: PreferredSize(
                              preferredSize: const Size.fromHeight(40),
                              child: Container(
                                height: 40,
                                margin: EdgeInsets.only(
                                  left: 16.0,
                                  right: 16.0,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(6.0)),
                                  color: Color.fromRGBO(248, 248, 248, 1),
                                ),
                                child: TabBar(
                                  padding: EdgeInsets.all(4),
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  dividerColor: Colors.transparent,
                                  indicator: BoxDecoration(
                                    color: ShartColors.lightPrimaryColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6.0)),
                                  ),
                                  labelColor: ShartColors.primaryColor,
                                  unselectedLabelColor:
                                      Color.fromRGBO(156, 165, 172, 1),
                                  tabs: [
                                    TabItem(title: 'Я должен'),
                                    TabItem(title: 'Мне должны'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          body: TabBarView(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 24),
                                child: Column(
                                  children: [
                                    Image.asset('assets/stat.jpg'),
                                    SizedBox(height: 16),
                                    Row(
                                      children: [
                                        SvgPicture.asset('assets/1.svg'),
                                        SizedBox(width: 8.0),
                                        Expanded(
                                            child: Text(
                                          'Запросов передано',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: ShartColors.neutral3,
                                          ),
                                        )),
                                        SizedBox(width: 8.0),
                                        Text(
                                          '25',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: ShartColors.neutralBlack,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16),
                                    Row(
                                      children: [
                                        SvgPicture.asset('assets/2.svg'),
                                        SizedBox(width: 8.0),
                                        Expanded(
                                            child: Text(
                                          'На подписании',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: ShartColors.neutral3,
                                          ),
                                        )),
                                        SizedBox(width: 8.0),
                                        Text(
                                          '10',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: ShartColors.neutralBlack,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16),
                                    Row(
                                      children: [
                                        SvgPicture.asset('assets/3.svg'),
                                        SizedBox(width: 8.0),
                                        Expanded(
                                            child: Text(
                                          'Действующих',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: ShartColors.neutral3,
                                          ),
                                        )),
                                        SizedBox(width: 8.0),
                                        Text(
                                          '3',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: ShartColors.neutralBlack,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16),
                                    Row(
                                      children: [
                                        SvgPicture.asset('assets/4.svg'),
                                        SizedBox(width: 8.0),
                                        Expanded(
                                            child: Text(
                                          '3 дня до просрочки',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: ShartColors.neutral3,
                                          ),
                                        )),
                                        SizedBox(width: 8.0),
                                        Text(
                                          '2',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: ShartColors.neutralBlack,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16),
                                    Row(
                                      children: [
                                        SvgPicture.asset('assets/5.svg'),
                                        SizedBox(width: 8.0),
                                        Expanded(
                                            child: Text(
                                          'Просроченных',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: ShartColors.neutral3,
                                          ),
                                        )),
                                        SizedBox(width: 8.0),
                                        Text(
                                          '1',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: ShartColors.neutralBlack,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16),
                                    Row(
                                      children: [
                                        SvgPicture.asset('assets/6.svg'),
                                        SizedBox(width: 8.0),
                                        Expanded(
                                            child: Text(
                                          'Оплаченных',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: ShartColors.neutral3,
                                          ),
                                        )),
                                        SizedBox(width: 8.0),
                                        Text(
                                          '10',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: ShartColors.neutralBlack,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16),
                                    Row(
                                      children: [
                                        SvgPicture.asset('assets/7.svg'),
                                        SizedBox(width: 8.0),
                                        Expanded(
                                            child: Text(
                                          'Благодарственные сделки',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: ShartColors.neutral3,
                                          ),
                                        )),
                                        SizedBox(width: 8.0),
                                        Text(
                                          '10',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: ShartColors.neutralBlack,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 24),
                                child: Column(
                                  children: [
                                    Image.asset('assets/stat2.jpg'),
                                    SizedBox(height: 16),
                                    Row(
                                      children: [
                                        SvgPicture.asset('assets/1.svg'),
                                        SizedBox(width: 8.0),
                                        Expanded(
                                            child: Text(
                                          'Запросов принято',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: ShartColors.neutral3,
                                          ),
                                        )),
                                        SizedBox(width: 8.0),
                                        Text(
                                          '26',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: ShartColors.neutralBlack,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16),
                                    Row(
                                      children: [
                                        SvgPicture.asset('assets/2.svg'),
                                        SizedBox(width: 8.0),
                                        Expanded(
                                            child: Text(
                                          'На подписании',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: ShartColors.neutral3,
                                          ),
                                        )),
                                        SizedBox(width: 8.0),
                                        Text(
                                          '10',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: ShartColors.neutralBlack,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16),
                                    Row(
                                      children: [
                                        SvgPicture.asset('assets/3.svg'),
                                        SizedBox(width: 8.0),
                                        Expanded(
                                            child: Text(
                                          'Действующих',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: ShartColors.neutral3,
                                          ),
                                        )),
                                        SizedBox(width: 8.0),
                                        Text(
                                          '3',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: ShartColors.neutralBlack,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16),
                                    Row(
                                      children: [
                                        SvgPicture.asset('assets/4.svg'),
                                        SizedBox(width: 8.0),
                                        Expanded(
                                            child: Text(
                                          '3 дня до просрочки',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: ShartColors.neutral3,
                                          ),
                                        )),
                                        SizedBox(width: 8.0),
                                        Text(
                                          '2',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: ShartColors.neutralBlack,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16),
                                    Row(
                                      children: [
                                        SvgPicture.asset('assets/5.svg'),
                                        SizedBox(width: 8.0),
                                        Expanded(
                                            child: Text(
                                          'Просроченных',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: ShartColors.neutral3,
                                          ),
                                        )),
                                        SizedBox(width: 8.0),
                                        Text(
                                          '1',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: ShartColors.neutralBlack,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16),
                                    Row(
                                      children: [
                                        SvgPicture.asset('assets/6.svg'),
                                        SizedBox(width: 8.0),
                                        Expanded(
                                            child: Text(
                                          'Оплаченных',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: ShartColors.neutral3,
                                          ),
                                        )),
                                        SizedBox(width: 8.0),
                                        Text(
                                          '10',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: ShartColors.neutralBlack,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16),
                                    Row(
                                      children: [
                                        SvgPicture.asset('assets/7.svg'),
                                        SizedBox(width: 8.0),
                                        Expanded(
                                            child: Text(
                                          'Благодарственные сделки',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: ShartColors.neutral3,
                                          ),
                                        )),
                                        SizedBox(width: 8.0),
                                        Text(
                                          '10',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: ShartColors.neutralBlack,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 150.0),
            ],
          )),
    );
  }
}

class TabItem extends StatelessWidget {
  final String title;

  const TabItem({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
    );
  }
}
