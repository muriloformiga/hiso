import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hiso/core/utils/app_colors.dart';
import 'package:hiso/core/utils/app_images.dart';
import 'package:hiso/features/auth/navigator/auth_navigator.dart';
import 'package:hiso/features/auth/presentation/widgets/custom_text_widget.dart';
import 'package:hiso/features/auth/utils/auth_strings.dart';
import 'package:hiso/core/utils/sizes.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PresentationPage extends StatelessWidget {
  final List<Widget> cardList = [
    PageDoctor(),
    PageFamily(),
  ];
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.green,
            AppColors.gray,
            AppColors.gray,
          ],
          stops: [0, 0.5, 1],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                CarouselSlider(
                  height: 200.0,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  pauseAutoPlayOnTouch: Duration(seconds: 10),
                  aspectRatio: 2.0,
                  onPageChanged: (index) {
                    _currentIndex = index;
                  },
                  items: cardList.map((card) {
                    return Builder(builder: (BuildContext context) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.30,
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          color: Colors.blueAccent,
                          child: card,
                        ),
                      );
                    });
                  }).toList(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: map<Widget>(cardList, (index, url) {
                    return Container(
                      width: 10.0,
                      height: 10.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == index
                            ? Colors.blueAccent
                            : Colors.grey,
                      ),
                    );
                  }),
                ),
                CupertinoButton.filled(
                  child: Text(AuthStrings.nextStep),
                  onPressed: () => AuthNavigator.goToRegister(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PageDoctor extends StatelessWidget {
  const PageDoctor({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Image.asset(
              AppImages.doctor,
              height: 80,
            ),
          ),
          Expanded(
            flex: 3,
            child: CustomTextWidget(
              text: AuthStrings.provideInfoMessage,
              fontSize: 16.h,
              paddingValue: 20.h,
            ),
          ),
        ],
      ),
    );
  }
}

class PageFamily extends StatelessWidget {
  const PageFamily({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Image.asset(
              AppImages.man,
              height: 80.h,
            ),
          ),
          Expanded(
            flex: 3,
            child: CustomTextWidget(
              text: AuthStrings.getInfoMessage,
              fontSize: 16.h,
              paddingValue: 20.h,
            ),
          ),
        ],
      ),
    );
  }
}
