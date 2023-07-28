import 'package:flutter/material.dart';

import 'package:smart_fishery/core.dart';
import 'package:smart_fishery/widget/auth_form.dart';
import 'package:smart_fishery/widget/auth_password_form.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController fullNameController = TextEditingController(text: "");
  TextEditingController noHpController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");
  TextEditingController konfirmasiPasswordController =
      TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    Widget signUpButton() {
      return GestureDetector(
        onTap: () {
          Navigator.popAndPushNamed(context, "/home");
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          margin: const EdgeInsets.all(20),
          height: 50,
          decoration: const BoxDecoration(
            color: Color(0xFF45A9A5),
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.popAndPushNamed(context, "/home");
            },
            child: Text(
              "Sign Up",
              textAlign: TextAlign.center,
              style: primaryTextStyle.copyWith(
                color: whiteColor,
                fontWeight: semibold,
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor2,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 200,
                width: double.infinity,
                // color: primaryColor,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/image_auth.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/logo.png",
                      height: 100,
                      color: whiteColor,
                    ),
                    Text("Sign Up Now!",
                        style: primaryTextStyle.copyWith(
                          color: whiteColor,
                          fontSize: 16,
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AuthForm(
                      "Full Name",
                      fullNameController,
                      TextInputType.name,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Mobile Number",
                      style: secondaryTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: semibold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 6.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: const BorderRadius.all(
                                Radius.circular(3.0),
                              ),
                            ),
                            child: Text(
                              "+62",
                              style: primaryTextStyle.copyWith(
                                fontWeight: semibold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: noHpController,
                              style: primaryTextStyle.copyWith(
                                fontWeight: medium,
                              ),
                              keyboardType: TextInputType.number,
                              initialValue: null,
                              decoration: InputDecoration.collapsed(
                                filled: true,
                                fillColor: Colors.transparent,
                                hintText: "82212344432",
                                hintStyle: primaryTextStyle.copyWith(
                                  color: Colors.grey[500],
                                  fontWeight: medium,
                                ),
                                hoverColor: Colors.transparent,
                              ),
                              onFieldSubmitted: (value) {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PasswordForm(
                      "Password",
                      "Enter your password",
                      passwordController,
                      TextInputType.name,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PasswordForm(
                      "Re-enter Password",
                      "Re-enter your password",
                      konfirmasiPasswordController,
                      TextInputType.name,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Already have an account?",
                          style: secondaryTextStyle.copyWith(
                            fontWeight: medium,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.popAndPushNamed(context, "/sign-in");
                          },
                          child: Text(
                            "Sign In",
                            style: secondaryTextStyle.copyWith(
                              fontWeight: semibold,
                              fontSize: 12,
                              color: greenColor,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: signUpButton(),
    );
  }
}
