import 'package:flutter/material.dart';
import 'package:food_app/assets/assets.gen.dart';
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
    return LoadingOverlay(
      child: Scaffold(
        body: Stack(
          children: [
            positionImage(
                top: -20,
                right: -140,
                img: Assets.svg.bg4,
                width: 280,
                height: 280),
            positionImage(
                top: -10,
                left: -80,
                img: Assets.svg.bg1,
                width: 240,
                height: 240),
            positionImage(
              top: MediaQuery.of(context).size.height / 6,
              right: -120,
              img: Assets.svg.bg2,
              width: 600,
              height: 600,
            ),
            positionImage(
              bottom: -180,
              right: -80,
              img: Assets.svg.bg3,
              width: 400,
              height: 400,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: CustomCard(
                    padding: const EdgeInsets.all(20),
                    color: AppColor.transparent,
                    width: MediaQuery.of(context).size.width * 0.9,
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
                                ? const Icon(Icons.visibility_off_outlined)
                                : const Icon(Icons.visibility_outlined),
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
                          onPressed: () async {
                            if (_formKey.currentState?.validate() ?? false) {
                              ref
                                  .watch(loadingProvider.notifier)
                                  .update((state) => true);
                              await ref
                                  .read(userNotifierProvider.notifier)
                                  .login(
                                    email: _controllerEmail.text,
                                    password: _controllerPassword.text,
                                  )
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
                                          Get.offAllNamed(AppRoute.home)
                                        },
                                      ),
                                    },
                                  );
                            }
                          },
                          btnText: 'Login',
                        ),
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
          ],
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
