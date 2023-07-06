import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../models/RspBanner.dart';

Widget BannerWidget({VoidCallback? onPressed, required List<RspBanner> list}) {
  int _current = 00;
  int index = 1;
  changeindex(int i) {
    index=i;
  }

  return CarouselSlider(
    options:CarouselOptions( height: 200.0,
      initialPage:_current,

      aspectRatio: 16/16,
      viewportFraction: 1,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      enlargeFactor: 0.3,
      onPageChanged: changeindex(index),

      scrollDirection: Axis.horizontal,

    ),
    items: list.map((imageUrl){
      return Builder (
          builder: (BuildContext context){
            return Container(
              width: MediaQuery.of(context).size.width,

              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xffffc727),
              ),
              child:ClipRRect(
                borderRadius:
                BorderRadius.circular(10),
                child: Image.network('${imageUrl.image}',fit: BoxFit.cover,),
              ),
            //   ClipRect(
            //  child:Image.network(
            // imageUrl.image,
            // fit:BoxFit.cover,
            // ))
            );


          });
    }).toList(),
  );
}


