
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../tools/screen_size.dart';
import 'cart_viewmodel.dart';


class CartView extends StatelessWidget {
  CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartViewModel>.nonReactive(
      builder: (context, viewModel, child) => Scaffold(
        body: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,

            title: const Text(
              "Cart",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  color: Color(0xff000000)),
            ),
          ),
          body: SingleChildScrollView(
            child:
              Column(
                children: [
                Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Container(height: ScreenSize.getHeight(double.parse(800.toString()), 162),
                    decoration:  BoxDecoration(
                      color: Color(0xffffffff),
                       borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: Color(0xffe0e0e0)),

                    ),
                    child: Stack(
                      children: [
                         Positioned(
                             top:16,
                             left:16,
                             child: Row(
                               children: [
                                 Icon(Icons.home,color: Colors.black,size: 18,),
                                 SizedBox(width: 10,),
                                 Text('Home Address',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Color(
                                     0xff5f5f5f)),),
                               ],
                             )),
                        Positioned(
                            top:36,
                            left:46,
                            child: Row(
                              children: [
                                Text('Zip Code',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Color(
                                0xff5f5f5f))),
                            SizedBox(width: 14,),
                            Text('680303',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Color(
                                0xff5f5f5f)))
                              ],
                            )),
                        Positioned(
                            top:66,
                            left:24,
                            child: Row(
                              children: [
                                SizedBox(
                                    child: Icon(Icons.circle,color: Colors.black,size: 6,)),
                                SizedBox(width: 10,),
                                Text('All items are available for delivery',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Color(
                                    0xff5f5f5f)),),
                              ],
                            )),
                        Positioned(
                          top: 96,
                            left:0,
                            right: 0,

                            child: Container(height: .5,color: Color(0xffe0e0e0),)),
                        Positioned(
                            top: 98,
                            left:36,
                            right: 0,
                            bottom: 0,

                            child:Row(children: [Expanded(child: Text('Change delivery address',style: TextStyle(color: Color(
                                0xff5f5f5f),fontSize: 14,fontWeight: FontWeight.w500),)),Icon(Icons.arrow_forward_ios,size: 12,), SizedBox(width: 14,)],)
                            )
                      ],
                    ),
                   ),
                ),
                  SizedBox(height: 400,

                  ),
                  SizedBox(
                    height: 116,
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                          child: Row(children:  const [
                            Expanded(
                              child:Text("Total Price",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Color(
                                  0xFF575555)),),
                            ),
                            Text("₹6640",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Color(
                                0xFF575555)),)],),
                        ),
                     Padding(
                       padding: const EdgeInsets.only(left: 16.0,right: 16.0,top: 16.0),
                       child:
                       Container(
                           height: 50,
                           width: ScreenSize.width,
                           child: ElevatedButton(

                             style: ElevatedButton.styleFrom(
                                 backgroundColor: Color(0xffffc727),
                                 shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(20))),
                             child:  Text('Checkout',
                                 style: TextStyle(
                                   fontSize: 16,
                                   color: Colors.white,
                                 )),
                             onPressed: () {

                             },

                           )),
                     )
                  ],))
                ],
              ),

          ),
        ),
      ),
      viewModelBuilder: () => CartViewModel(),
    );
  }
}


