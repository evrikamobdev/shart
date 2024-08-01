import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shart/styling/shart_colors.dart';
import 'package:shart/widgets/helpers.dart';

class CodeVerificationScreen extends StatefulWidget {
  const CodeVerificationScreen({super.key});

  @override
  State<CodeVerificationScreen> createState() => _CodeVerificationScreenState();
}

class _CodeVerificationScreenState extends State<CodeVerificationScreen> {
  final TextEditingController _code = TextEditingController();
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();

  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool _loading = false;
  bool codeEntered = false;

  Timer? _timer;
  Duration myDuration = Duration(seconds: 59);
  bool sendAgain = false;

  @override
  void initState() {
    super.initState();
    startTimer();
    errorController = StreamController<ErrorAnimationType>();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        _timer!.cancel();
        sendAgain = true;
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  void dispose() {
    errorController.close();
    _timer!.cancel();
    _code.dispose();

    super.dispose();
  }

  void _confirmCode() async {
    if (currentText.length != 4) {
      errorController.add(ErrorAnimationType.shake);
      setState(() => hasError = true);
    }
    if (currentText.length == 4) {
      setState(() {
        hasError = false;
        _loading = true;
      });
    }
  }

  void _sendAgain() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWithBackBtn('Подтверждение номера', context),
      body: Padding(
        padding: const EdgeInsets.only(
            left: 16.0, top: 32.0, right: 16.0, bottom: 32.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Text(
                    'Введите код',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: ShartColors.neutralBlack,
                    ),
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    'Код подтверждения отправлен на номер',
                    style: TextStyle(
                      color: ShartColors.neutral2,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '+7 (701) 717 33 77',
                    style: TextStyle(
                      color: ShartColors.neutralBlack,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 70),
              child: PinCodeTextField(
                autoFocus: true,
                autoDisposeControllers: false,
                appContext: context,
                length: 4,
                obscureText: false,
                blinkWhenObscuring: true,
                animationType: AnimationType.fade,
                validator: (v) {
                  if (v!.length < 3) {
                    return '';
                  } else {
                    return null;
                  }
                },
                pinTheme: PinTheme(
                  borderWidth: 1,
                  activeColor:
                      codeEntered ? Colors.grey : ShartColors.primaryColor,
                  selectedColor: ShartColors.primaryColor,
                  selectedFillColor: Colors.white,
                  inactiveColor: Colors.grey,
                  inactiveFillColor: Colors.white,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  activeFillColor: Colors.white,
                ),
                cursorColor: Colors.black,
                animationDuration: const Duration(milliseconds: 100),
                enableActiveFill: true,
                errorAnimationController: errorController,
                controller: _code,
                keyboardType: TextInputType.number,
                onCompleted: (v) {
                  debugPrint("Completed");
                  setState(() {
                    codeEntered = true;
                  });

                  _confirmCode();
                },
                onChanged: (value) {
                  setState(() {
                    currentText = value;
                    codeEntered = false;
                  });
                },
              ),
            ),
            sendAgain
                ? InkWell(
                    onTap: () {
                      setState(() {
                        sendAgain = false;
                        myDuration = Duration(minutes: 2);
                        startTimer();
                        _sendAgain();
                      });
                    },
                    child: Text('Отправить код еще раз',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: ShartColors.mainBlue,
                        )),
                  )
                : Text(
                    '${'Отправить код повторно через '}${formatDuration(myDuration)}${' сек.'}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: ShartColors.neutral2,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
