import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../constants/assets.gen.dart';
import '../../tools/screen_size.dart';
import 'splash2_viewmodel.dart';

class Splash2View extends StatelessWidget {
  const Splash2View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<Splash2ViewModel>.reactive(
      // onModelReady: (model) => model.startTimer(),
      builder: (context, model, child) {
        return Scaffold(
          body: SafeArea(
            top: true,
            bottom: true,
            left: true,
            right: true,
            child: Container(
              width: ScreenSize.width,
              height: ScreenSize.height,
              alignment: Alignment.center,
              child: Stack(children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 24.0, right: 24.0, top: 16.0, bottom: 16.0),
                  child: Assets.images.bg.image(
                      height: ScreenSize.height, width: ScreenSize.width),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: ScreenSize.getHeight(
                          double.parse(800.toString()), 128.0)),
                  child: Assets.images.catanddog.image(
                      height: ScreenSize.getHeight(
                          double.parse(800.toString()), 352.0),
                      width: ScreenSize.getWidth(
                          double.parse(360.toString()), 352.0)),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: ScreenSize.getHeight(
                            double.parse(800.toString()), 495.0),
                        left: ScreenSize.getWidth(
                            double.parse(360.toString()), 17.0)),
                    child: SizedBox(
                        height: ScreenSize.getHeight(
                            double.parse(800.toString()), 78.0),
                        width: ScreenSize.getHeight(
                            double.parse(800.toString()), 231.0),
                        child: Text(
                          "Share the love for\nour furry friends",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ))),
                Padding(
                    padding: EdgeInsets.only(
                        top: ScreenSize.getHeight(
                            double.parse(800.toString()), 588.0),
                        left: ScreenSize.getWidth(
                            double.parse(360.toString()), 17.0),
                        right: ScreenSize.getWidth(
                            double.parse(360.toString()), 17.0)),
                    child: SizedBox(
                        height: ScreenSize.getHeight(
                            double.parse(800.toString()), 42.0),
                        child: Text(
                          "Things that make them happy and make your life easy and\nhussle free",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ))),
                Padding(
                  padding: EdgeInsets.only(
                      top: ScreenSize.getHeight(
                          double.parse(800.toString()), 680.0),
                      left: ScreenSize.getWidth(
                          double.parse(360.toString()), 224)),
                  child: Container(
                      height: ScreenSize.getHeight(
                          double.parse(800.toString()), 50.0),
                      width: ScreenSize.getWidth(
                          double.parse(360.toString()), 120.0),
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffffc727),
                            shape: StadiumBorder(),
                          ),
                          child: const Text('Next',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white)),
                          onPressed: () {
                            model.NavNext();
                          })),
                ),
              ]),
            ),
          ),
        );
      },
      viewModelBuilder: () => Splash2ViewModel(),
    );
  }
}
