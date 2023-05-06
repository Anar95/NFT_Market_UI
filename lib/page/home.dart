import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:phlox_animations/phlox_animations.dart';
import 'package:swipe_cards/swipe_cards.dart';

import '../constant/swipe_card.dart';
import '../string/image_string.dart';
import '../string/text_string.dart';
import 'bottomnav_bar.dart';

import 'dashboard.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ///___________ silect list ________________
  int timeIndexSelected = 1;
  final List<String> time = [
    Recent,
    Trending,
    Art_Work,
    Recent,
    Trending,
    Art_Work,
  ];

  ///____________________ swip card ___________
  late MatchEngine _matchEngine;
  // ignore: non_constant_identifier_names
  late List<SwipeItem> _SwipeItems;
  late bool _isNoItem = false;

  void reset() {
    _SwipeItems = [];
    for (var content in contents) {
      var swipeItem = SwipeItem(
        content: content,
      );
      _SwipeItems.add(swipeItem);
    }

    _matchEngine = MatchEngine(swipeItems: _SwipeItems);
    _isNoItem = false;
  }

  @override
  void initState() {
    reset();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: () => showExitPopup(context),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 45),
                  child: PhloxAnimations(
                    duration: const Duration(seconds: 1),
                    fromY: -100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 48.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  spreadRadius: 3,
                                  blurRadius: 10,
                                  offset: const Offset(0, 3),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12.r),
                              image: const DecorationImage(
                                image: AssetImage(profile_1),
                                fit: BoxFit.cover,
                              )),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            setState(() {
                              reset();
                            });
                          },
                          child: Container(
                            height: 40.h,
                            width: 140.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                color: Colors.black12.withOpacity(0.1)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.webhook),
                                SizedBox(height: 10.h),
                                Text(ETH12,
                                    style: TextStyle(
                                        color: Colors.deepPurple,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                ///______________ rich text ____________
                PhloxAnimations(
                  duration: const Duration(seconds: 1),
                  fromY: -100,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: RichText(
                      text: TextSpan(
                        text: 'Hello,',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 30.sp),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' Anar',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.sp,
                                  color: Colors.pinkAccent)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25.h),

                ///_______ horizontal list button _____
                PhloxAnimations(
                  duration: const Duration(seconds: 1),
                  fromX: 100,
                  child: SizedBox(
                    height: 40.h,
                    width: 495,
                    child: ListView.builder(
                      itemCount: time.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              timeIndexSelected = index;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.w),
                            child: SizedBox(
                              child: Container(
                                height: 35.h,
                                width: 120.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.sp),
                                    border: Border.all(
                                      color: index == timeIndexSelected
                                          ? Colors.white
                                          : Colors.grey.shade300,
                                    ),
                                    color: timeIndexSelected == index
                                        ? Colors.pinkAccent
                                        : Colors.white),
                                child: Center(
                                    child: Text(time[index],
                                        style: TextStyle(
                                            color: index == timeIndexSelected
                                                ? Colors.white
                                                : Colors.grey,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w700))),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                SizedBox(height: 25.h),

                ///_____________ Swipe card ________________
                PhloxAnimations(
                  duration: const Duration(seconds: 1),
                  fromX: 100,
                  child: Center(
                    child: Container(
                      child: _isNoItem
                          ? SizedBox(
                              height: 330.h,
                              width: 300.w,
                              child: const Center(
                                child: Text(
                                  'No Item',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          : Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                SizedBox(
                                  height: 330.h,
                                  width: 300.w,
                                  child: SwipeCards(
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return InkWell(
                                        onTap: () {},
                                        child: Stack(
                                          children: [
                                            SizedBox(
                                              height: 440.h,
                                              width: 500.w,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(15.r),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.r),
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            contents[index]
                                                                .url),
                                                        fit: BoxFit.cover),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15,
                                                      vertical: 20),
                                              child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Row(
                                                  children: [
                                                    GlassmorphicContainer(
                                                      height: 60.h,
                                                      width: 180.w,
                                                      borderRadius: 50.sp,
                                                      blur: 9,
                                                      alignment:
                                                          Alignment.center,
                                                      border: 2,
                                                      linearGradient:
                                                          LinearGradient(
                                                              begin: Alignment
                                                                  .topLeft,
                                                              end: Alignment
                                                                  .bottomRight,
                                                              colors: [
                                                            const Color(
                                                                    0xFFffffff)
                                                                .withOpacity(
                                                                    0.1),
                                                            const Color(
                                                                    0xFFFFFFFF)
                                                                .withOpacity(
                                                                    0.05),
                                                          ],
                                                              stops: const [
                                                            0.1,
                                                            1
                                                          ]),
                                                      borderGradient:
                                                          const LinearGradient(
                                                        begin:
                                                            Alignment.topLeft,
                                                        end: Alignment
                                                            .bottomRight,
                                                        colors: [
                                                          Colors.transparent,
                                                          Colors.transparent
                                                        ],
                                                      ),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                              contents[index]
                                                                  .title,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      20.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)),
                                                          SizedBox(height: 5.h),
                                                          Text(
                                                              contents[index]
                                                                  .Sub_title,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      15.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)),
                                                        ],
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                DashboardScreen(
                                                                    contents:
                                                                        contents[index]
                                                                            .url,
                                                                    title: abc[
                                                                            index]
                                                                        .titles
                                                                    /*   title: contents[index]
                                                                  .title,*/
                                                                    ),
                                                          ),
                                                        );
                                                      },
                                                      child: Container(
                                                        height: 60.h,
                                                        width: 60.h,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50.r),
                                                        ),
                                                        child: Icon(
                                                          Icons.arrow_forward,
                                                          color: Colors.black,
                                                          size: 25.sp,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                    matchEngine: _matchEngine,
                                    onStackFinished: () {
                                      setState(() {
                                        reset();
                                        // _isNoItem = true;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          _matchEngine.currentItem!.nope();
                        },
                        child: Icon(
                          Icons.west,
                          size: 25.sp,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 15.w),
                      InkWell(
                        onTap: () {
                          _matchEngine.currentItem!.like();
                        },
                        child: Icon(
                          Icons.trending_flat,
                          size: 50.sp,
                          color: Colors.pinkAccent,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const bottomPage(),
          ],
        ),
      ),
    );
  }
}

Future<bool> showExitPopup(context) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            height: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Do you want to exit?",
                  style: TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          exit(0);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pinkAccent),
                        child: const Text("Yes"),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      child: const Text("No",
                          style: TextStyle(color: Colors.black)),
                    ))
                  ],
                )
              ],
            ),
          ),
        );
      });
}
