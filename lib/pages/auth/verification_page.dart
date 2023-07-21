import 'package:flutter/material.dart';

import 'package:smart_fishery/core.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor2,
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Image.asset(
            "assets/image_sign_in.png",
            fit: BoxFit.fitWidth,
          ),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
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
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sign Up or Login Now!",
                        style: primaryTextStyle.copyWith(
                          fontWeight: bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "We've ssent a OTP to +62 822 3456 4332.",
                        textAlign: TextAlign.start,
                        style: secondaryTextStyle.copyWith(
                          fontWeight: medium,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Please enter the number bellow.",
                        textAlign: TextAlign.start,
                        style: secondaryTextStyle.copyWith(
                          fontWeight: medium,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "OTP Number",
                        style: secondaryTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: medium,
                        ),
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
                            Expanded(
                              child: TextFormField(
                                style: primaryTextStyle.copyWith(
                                  fontWeight: semibold,
                                ),
                                keyboardType: TextInputType.number,
                                initialValue: null,
                                // decoration: InputDecoration.collapsed(
                                //   filled: true,
                                //   fillColor: Colors.transparent,
                                //   hintText: "822 1234 4432",
                                //   hintStyle: primaryTextStyle.copyWith(
                                //     color: Colors.grey[500],
                                //   ),
                                //   hoverColor: Colors.transparent,
                                // ),
                                onFieldSubmitted: (value) {},
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          Navigator.popAndPushNamed(context, "/home");
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          margin: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Color(0xFF45A9A5),
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          child: Text(
            "NEXT",
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
}
