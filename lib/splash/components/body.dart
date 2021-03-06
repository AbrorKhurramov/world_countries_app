import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/home/home_screen.dart';
import 'package:shop_app/size_config.dart';

import 'splash_content.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "200 dan ortiq davlatlar haqida ma'lumot",
      "image": "assets/images/splash_1.png"
    },
    {
      "text":
          "Tezkor va oson qidiruv",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "Ma'lumotlar ko'lamining kengligi",
      "image": "assets/images/splash_3.png"
    },
  ];

  @override
  Widget build(BuildContext context) {

      return SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: PageView.builder(
                  //scrollDirection: Axis.vertical,
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                    text: splashData[index]['text'],
                    image: splashData[index]["image"],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: Column(
                    children: <Widget>[
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(splashData.length,
                            (index) => buildDot(index: index)),
                      ),
                      Spacer(flex: 3),
                      DefaultButton(
                        text: "Olg'a",
                        press: () {
                          Navigator.pushNamed(context, HomeScreen.routeName);
                        },
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
  

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
          color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
          borderRadius: BorderRadius.circular(3)),
    );
  }
}

