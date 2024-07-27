import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shart/styling/shart_colors.dart';
import 'package:shart/widgets/helpers.dart';

class CreateLoanScreen extends StatefulWidget {
  const CreateLoanScreen({super.key});

  @override
  State<CreateLoanScreen> createState() => _CreateLoanScreenState();
}

class _CreateLoanScreenState extends State<CreateLoanScreen> {
  TextEditingController _phone = TextEditingController();
  TextEditingController _amount = TextEditingController();
  TextEditingController _dateOfReceipt = TextEditingController();
  TextEditingController _dateOfRepayment = TextEditingController();
  String _selectedType = '';
  String _selectedLoan = '';

  bool switchValue = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 238, 238, 1),
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SvgPicture.asset(
              'assets/ic_arrow_left.svg',
            ),
          ),
        ),
        title: Text(
          'Оформление займа',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: ShartColors.neutralBlack,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16.0),
                    Text(
                      'Взять в долг',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: ShartColors.neutralBlack,
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      'Заполните форму и получите нужную сумму',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: ShartColors.neutral2,
                      ),
                    ),
                    SizedBox(height: 24.0),
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
                          labelText: 'Введите номер заимодателя',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 18, horizontal: 16),
                        ),
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
                      'Сумма в ₸',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: ShartColors.neutralBlack,
                      ),
                    ),
                    SizedBox(height: 6.0),
                    TextFormField(
                      controller: _amount,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Введите сумму',
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                      ),
                    ),
                    SizedBox(height: 24.0),
                    Text(
                      'Выбор типа лица',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: ShartColors.neutralBlack,
                      ),
                    ),
                    SizedBox(height: 6.0),
                    CheckListTile(
                      value: 'type',
                      groupValue: _selectedType,
                      onChanged: (dynamic value) {
                        setState(() {
                          _selectedType = value;
                        });
                      },
                      title: Text(
                        'Физ.лицо',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(44, 44, 46, 1),
                        ),
                      ),
                      activeIcon: SvgPicture.asset(
                        'assets/ic_rb_active.svg',
                        height: 18,
                        width: 18,
                      ),
                      inactiveIcon: SvgPicture.asset(
                        'assets/ic_rb.svg',
                        height: 18,
                        width: 18,
                      ),
                    ),
                    SizedBox(height: 24.0),
                    Text(
                      'Форма займа',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: ShartColors.neutralBlack,
                      ),
                    ),
                    SizedBox(height: 6.0),
                    CheckListTile(
                      value: 'cash',
                      groupValue: _selectedLoan,
                      onChanged: (dynamic value) {
                        setState(() {
                          _selectedLoan = value;
                        });
                      },
                      title: Text(
                        'Наличные',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(44, 44, 46, 1),
                        ),
                      ),
                      activeIcon: SvgPicture.asset(
                        'assets/ic_rb_active.svg',
                        height: 18,
                        width: 18,
                      ),
                      inactiveIcon: SvgPicture.asset(
                        'assets/ic_rb.svg',
                        height: 18,
                        width: 18,
                      ),
                    ),
                    CheckListTile(
                      value: 'card',
                      groupValue: _selectedLoan,
                      onChanged: (dynamic value) {
                        setState(() {
                          _selectedLoan = value;
                        });
                      },
                      title: Text(
                        'Безналичные',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(44, 44, 46, 1),
                        ),
                      ),
                      activeIcon: SvgPicture.asset(
                        'assets/ic_rb_active.svg',
                        height: 18,
                        width: 18,
                      ),
                      inactiveIcon: SvgPicture.asset(
                        'assets/ic_rb.svg',
                        height: 18,
                        width: 18,
                      ),
                    ),
                    SizedBox(height: 24.0),
                    Text(
                      'Дата получения займа',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: ShartColors.neutralBlack,
                      ),
                    ),
                    SizedBox(height: 6.0),
                    TextFormField(
                      controller: _dateOfReceipt,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Выберите дату',
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                      ),
                    ),
                    SizedBox(height: 24.0),
                    Text(
                      'Дата возрата займа',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: ShartColors.neutralBlack,
                      ),
                    ),
                    SizedBox(height: 6.0),
                    TextFormField(
                      controller: _dateOfRepayment,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Выберите дату',
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                      ),
                    ),
                    SizedBox(height: 6.0),
                    Text(
                      'Минимальный срок займа - 30 календарных дней',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: ShartColors.neutral2,
                      ),
                    ),
                    SizedBox(height: 24.0),
                    Container(
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          border: Border.all(
                              color: Color.fromRGBO(231, 237, 242, 1))),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Показать статус рейтинга',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: ShartColors.neutralBlack,
                                  ),
                                ),
                                SizedBox(height: 4.0),
                                Text(
                                  'Ваш рейтинг заемщика будет показан заимодателю',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(96, 101, 108, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 24.0),
                          CupertinoSwitch(
                            value: switchValue,
                            activeColor: ShartColors.primaryColor,
                            onChanged: (bool? value) {
                              setState(() {
                                switchValue = value ?? false;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 24.0),
                    Row(
                      children: [
                        Text(
                          'Сумма займа:',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: ShartColors.neutral2,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '0 ₸',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: ShartColors.neutralBlack,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 12.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Комиссия:',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: ShartColors.neutral2,
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              'Сервис взимает комиссию в размере 1%',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: ShartColors.neutral3,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Text(
                          '0 ₸',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: ShartColors.neutralBlack,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 24.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          'assets/ic_warning.svg',
                          height: 16,
                          width: 16,
                        ),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: Text(
                            'В случае просрочки оплаты по займу, начисляется пеня в размере 0.1 % от суммы займа каждый день',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: ShartColors.neutral2,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.0)
            ],
          ),
        ),
      ),
    );
  }
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
    return ListTile(
      onTap: () {
        onChanged(value);
      },
      title: title,
      leading: value == groupValue ? activeIcon : inactiveIcon,
      contentPadding: EdgeInsets.only(left: 0, right: 0),
      visualDensity: VisualDensity(vertical: -2),
      minLeadingWidth: 8,
    );
  }
}
