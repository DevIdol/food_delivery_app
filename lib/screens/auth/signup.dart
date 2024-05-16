import 'package:flutter/material.dart';
import 'package:food_app/providers/providers.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/utils.dart';
import '../../widgets/widgets.dart';

class SignUpScreen extends StatefulHookConsumerWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final FocusNode _focusNode = FocusNode();
  bool _obscurePassword = true;

  final TextEditingController _controllerFirstName = TextEditingController();
  final TextEditingController _controllerLastName = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
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
    return LoadingOverlay(
        child: Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: CustomCard(
              padding: const EdgeInsets.all(20),
              color: AppColor.cardColor,
              width: MediaQuery.of(context).size.width * 0.9,
              child: FormWidget(
                formKey: _formKey,
                children: [
                  headerTitle(context: context, title: 'Sign Up'),
                  const Gap(20),
                  TextFormFieldWidget(
                    controller: _controllerFirstName,
                    txtInputType: TextInputType.text,
                    labelText: "First Name",
                    prefixIcon: Icons.person,
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your first name.";
                      }
                      return null;
                    },
                    onEditingComplete: () => _focusNode.requestFocus(),
                  ),
                  const Gap(20),
                  TextFormFieldWidget(
                    controller: _controllerLastName,
                    txtInputType: TextInputType.text,
                    labelText: "Last Name",
                    prefixIcon: Icons.person,
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your last name.";
                      }
                      return null;
                    },
                    onEditingComplete: () => _focusNode.requestFocus(),
                  ),
                  const Gap(20),
                  TextFormFieldWidget(
                    controller: _controllerPhone,
                    txtInputType: TextInputType.phone,
                    labelText: "Phone",
                    prefixIcon: Icons.phone,
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your phone number.";
                      }
                      return null;
                    },
                    onEditingComplete: () => _focusNode.requestFocus(),
                  ),
                  const Gap(20),
                  TextFormFieldWidget(
                    controller: _controllerEmail,
                    txtInputType: TextInputType.emailAddress,
                    labelText: "Mail",
                    prefixIcon: Icons.mail,
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email number.";
                      }
                      return null;
                    },
                    onEditingComplete: () => _focusNode.requestFocus(),
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
                  const Gap(30),
                  ButtonWidget(
                      onPressed: () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          ref
                              .watch(loadingProvider.notifier)
                              .update((state) => true);
                          ref
                              .read(userNotifierProvider.notifier)
                              .signup(
                                  firstName: _controllerFirstName.text,
                                  lastName: _controllerLastName.text,
                                  email: _controllerEmail.text,
                                  phone: _controllerPhone.text,
                                  password: _controllerPassword.text,
                                  address: 'Yangon')
                              .then(
                                (res) => {
                                  res.fold(
                                    (l) async => {
                                      ref
                                          .watch(loadingProvider.notifier)
                                          .update((state) => false),
                                      showSnackbar(context, l),
                                    },
                                    (r) async => {
                                      ref
                                          .watch(loadingProvider.notifier)
                                          .update((state) => false),
                                      Get.toNamed(AppRoute.verifyOTP)
                                    },
                                  ),
                                },
                              );
                        }
                      },
                      btnText: 'Sign Up'),
                  const Gap(10),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.login);
                    },
                    child: const Text(
                      "Already have an account? Login",
                      style: TextStyle(color: AppColor.linkColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
