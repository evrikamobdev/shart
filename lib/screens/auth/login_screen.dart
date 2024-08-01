import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shart/home_screen.dart';
import 'package:shart/screens/auth/signup_screen.dart';
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
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                          borderSide: BorderSide(
                              color: ShartColors.neutral4, width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                          borderSide: BorderSide(
                              color: ShartColors.primaryColor, width: 1.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                          borderSide: BorderSide(color: Colors.red, width: 1.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                          borderSide: BorderSide(color: Colors.red, width: 1.0),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: 'Введите номер телефона',
                        labelStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(156, 165, 172, 1),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                      ),
                      validator: validateMobile,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    onFocusChange: (hasFocus) {
                      if (hasFocus) {
                        if (maskFormatter.getMaskedText().isEmpty) {
                          _phone.text = '+7 (';
                        }
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
                    obscuringCharacter: '*',
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: ShartColors.neutralBlack,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        borderSide:
                            BorderSide(color: ShartColors.neutral4, width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        borderSide: BorderSide(
                            color: ShartColors.primaryColor, width: 1.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                      labelText: 'Введите пароль',
                      labelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(156, 165, 172, 1),
                      ),
                      counterText: "",
                      suffixIcon: IconButton(
                        icon: SvgPicture.asset(
                          _hidePassword
                              ? 'assets/ic_visibility.svg'
                              : 'assets/ic_visibility_off.svg',
                        ),
                        onPressed: () {
                          setState(() {
                            _hidePassword = !_hidePassword;
                          });
                        },
                      ),
                    ),
                    validator: validatePassword,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                      ),
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
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<dynamic>(
                            builder: (BuildContext context) => SignupScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Зарегистрироваться',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(58, 112, 226, 1),
                        ),
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
    );
  }
}
