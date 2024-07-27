import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
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
      body: Center(child: Text('Рейтинг')),
    );
  }
}
