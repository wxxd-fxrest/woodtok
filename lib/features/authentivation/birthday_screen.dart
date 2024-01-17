import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:woodtok/constants/gaps.dart';
import 'package:woodtok/constants/sizes.dart';
import 'package:woodtok/features/authentivation/widgets/form_button.dart';
import 'package:woodtok/features/onboarding/interests_screen.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  final TextEditingController _birthdayController = TextEditingController();

  DateTime initialDate =
      DateTime.now().subtract(const Duration(days: 365 * 12));
  // 변수 생성

  @override
  void initState() {
    super.initState();
    _setTextFieldDate(initialDate);
  }
  // text 컨트롤러

  @override
  void dispose() {
    _birthdayController.dispose();
    super.dispose();
  }
  // 앱 충돌을 예방하기 위해 _birthdayController 제거

  void _onPasswordTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const InterestsScreen(),
      ),
    );
  }

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(' ').first;
    _birthdayController.value = TextEditingValue(text: textDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: const Text(
          'sign up',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v40,
            const Text(
              'When\'s your birthday?',
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v10,
            const Text(
              'Your birthday won\'t be shown publicly.',
              style: TextStyle(
                fontSize: Sizes.size16,
                color: Colors.black45,
              ),
            ),
            Gaps.v16,
            TextField(
              controller: _birthdayController,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
              cursorColor: Theme.of(context).primaryColor,
            ),
            Gaps.v32,
            GestureDetector(
              onTap: () => _onPasswordTap(context),
              child: const FormButton(
                disabled: false,
                type: 'Next',
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 300,
        child: BottomAppBar(
          surfaceTintColor: Colors.white,
          child: CupertinoDatePicker(
            maximumDate: initialDate,
            initialDateTime: initialDate,
            dateOrder: DatePickerDateOrder.ymd,
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: _setTextFieldDate,
          ),
        ),
      ),
    );
  }
}
