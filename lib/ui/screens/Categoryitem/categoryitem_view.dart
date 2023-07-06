
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:stacked/stacked.dart';
import '../../tools/screen_size.dart';
import '../home/home_viewmodel.dart';
import 'categoryitem_viewmodel.dart';


class CategoryItem extends StatelessWidget {
  late String categoryselected;
  CategoryItem({Key? key,required this.categoryselected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CategoryItemViewModel>.nonReactive(
      onViewModelReady: (model){
        model.updatecat(categoryselected);
      },
      builder: (context, viewModel, child) => Scaffold(
        body: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,

            title:  Text(
              "${categoryselected}",
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
            child: Container(height: ScreenSize.height,

            child:Citem(categoryselected:categoryselected)  ))
                
                ],
              ),

          ),
        ),
      ),
      viewModelBuilder: () => CategoryItemViewModel(categoryselected: categoryselected),
    );
  }
}

class Citem extends ViewModelWidget<CategoryItemViewModel> {
  String categoryselected;
   Citem({Key? key, required this.categoryselected}) : super(key: key);

  @override
  Widget build(BuildContext context, CategoryItemViewModel viewModel) {
    return ViewModelBuilder<CategoryItemViewModel>.reactive(
      onViewModelReady: (model){
        model.fetchDataFromFirebase();
      },

      viewModelBuilder: () => CategoryItemViewModel(categoryselected: ''),
      builder: (BuildContext context, CategoryItemViewModel viewModel, Widget? child) {
        print(viewModel.workersofcat.length.toString());
        return ListView.builder(
            itemCount: viewModel.workersofcat.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 120,
                child:
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          width:96,
                          height: 113,
                          child: Image.network("${viewModel.workersofcat[index].url}",fit: BoxFit.cover,),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 150,
                            height: 103,
                            child: Column(

                              children: [
                                Text("${viewModel.workersofcat[index].name}",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),textAlign: TextAlign.start,),
                                Text("${viewModel.workersofcat[index].selectedCategory}",style: TextStyle(fontSize: 12),textAlign: TextAlign.start,),

                                RatingBar.builder(
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 20,
                                  itemPadding: EdgeInsets.symmetric(horizontal: 0.5),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                                Text("${viewModel.workersofcat[index].amt}",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14),),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(0.8),
                          child: Container(
                              width: 20,
                              height: 18,
                              child: IconButton(onPressed: (){},color: Colors.grey, icon: Icon(Icons.favorite))),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 50,right: 2,left: 0,bottom: 0),
                              child: Container(
                                width: 90,
                                height: 50,
                                child: ElevatedButton(
                                  child: Text('Hire',style: TextStyle(color: Colors.greenAccent,fontWeight: FontWeight.w500,fontSize: 14)),
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(18.0),
                                    backgroundColor: Color(0xfff9f9fc),
                                    side: BorderSide(color: Colors.greenAccent, width: 2),


                                    shape: RoundedRectangleBorder(

                                      borderRadius: BorderRadius.circular(20),

                                    ),
                                  ),
                                  onPressed: () {
                                  },
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),

              );
            });
      },
    );
  }
}

