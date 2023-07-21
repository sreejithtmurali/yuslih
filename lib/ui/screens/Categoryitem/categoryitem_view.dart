
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';
import '../../tools/screen_size.dart';
import '../home/home_viewmodel.dart';
import 'categoryitem_viewmodel.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
class CategoryItem extends StatelessWidget {
  late String categoryselected;
  CategoryItem({Key? key,required this.categoryselected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CategoryItemViewModel>.nonReactive(
      onViewModelReady: (model){
        model.getFavlist();
        model.categoryselected=categoryselected;
       model.updatecat(categoryselected);
      },

      builder: (context, viewModel, child) => Scaffold(
        body: Scaffold(
          appBar: AppBar(
            leading: BackButton(color: Colors.greenAccent,),
            actions: [IconButton(
                onPressed: (){
              viewModel.updatecat(categoryselected);
              viewModel.getFavlist();
            }, icon: Icon(Icons.refresh,color: Colors.greenAccent,))],
            elevation: 5,
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

            child:Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Citem(categoryselected:categoryselected),
            )  ))
                
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

      _launchWhatsapp(String phone,String message) async {
        var whatsapp = "$phone";
        var whatsappAndroid =Uri.parse("whatsapp://send?phone=$whatsapp&text=$message");
        if (await canLaunchUrl(whatsappAndroid)) {
          await launchUrl(whatsappAndroid);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("WhatsApp is not installed on the device"),
            ),
          );
        }
      }
    return ViewModelBuilder<CategoryItemViewModel>.reactive(
      onViewModelReady: (model){
        model.fetchDataFromFirebase();
      },

      viewModelBuilder: () => CategoryItemViewModel(categoryselected: categoryselected),
      builder: (BuildContext context, CategoryItemViewModel viewModel, Widget? child) {
        print('selected ${viewModel.workersofcat.length.toString()}');
        return ListView.builder(
            itemCount: viewModel.workersofcat.length,
            itemBuilder: (BuildContext context, int index) {
            Color c=  viewModel.getColor(viewModel.workersofcat[index]);
              return Card(
                child: Container(
                  height: 120,
                  child:
                  Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,top: 5,bottom: 5),
                            child: Container(
                              decoration: BoxDecoration(

                                image:  DecorationImage(
                                  image: NetworkImage('${viewModel.workersofcat[index].url}'),
                                  fit: BoxFit.cover,
                                ),
                                border: Border.all(
                                  width: .5,
                                  color: Colors.grey
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              width:96,
                              height: 110,

                            ),
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text("${viewModel.workersofcat[index].name}",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),textAlign: TextAlign.start,),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text("${viewModel.workersofcat[index].selectedCategory}",style: TextStyle(fontSize: 12),textAlign: TextAlign.start,),
                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
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
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text("${viewModel.workersofcat[index].amt}",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14),),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 50,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(onPressed: () async {
                                    print("pressed");
                                     bool s= await viewModel.addfav(viewModel.workersofcat[index]);
                                     // if(s){
                                     //   print("data inserted successfully");
                                     // }
                                     // else{
                                     //   print("data insertion faild");
                                     // }

                                  },color:c, icon: Icon(Icons.favorite)),
                                  FloatingActionButton(
                                    child: FaIcon(FontAwesomeIcons.whatsapp),
                                    backgroundColor: Colors.green.shade800,
                                    onPressed: () {
                                      _launchWhatsapp(
                                          viewModel.workersofcat[index].phone,
                                          "This is from yuslih...");

                                    }
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                ),
              );
            });
      },
    );
  }
}

