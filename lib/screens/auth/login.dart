import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../providers/providers.dart';
import '../../utils/utils.dart';
import '../../widgets/widgets.dart';

class LoginScreen extends StatefulHookConsumerWidget {
  const LoginScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final FocusNode _focusNode = FocusNode();
  bool _obscurePassword = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  void showSnackbar(BuildContext context, String text) {
    final snackBar = SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 5),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

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
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: FormWidget(
                  formKey: _formKey,
                  children: [
                    headerTitle(context: context, title: 'Login'),
                    const Gap(20),
                    TextFormFieldWidget(
                      controller: _controllerEmail,
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
                          _focusNode.requestFocus(),
                    ),
                    const Gap(20),
                    TextFormFieldWidget(
                      controller: _controllerPassword,
                      labelText: "Password",
                      prefixIcon: Icons.lock,
                      obscureText: _obscurePassword,
                      focusNode: _focusNode,
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
                            ref
                                .read(userNotifierProvider.notifier)
                                .login(
                                  email: _controllerEmail.text,
                                  password: _controllerPassword.text,
                                )
                                .then(
                                  (res) => {
                                    res.fold(
                                      (l) => {
                                        showSnackbar(context, l),
                                      },
                                      (r) => {Get.offAllNamed(AppRoute.home)},
                                    ),
                                  },
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
    _focusNode.dispose();
    super.dispose();
  }
}
