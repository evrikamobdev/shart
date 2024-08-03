import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shart/screens/auth/set_password_screen.dart';
import 'package:shart/styling/shart_colors.dart';
import 'package:shart/widgets/helpers.dart';

class CodeVerificationScreen extends StatefulWidget {
  final String phone;
  final String page;
  const CodeVerificationScreen(
      {super.key, required this.phone, required this.page});

  @override
  State<CodeVerificationScreen> createState() => _CodeVerificationScreenState();
}

class _CodeVerificationScreenState extends State<CodeVerificationScreen> {
  final TextEditingController _code = TextEditingController();
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();

  String phone = '';

  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool codeEntered = false;

  Timer? _timer;
  Duration myDuration = Duration(seconds: 59);
  bool sendAgain = false;

  @override
  void initState() {
    super.initState();

    phone = MaskTextInputFormatter(
      mask: '+# (###) ### ## ##',
      initialText: widget.phone,
    ).getMaskedText();

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
      });
      try {
        navigatePush(context, SetPasswordScreen(page: widget.page));
      } catch (e) {
        // Toast.error(context, e.toString());
      } finally {}
    }
  }

  void _sendAgain() async {
    //API request
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWithBackBtn(
          widget.page == 'signup'
              ? 'Подтверждение номера'
              : 'Восстановление пароля',
          context),
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
                    phone,
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
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: PinCodeTextField(
                cursorHeight: 18,
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
                  fieldWidth: 56,
                  fieldHeight: 57,
                  borderWidth: 1,
                  selectedBorderWidth: 1,
                  activeBorderWidth: 1,
                  errorBorderWidth: 1,
                  inactiveBorderWidth: 1,
                  disabledBorderWidth: 1,
                  activeColor: codeEntered
                      ? ShartColors.neutral4
                      : ShartColors.primaryColor,
                  selectedColor: ShartColors.primaryColor,
                  selectedFillColor: Colors.white,
                  inactiveColor: ShartColors.neutral4,
                  inactiveFillColor: Colors.white,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(6.0),
                  activeFillColor: Colors.white,
                ),
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: ShartColors.neutralBlack,
                ),
                cursorColor: ShartColors.neutralBlack,
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
            SizedBox(height: 8.0),
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
