import 'package:chat_app/pages/welcome/bloc/welcome_blocs.dart';
import 'package:chat_app/pages/welcome/bloc/welcome_events.dart';
import 'package:chat_app/pages/welcome/bloc/welcome_states.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Container(
                margin: EdgeInsets.only(top: 34.h),
                width: 375.w,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    PageView(
                      onPageChanged: (index) {
                        state.page = index;

                        /** this will update the page index*/
                        BlocProvider.of<WelcomeBloc>(context)
                            .add(WelcomeEvent());
                      },
                      children: [
                        _page(
                            1,
                            context,
                            "Next",
                            "First See Learning",
                            "Forgot about a for of paper all knowledge in one learning",
                            "imgpath"),
                        _page(
                            2,
                            context,
                            "Next",
                            "Connect with every one",
                            "Always keep in touch with your tutor & friend. Let's get connected.",
                            "imgpath"),
                        _page(
                            3,
                            context,
                            "Get Started",
                            "Always fascinated learning",
                            "Anywhere, anytime. The time is at your discretion. So study when you want.",
                            "imgpath"),
                      ],
                    ),
                    Positioned(
                        bottom: 50.h,
                        child: DotsIndicator(
                          position: state.page,
                          dotsCount: 3,
                          mainAxisAlignment: MainAxisAlignment.center,
                          decorator: DotsDecorator(
                              color: Colors.grey,
                              activeColor: Colors.blue,
                              activeSize: const Size(18.0, 8),
                              activeShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              size: const Size.square(8.0)),
                        ))
                  ],
                ));
          },
        ),
      ),
    );
  }

  Widget _page(int index, BuildContext context, String buttonName, String title,
      String subTitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
          height: 345.h,
          width: 345.w,
          child: Text("Welcome"),
        ),
        Container(
            child: Text(
          title,
          style: TextStyle(
              color: Colors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.normal),
        )),
        Container(
            width: 365.w,
            padding: EdgeInsets.only(left: 25.w, right: 25.w),
            child: Text(
              subTitle,
              style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal),
            )),
        Container(
          margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
          width: 325.w,
          height: 50.h,
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(15.w)),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 1),
                    blurRadius: 2,
                    spreadRadius: 1,
                    color: Colors.grey.withOpacity(0.1))
              ]),
          child: Center(
            child: Text(
              buttonName,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal),
            ),
          ),
        )
      ],
    );
  }
}
