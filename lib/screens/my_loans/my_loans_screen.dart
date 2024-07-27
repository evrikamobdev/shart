import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyLoansScreen extends StatefulWidget {
  const MyLoansScreen({super.key});

  @override
  State<MyLoansScreen> createState() => _MyLoansScreenState();
}

class _MyLoansScreenState extends State<MyLoansScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: Center(child: Text('Мои займы')),
    );
  }
}
