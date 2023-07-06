import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yuslih/models/RspBanner.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:yuslih/ui/screens/Cart/cart_view.dart';
import 'package:yuslih/ui/screens/home/home_view.dart';
import 'package:yuslih/ui/screens/hometech/hometech_view.dart';

import 'package:yuslih/ui/widgets/bottom_navigation.dart';

import '../../../constants/assets.gen.dart';
import '../../tools/model_future_builder.dart';
import '../../tools/screen_size.dart';
import '../../widgets/banner.dart';
import 'dashboardtech_viewmodel.dart';

class DashBoardTechView extends StatelessWidget {
  const DashBoardTechView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashBoardTechViewModel>.nonReactive(
      onModelReady: (model) {
        model.getSponsorSlide();
      },
      builder: (context, viewModel, child) => Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xff6175ED), Color(0xffffffff)])),
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              leading: Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 16, bottom: 16),
                child: Assets.images.logo.image(height: 16, width: 16),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0, top: 5),
                  child: CircleAvatar(
                    backgroundColor: Colors.greenAccent[400],
                    radius: 25,
                    backgroundImage: NetworkImage(
                        "https://media.gettyimages.com/photos/film-actor-mohanlal-v-nair-jury-member-of-the-cnn-ibn-indian-of-the-picture-id905654972"),
                  ),
                ),
              ],
            ),
            body: Body2(),
            bottomNavigationBar: Bottm2()),
      ),
      viewModelBuilder: () => DashBoardTechViewModel(),
    );
  }
}

class Body2 extends ViewModelWidget<DashBoardTechViewModel> {
  const Body2({super.key});

  @override
  Widget build(BuildContext context, DashBoardTechViewModel viewModel) {
    late int c;
    c = viewModel.current;
    List<Widget> pages = [HomeTechView(), CartView(), HomeTechView()];

    return pages[viewModel.current];
  }
}

class Bottm2 extends ViewModelWidget<DashBoardTechViewModel> {
  const Bottm2({super.key});

  @override
  Widget build(BuildContext context, DashBoardTechViewModel viewModel) {
    late int c;
    c = viewModel.current;
    return CurvedNavigationBar(
      backgroundColor: Color(0x3f54d1),
      color: Color(0xff3F54D1),
      items: [
        CurvedNavigationBarItem(
            child: Icon(
              Icons.home,
              color: Color(0xff4FE0B5),
            ),
            label: 'Home',
            labelStyle: TextStyle(color: Color(0xff4FE0B5))),

        CurvedNavigationBarItem(
            child: Icon(Icons.calendar_month_sharp, color: Color(0xff4FE0B5)),
            label: 'My Works',
            labelStyle: TextStyle(color: Color(0xff4FE0B5))),
        CurvedNavigationBarItem(
            child: Icon(Icons.add_card_sharp, color: Color(0xff4FE0B5)),
            label: 'Upcoming',
            labelStyle: TextStyle(color: Color(0xff4FE0B5))),
      ],
      onTap: (index) {
        viewModel.updateindex(index); // Handle button tap
      },
    );
  }
}
