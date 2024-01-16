import 'package:flutter/material.dart';
import 'package:woodtok/constants/gaps.dart';
import 'package:woodtok/constants/sizes.dart';
import 'package:woodtok/features/authentivation/password_screen.dart';
import 'package:woodtok/features/authentivation/widgets/form_button.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final TextEditingController _useremailController = TextEditingController();
  // text 컨트롤러

  String _useremail = '';
  // 변수 생성

  @override
  void initState() {
    super.initState();

    _useremailController.addListener(() {
      setState(() {
        _useremail = _useremailController.text;
        // 변수에 저장
      });
    });
  }
  // text 컨트롤러

  @override
  void dispose() {
    _useremailController.dispose();
    super.dispose();
  }
  // 앱 충돌을 예방하기 위해 _useremailController 제거

  String? _isEmailValid() {
    if (_useremail.isEmpty) return null;
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(_useremail)) {
      return '올바른 이메일 형식이 아닙니다.';
    }
    return null;
    // 이메일 유효성 검사
  }

  void _onPasswordTap(BuildContext context) {
    if (_useremail.isEmpty || _isEmailValid() != null) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PasswordScreen(),
      ),
    );
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
    // input 외 영역 클릭 시 키보드 없애기
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
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
                'What is your email?',
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v16,
              TextField(
                controller: _useremailController,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                onEditingComplete: () => _onPasswordTap(context),
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                  ),
                  errorText: _isEmailValid(),
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
                child: FormButton(
                  disabled: _useremail.isEmpty || _isEmailValid() != null,
                  type: 'Sign up',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
