import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:woodtok/constants/gaps.dart';
import 'package:woodtok/constants/sizes.dart';
import 'package:woodtok/features/authentivation/widgets/form_button.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  // text 컨트롤러

  String _password = '';
  bool _passwordEye = true;
  // 변수 생성

  @override
  void initState() {
    super.initState();

    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
        // 변수에 저장
      });
    });
  }
  // text 컨트롤러

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
    // 앱 충돌을 예방하기 위해 _passwordController 제거
  }

  bool _isPasswordValid() {
    return _password.isNotEmpty && _password.length > 8;
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
    // input 외 영역 클릭 시 키보드 없애기
  }

  void _onClearPassword() {
    _passwordController.clear();
  }

  void _onToggleEye() {
    _passwordEye = !_passwordEye;
    setState(() {});
  }

// 4.7 password screen 12분 ~

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
                'Create password',
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v16,
              TextField(
                controller: _passwordController,
                obscureText: _passwordEye,
                decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                    // errorText: ,
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
                    suffix: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: _onClearPassword,
                          child: FaIcon(
                            FontAwesomeIcons.solidCircleXmark,
                            color: Colors.grey.shade500,
                            size: Sizes.size20 + Sizes.size2,
                          ),
                        ),
                        Gaps.h10,
                        GestureDetector(
                          onTap: _onToggleEye,
                          child: FaIcon(
                            _passwordEye
                                ? FontAwesomeIcons.eye
                                : FontAwesomeIcons.eyeSlash,
                            color: Colors.grey.shade500,
                            size: Sizes.size20 + Sizes.size2,
                          ),
                        ),
                      ],
                    )),
                cursorColor: Theme.of(context).primaryColor,
              ),
              Gaps.v32,
              FormButton(
                disabled: _isPasswordValid(),
                type: 'Sign up',
              )
            ],
          ),
        ),
      ),
    );
  }
}
