import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../utils/utils.dart';
import '../../widgets/widgets.dart';
import '../home/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final FocusNode _focusNodePassword = FocusNode();
  bool _obscurePassword = true;

  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: CustomCard(
              color: AppColor.cardColor,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20,),
                child: FormWidget(
                  formKey: _formKey,
                  children: [
                    headerTitle(context: context, title: 'Login'),
                    const Gap(20),
                    TextFormFieldWidget(
                      controller: _controllerUsername,
                      txtInputType: TextInputType.emailAddress,
                      labelText: "Email",
                      prefixIcon: Icons.mail,
                      obscureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter mail.";
                        }
                        return null;
                      },
                      onEditingComplete: () =>
                          _focusNodePassword.requestFocus(),
                    ),
                    const Gap(20),
                    TextFormFieldWidget(
                      controller: _controllerPassword,
                      labelText: "Password",
                      prefixIcon: Icons.lock,
                      obscureText: _obscurePassword,
                      focusNode: _focusNodePassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter password.";
                        }
                        return null;
                      },
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        icon: _obscurePassword
                            ? const Icon(Icons.visibility_outlined)
                            : const Icon(Icons.visibility_off_outlined),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(color: AppColor.linkColor),
                        ),
                      ),
                    ),
                    ButtonWidget(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const HomeScreen();
                                },
                              ),
                            );
                          }
                        },
                        btnText: 'Login'),
                    const Gap(10),
                    TextButton(
                      onPressed: () {
                         Get.toNamed(AppRoute.signup);
                      },
                      child: const Text(
                        "Don't have an account? Sign Up",
                        style: TextStyle(color: AppColor.linkColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNodePassword.dispose();
    _controllerUsername.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }
}
