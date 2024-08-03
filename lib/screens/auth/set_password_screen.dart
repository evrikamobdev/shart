import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shart/home_screen.dart';
import 'package:shart/styling/shart_colors.dart';
import 'package:shart/widgets/helpers.dart';

class SetPasswordScreen extends StatefulWidget {
  final String page;
  const SetPasswordScreen({super.key, required this.page});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _passwordValidation = TextEditingController();
  bool _hidePassword = true;

  void _setPassword() async {
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          widget.page == 'signup' ? 'Установка пароля' : 'Новый пароль',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: ShartColors.neutralBlack,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: Divider(
            color: Color.fromRGBO(231, 237, 242, 1),
            height: 0,
            thickness: 1,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.page == 'signup' ? 'Пароль' : 'Новый пароль',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: ShartColors.neutralBlack,
                        ),
                      ),
                      SizedBox(width: 2.0),
                      Text(
                        '*',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(236, 45, 48, 1),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.0),
                  TextFormField(
                    controller: _password,
                    obscureText: _hidePassword,
                    inputFormatters: [
                      inputDenySpace,
                    ],
                    obscuringCharacter: '*',
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: ShartColors.neutralBlack,
                    ),
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                      labelText: widget.page == 'signup'
                          ? 'Придумайте пароль'
                          : 'Введите пароль',
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
                  SizedBox(height: 24.0),
                  Row(
                    children: [
                      Text(
                        'Подтверждение пароля',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: ShartColors.neutralBlack,
                        ),
                      ),
                      SizedBox(width: 2.0),
                      Text(
                        '*',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(236, 45, 48, 1),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.0),
                  TextFormField(
                    controller: _passwordValidation,
                    obscureText: _hidePassword,
                    inputFormatters: [
                      inputDenySpace,
                    ],
                    obscuringCharacter: '*',
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: ShartColors.neutralBlack,
                    ),
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                      labelText: widget.page == 'signup'
                          ? 'Введите пароль еще раз'
                          : 'Введите пароль',
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
                    validator: (value) => value!.isEmpty
                        ? 'Обязательное поле'
                        : value != _password.text
                            ? 'Пароли не совпадают'
                            : null,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  SizedBox(height: 24.0),
                  ElevatedButton(
                      onPressed: () {
                        _setPassword();
                      },
                      child: Text(widget.page == 'signup'
                          ? 'Зарегистрироваться'
                          : 'Продолжить'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
