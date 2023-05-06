import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:phlox_animations/phlox_animations.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

import '../string/image_string.dart';
import '../string/text_string.dart';
import 'home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isFinished = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 45),
                child: PhloxAnimations(
                  duration: const Duration(seconds: 1),
                  // fromX: 50,
                  fromY: -90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        logo,
                        height: 40.h,
                        width: 60.w,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Flutter',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.sp),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Educate',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.sp,
                                    color: Colors.pinkAccent)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 60.h),
              PhloxAnimations(
                duration: const Duration(seconds: 2),
                fromX: 200,
                // fromY: 100,
                child: Image.asset(
                  wave1,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: PhloxAnimations(
              duration: const Duration(seconds: 2),
              fromY: 100,
              child: Container(
                height: 250.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.pinkAccent.shade200,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.r),
                    topRight: Radius.circular(25.r),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 35),
                  child: Column(
                    children: [
                      Text(
                        tital,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 25.sp),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        tital_sub,
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: Colors.white54, fontSize: 16.sp),
                      ),
                      SizedBox(height: 48.h),

                      ///____________________ Swipe button ___________________
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(50.r)),
                        child: SwipeableButtonView(
                            buttontextstyle: TextStyle(
                                letterSpacing: 5,
                                fontSize: 30.sp,
                                color: Colors.white70),
                            buttonText: "> > > > >",
                            buttonWidget: Text(
                              Start_Collect,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.pinkAccent,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                            activeColor: Colors.pinkAccent,
                            isFinished: isFinished,
                            onWaitingProcess: () {
                              Future.delayed(const Duration(seconds: 0), () {
                                setState(() {
                                  isFinished = true;
                                });
                              });
                            },
                            onFinish: () async {
                              await Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      child: const HomePage()));

                              setState(() {
                                isFinished = false;
                              });
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
