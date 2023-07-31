import 'package:common/themes.dart';
import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Color(0xFF45A9A5),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              height: 14,
              width: 14,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                color: whiteColor,
              ),
            ),
            Text(
              'Loading',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semibold,
                color: whiteColor,
              ),
            ),
          ],
        ));
  }
}
