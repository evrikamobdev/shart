import 'package:flutter/material.dart';
import 'package:shart/screens/auth/code_verification_screen.dart';
import 'package:shart/styling/shart_colors.dart';
import 'package:shart/widgets/helpers.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _phone = TextEditingController();

  void _signup() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => CodeVerificationScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWithBackBtn('Регистрация', context),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, top: 32.0, right: 16.0, bottom: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  ElevatedButton(
                    onPressed: () {
                      _signup();
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
                        'Продолжить',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
