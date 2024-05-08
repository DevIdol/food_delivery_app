import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../utils/utils.dart';
import '../../widgets/widgets.dart';
import '../home/home.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final FocusNode _focusNodePassword = FocusNode();
  bool _obscurePassword = true;

  final TextEditingController _controllerFirstName = TextEditingController();
  final TextEditingController _controllerLastName = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
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
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
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
                      onEditingComplete: () =>
                          _focusNodePassword.requestFocus(),
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
                      onEditingComplete: () =>
                          _focusNodePassword.requestFocus(),
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
                      onEditingComplete: () =>
                          _focusNodePassword.requestFocus(),
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
                    const Gap(30),
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
      ),
    );
  }

  @override
  void dispose() {
    _focusNodePassword.dispose();
    _controllerFirstName.dispose();
    _controllerLastName.dispose();
    _controllerPhone.dispose();
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }
}
