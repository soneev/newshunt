import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newshunt/utils/app_string.dart';
import 'package:newshunt/utils/colors/colors.dart';
import 'package:newshunt/utils/widgets/custom_appbar.dart';
import 'package:newshunt/utils/widgets/custom_text.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: CustomAppBar(
          centerTitle: true,
          title: CustomText(
            "News Hunt",
            color: const Color.fromARGB(255, 84, 191, 95),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SizedBox(
        child: Column(
          children: [
            Center(
              child: Lottie.asset(
                AppString.loadingAssets,
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            CustomText(
              "Coming soon....!",
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: AppColors.grey,
            )
          ],
        ),
      ),
    );
  }
}
