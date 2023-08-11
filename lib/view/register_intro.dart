import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_blog/constant/my_colors.dart';
import 'package:tech_blog/constant/my_strings.dart';
import 'package:tech_blog/gen/assets.gen.dart';

class RegisterIntro extends StatelessWidget {
  const RegisterIntro({super.key});

  @override
  Widget build(BuildContext context) {
    var phoneSize = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RegisterIntroScreenLogo(phoneSize: phoneSize),
          const SizedBox(
            height: 16,
          ),
          RegisterIntroScreenWelcomeText(textTheme: textTheme),
          const SizedBox(
            height: 32,
          ),
          RegisterIntroLetsGoButton(phoneSize: phoneSize, textTheme: textTheme),
        ],
      ),
    ));
  }
}

class RegisterIntroLetsGoButton extends StatelessWidget {
  const RegisterIntroLetsGoButton({
    super.key,
    required this.phoneSize,
    required this.textTheme,
  });

  final Size phoneSize;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        emailBottomSheet(context);
      },
      child: const Text(MyStrings.letsGo),
    );
  }

  Future<dynamic> emailBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: phoneSize.height / 2.5,
              decoration: const BoxDecoration(
                  color: SolidColors.modalBottomSheet,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    MyStrings.enterYourEmail,
                    style: textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: TextField(
                          style: textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            label: const Text(MyStrings.engEnterYourEmail),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: MyStrings.emailTextFieldHint,
                            hintStyle: textTheme.labelSmall,
                            hintTextDirection: TextDirection.ltr,
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text(MyStrings.continueButton))
                ],
              ),
            ),
          );
        });
  }
}

class RegisterIntroScreenWelcomeText extends StatelessWidget {
  const RegisterIntroScreenWelcomeText({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: MyStrings.welcomeText,
        style: textTheme.bodyLarge,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class RegisterIntroScreenLogo extends StatelessWidget {
  const RegisterIntroScreenLogo({
    super.key,
    required this.phoneSize,
  });

  final Size phoneSize;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Assets.images.tcbot.path,
      height: phoneSize.height / 7,
    );
  }
}
