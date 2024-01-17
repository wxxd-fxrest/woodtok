import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:woodtok/constants/gaps.dart';
import 'package:woodtok/constants/sizes.dart';
import 'package:woodtok/features/authentivation/widgets/form_button.dart';
import 'package:woodtok/features/onboarding/interests_screen.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool _passwordEye = true;

  void _onClearEmail() {
    _emailController.clear();
  }

  void _onClearPassword() {
    _passwordController.clear();
  }

  void _onToggleEye() {
    _passwordEye = !_passwordEye;
    setState(() {});
  }

  Map<String, String> formData = {};

  void _onSubmitLoginTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const InterestsScreen()),
          (route) => false,
        );
      }
    }
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
          child: Form(
            key: _formKey,
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
                Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          color: Colors.grey.shade500,
                        ),
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
                              onTap: _onClearEmail,
                              child: FaIcon(
                                FontAwesomeIcons.solidCircleXmark,
                                color: Colors.grey.shade500,
                                size: Sizes.size20 + Sizes.size2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      cursorColor: Theme.of(context).primaryColor,
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Please write your email';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        if (newValue != null) {
                          formData['email'] = newValue;
                        }
                      },
                    ),
                    Gaps.v16,
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _passwordEye,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          color: Colors.grey.shade500,
                        ),
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
                        ),
                      ),
                      cursorColor: Theme.of(context).primaryColor,
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Please write your password';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        if (newValue != null) {
                          formData['password'] = newValue;
                        }
                      },
                    ),
                  ],
                ),
                Gaps.v32,
                GestureDetector(
                  onTap: _onSubmitLoginTap,
                  child: const FormButton(
                    disabled: false,
                    type: 'Login',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
