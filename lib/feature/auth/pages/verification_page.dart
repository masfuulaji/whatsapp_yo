import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/common/extension/custom_text_extension.dart';
import 'package:whatsapp_clone/common/widget/custom_icon_button.dart';
import 'package:whatsapp_clone/feature/auth/controller/auth_controller.dart';
import 'package:whatsapp_clone/feature/auth/widget/custom_text_field.dart';

class VerificationPage extends ConsumerWidget {
  const VerificationPage({
    super.key,
    required this.smsCodeId,
    required this.phoneNumber,
  });

  final String smsCodeId;
  final String phoneNumber;

  void verifySmsCode(BuildContext context, WidgetRef ref, String smsCode) {
    ref.read(authControllerProvider).verifySmsCode(
          context: context,
          smsCodeId: smsCodeId,
          smsCode: smsCode,
          mounted: true,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        title: Text(
          'Verify your phone number',
          style: TextStyle(color: context.theme.authAppbarTextColor),
        ),
        centerTitle: true,
        actions: [
          CustomIconButton(
            onTap: () {},
            icon: Icons.more_vert,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    color: context.theme.greyColor,
                    height: 1.5,
                  ),
                  children: [
                    const TextSpan(
                      text:
                          "you've tried to register +964 1234567890. We'll send you an SMS with a verification code. Enter the code below to verify your phone number. ",
                    ),
                    TextSpan(
                      text: 'Change number',
                      style: TextStyle(
                        color: context.theme.blueColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: CustomTextField(
                hintText: '- - - - - -',
                fontSize: 30,
                autoFocus: true,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (value.length == 6) {
                    verifySmsCode(context, ref, value);
                  }
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Enter 6-digit code',
              style: TextStyle(
                color: context.theme.greyColor,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Icon(
                  Icons.message,
                  color: context.theme.greyColor,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  'Resend SMS',
                  style: TextStyle(color: context.theme.greyColor),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              color: context.theme.blueColor!.withOpacity(0.2),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Icon(
                  Icons.call,
                  color: context.theme.greyColor,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  'Call me instead',
                  style: TextStyle(color: context.theme.greyColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
