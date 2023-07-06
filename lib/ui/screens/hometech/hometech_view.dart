import 'package:flutter/material.dart';
import 'package:yuslih/models/RspBanner.dart';
import 'package:stacked/stacked.dart';
import '../../../constants/assets.gen.dart';
import '../../tools/model_future_builder.dart';
import '../../tools/screen_size.dart';
import '../../widgets/banner.dart';
import 'hometech_viewmodel.dart';

class HomeTechView extends StatelessWidget {
  HomeTechView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeTechViewModel>.nonReactive(
      onModelReady: (model) => model.getSponsorSlide(),
      builder: (context, viewModel, child) => Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xff6175ED), Color(0xffffffff)])),
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [


                  // const Padding(
                  //   padding: EdgeInsets.all(16.0),
                  //   child: TextField(
                  //     decoration: InputDecoration(
                  //       prefixIcon: Icon(
                  //         Icons.search,
                  //         color: Color(0xffa6a6a6),
                  //       ),
                  //       suffixIcon: Icon(
                  //         Icons.mic,
                  //         color: Color(0xffa6a6a6),
                  //       ),
                  //       border: OutlineInputBorder(),
                  //       labelText: 'Search Product or Animal',
                  //       labelStyle: TextStyle(color: Color(0xffa6a6a6)),
                  //       floatingLabelStyle: TextStyle(color: Colors.black),
                  //       enabledBorder: OutlineInputBorder(
                  //         borderSide:
                  //             BorderSide(width: 1, color: Color(0xffa6a6a6)),
                  //       ),
                  //       focusedBorder: OutlineInputBorder(
                  //         borderSide:
                  //             BorderSide(width: 1, color: Color(0x74000000)),
                  //       ),
                  //       errorBorder: OutlineInputBorder(
                  //         borderSide: BorderSide(width: 1, color: Colors.red),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Container(
                        height: ScreenSize.getHeight(
                            double.parse(800.toString()), 180.0),
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xff7c94b6),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                width: ScreenSize.getWidth(
                                    double.parse(360.toString()), 330.0),
                                height: ScreenSize.getHeight(
                                    double.parse(800.toString()), 111.0),
                                alignment: Alignment.center,
                                child: Assets.images.bannerbase.image(
                                    height: ScreenSize.getHeight(
                                        double.parse(800.toString()), 111.0),
                                    width: ScreenSize.getWidth(
                                        double.parse(360.toString()), 330.0),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: -50,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                width: ScreenSize.getWidth(
                                    double.parse(360.toString()), 258.0),
                                height: ScreenSize.getHeight(
                                    double.parse(800.toString()), 172.0),
                                alignment: Alignment.center,
                                child: Assets.images.per.image(
                                  height: ScreenSize.getHeight(
                                      double.parse(800.toString()), 172.0),
                                  width: ScreenSize.getWidth(
                                      double.parse(360.toString()), 258.0),
                                ),
                              ),
                            ),
                            Positioned(
                                top: 75,
                                left: 10,
                                child: Text(
                                  "Easy to\nfind & Fix",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                )),
                            Positioned(
                              bottom: 8,
                              left: 10,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text("Find now"),
                              ),
                            )
                          ],
                        )
                        // TitleSection()

                        ),
                  ),


                  Padding(
                    padding: EdgeInsets.only(left: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "Latest Jobs",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF222222),
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      height: ScreenSize.getHeight(double.parse(800.toString()), 700),
                      child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        childAspectRatio:
                            MediaQuery.of(context).size.height / 1000,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 16.0,
                        children: List.generate(12, (index) {
                          return Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                              //set border radius more than 50% of height and width to make circle
                            ),
                            child: Container(
                              height: ScreenSize.getHeight(
                                  double.parse(800.toString()), 200.0),
                              decoration: BoxDecoration(
                                color: Color(0xf5ffffff),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                      height: ScreenSize.getHeight(
                                          double.parse(800.toString()), 170.0),
                                      child: Assets.images.electritionexpert
                                          .image(
                                              height: ScreenSize.getHeight(
                                                  double.parse(800.toString()),
                                                  152.0),
                                              fit: BoxFit.cover)),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5.0, right: 5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "John Doe",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Color(0xff3d3d3d),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5.0, top: 2),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          "Construction Expert",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xff3d3d3d),
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => HomeTechViewModel(),
    );
  }
}

class TitleSection extends ViewModelWidget<HomeTechViewModel> {
  const TitleSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeTechViewModel viewModel) {
    return ViewModelBuilder<HomeTechViewModel>.reactive(
      onModelReady: (model) => model.getSponsorSlide(),
      builder: (context, model, child) => ModelFutureListBuilder<RspBanner>(
          busy: model.isBusy,
          data: model.banner_images,
          builder: (context, data, child) {
            return BannerWidget(list: data);
          }),
      viewModelBuilder: () => HomeTechViewModel(),
    );
  }
}
