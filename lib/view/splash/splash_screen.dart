import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:newshunt/utils/colors/colors.dart';
import 'package:newshunt/utils/widgets/custom_text.dart';
import 'package:newshunt/view/splash/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double getSmallDiameter(BuildContext context) =>
        MediaQuery.of(context).size.width * 2 / 3;

    double getBigDiameter(BuildContext context) =>
        MediaQuery.of(context).size.width * 7 / 8;
    return SafeArea(
      child: Scaffold(
          body: GetBuilder<SplashScreenController>(
              init: SplashScreenController(),
              id: "SplashScreen",
              builder: (controller) {
                return Stack(
                  children: [
                    Positioned(
                      right: -getSmallDiameter(context) / 3,
                      top: -getSmallDiameter(context) / 3,
                      child: Container(
                        width: getSmallDiameter(context),
                        height: getSmallDiameter(context),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFF3E9EE),
                        ),
                      ),
                    ),
                    Positioned(
                      left: -getBigDiameter(context) / 4,
                      top: -getBigDiameter(context) / 4,
                      child: Container(
                        width: getBigDiameter(context),
                        height: getBigDiameter(context),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              AppColors.primeryColor,
                              AppColors.primeryLite
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: -getBigDiameter(context) / 2,
                      bottom: -getBigDiameter(context) / 2,
                      child: Container(
                        width: getBigDiameter(context),
                        height: getBigDiameter(context),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFF3E9EE),
                        ),
                      ),
                    ),
                    Positioned(
                      right: -getBigDiameter(context) / 4,
                      bottom: -getBigDiameter(context) / 4,
                      child: Container(
                        width: getBigDiameter(context),
                        height: getBigDiameter(context),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              AppColors.primeryColor,
                              AppColors.primeryLite
                              // Color(0xffC6368B),
                              // Color(0xffF39CCF),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 1.sw,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // const CustomPngImage(
                          //   imageName: "logo",
                          //   width: 149,
                          //   height: 149,
                          // ),
                          CustomText(
                            "News Hunt",
                            fontSize: 48,
                            fontWeight: FontWeight.w400,
                            fontheight: 1.275,
                            // color: Color.fromARGB(255, 84, 191, 95),
                            color: const Color(0xff313131),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              })),
    );
  }
}
