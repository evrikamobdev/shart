// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shart/home_screen.dart';
import 'package:shart/styling/shart_colors.dart';
import 'package:shart/widgets/helpers.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _phone = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _hidePassword = true;

  void _logIn() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_formKey.currentState!.validate()) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => HomeScreen(),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.0),
                  Center(child: SvgPicture.asset('assets/ic_logo.svg')),
                  SizedBox(height: 60.0),
                  Text(
                    'Номер телефона',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: ShartColors.neutralBlack,
                    ),
                  ),
                  SizedBox(height: 6.0),
                  Focus(
                    child: TextFormField(
                      controller: _phone,
                      inputFormatters: [maskFormatter],
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: 'Введите номер телефона',
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                      ),
                      validator: validateMobile,
                    ),
                    onFocusChange: (hasFocus) {
                      if (hasFocus) {
                        if (maskFormatter.getMaskedText().isEmpty) {
                          _phone.text = '+7 (';
                        }
                        // else {
                        //   _phone.text = maskFormatter.getMaskedText();
                        // }
                      }
                    },
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    'Пароль',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: ShartColors.neutralBlack,
                    ),
                  ),
                  SizedBox(height: 6.0),
                  TextFormField(
                    controller: _password,
                    obscureText: _hidePassword,
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: ShartColors.neutralBlack,
                    ),
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                      labelText: 'Введите пароль',
                      counterText: "",
                      suffixIcon: IconButton(
                        icon: Icon(
                          _hidePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _hidePassword = !_hidePassword;
                          });
                        },
                      ),
                    ),
                    validator: validateRequiredField,
                  ),
                  SizedBox(height: 6.0),
                  Text(
                    'Забыли пароль?',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(58, 112, 226, 1),
                    ),
                  ),
                  SizedBox(height: 24.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        _logIn();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                        child: Text(
                          'Войти',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 60.0),
                  Center(
                    child: Text(
                      'Нет аккаунта?',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: ShartColors.neutralBlack,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Center(
                    child: Text(
                      'Зарегистрироваться',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(58, 112, 226, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
