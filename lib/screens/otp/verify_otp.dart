import 'package:flutter/material.dart';
import 'package:food_app/providers/auth/auth_provider.dart';
import 'package:food_app/providers/user/user_provider.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../utils/utils.dart';
import '../../widgets/widgets.dart';

class VerifyOTPScreen extends StatefulHookConsumerWidget {
  const VerifyOTPScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends ConsumerState<VerifyOTPScreen> {
  final FocusNode _focusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _controllerOTP = TextEditingController();

  void showSnackbar(BuildContext context, String text) {
    final snackBar = SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 5),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final String token = ref.watch(setJWTTokenStateProvider) as String;
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
                    headerTitle(context: context, title: 'Verify OTP'),
                    const Gap(20),
                    TextFormFieldWidget(
                      controller: _controllerOTP,
                      txtInputType: TextInputType.number,
                      labelText: "OTP Code",
                      prefixIcon: Icons.verified,
                      obscureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter otp.";
                        }
                        return null;
                      },
                      onEditingComplete: () => _focusNode.requestFocus(),
                    ),
                    const Gap(20),
                    ButtonWidget(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            ref
                                .read(userNotifierProvider.notifier)
                                .veriyOTP(
                                  otp: _controllerOTP.text,
                                  token: token,
                                )
                                .then(
                                  (res) => {
                                    res.fold(
                                      (l) => {
                                        showSnackbar(context, l),
                                      },
                                      (r) => {
                                        ref
                                            .read(userNotifierProvider.notifier)
                                            .login(
                                                email: r.email,
                                                password: r.password)
                                            .then(
                                              (res) => {
                                                res.fold(
                                                  (l) => {
                                                    showSnackbar(context, l),
                                                  },
                                                  (r) => {
                                                    Get.offAllNamed(
                                                        AppRoute.home),
                                                  },
                                                ),
                                              },
                                            ),
                                      },
                                    ),
                                  },
                                );
                          }
                        },
                        btnText: 'Confirm'),
                    const Gap(10),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoute.signup);
                      },
                      child: const Text(
                        "Back",
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
}
