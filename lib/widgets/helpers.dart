import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:shart/styling/shart_colors.dart';

var maskFormatter = MaskTextInputFormatter(
  mask: '+7 (###) ### ## ##',
  filter: {
    "#": RegExp(r'[0-9]'),
  },
);

var inputDenySpace = FilteringTextInputFormatter.deny(
  RegExp(r' '),
);

String? validateMobile(value) {
  if (value!.isEmpty) {
    return 'Обязательное поле';
  } else if (value.length != 18) {
    return 'Введите номер в формате +7 (XXX) XXX - XX - XX';
  }
  return null;
}

String? validateRequiredField(value) =>
    value!.isEmpty ? 'Обязательное поле' : null;

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Обязательное поле';
  }
  if (value.length < 8 || !RegExp(r'(?=.*[A-Z])').hasMatch(value)) {
    return 'Пароль должен содержать как минимум 8 символов,\nи одну заглавную букву';
  }
  return null;
}

String formatDuration(Duration duration) {
  String seconds = duration.inSeconds.remainder(60).toString();
  return seconds;
}

navigatePush(
  BuildContext context,
  Widget target,
) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => target,
    ),
  );
}

class CheckListTile<T> extends StatelessWidget {
  const CheckListTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
    required this.activeIcon,
    required this.inactiveIcon,
  });

  final T value;
  final T groupValue;
  final ValueChanged<T?> onChanged;
  final Widget title;
  final Widget activeIcon;
  final Widget inactiveIcon;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          useMaterial3: false),
      child: ListTile(
        onTap: () {
          onChanged(value);
        },
        title: title,
        leading: value == groupValue ? activeIcon : inactiveIcon,
        contentPadding: EdgeInsets.zero,
        dense: true,
        minVerticalPadding: 0,
        visualDensity: VisualDensity(horizontal: 0, vertical: -4),
        minLeadingWidth: 8,
        horizontalTitleGap: 8,
      ),
    );
  }
}

AppBar appBarWithBackBtn(title, context) => AppBar(
      // titleSpacing: 16,
      centerTitle: false,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: SvgPicture.asset(
          'assets/ic_arrow_left.svg',
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      title: Text(
        title,
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
    );
