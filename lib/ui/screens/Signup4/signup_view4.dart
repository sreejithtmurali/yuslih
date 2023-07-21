
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'package:stacked/stacked.dart';

import '../../../app/app.router.dart';
import '../../tools/screen_size.dart';
import '../../tools/smart_dialog_config.dart';
import '../Signup3/signup_view3model.dart';
import 'signup_view4model.dart';

class SignUpView4 extends StatelessWidget {
  late String name;
  late String email;
  late String password;
  late String phone;
  String selectedCategories;
  late String selectedValue;
  late String amt;

Key?key;
  SignUpView4({this.key,required this.name, required this.email, required this.password,  required this.phone,
      required this.selectedCategories, required this.selectedValue,required this.amt});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpView4Model>.reactive(
      builder: (context, model, child) {
        // final arguments = ModalRoute.of(context)!.settings.arguments as SignUpView4Arguments;
        // name = arguments.name;
        // email=arguments.email;
        // password=arguments.password;
        // phone=arguments.phone;
        //
        // selectedCategories=arguments.selectedCategories;
        // selectedValue=arguments.selectedValue;
        ImagePicker image = ImagePicker();
        var url ;
        // uploadFile() async {
        //   try {
        //     model.uploadFile(name, email, password, phone, selectedCategories, selectedValue, url,amt);
        //   } on Exception catch (e) {
        //     print(e);
        //   }
        // }
        return Scaffold(
          backgroundColor: const Color(0xffF5F5F5),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color(0xffF5F5F5),
            leading: Padding(
              padding: const EdgeInsets.all(5.0),
              child: FloatingActionButton(
                elevation: 0,
                backgroundColor: Colors.black12,
                child: BackButton(
                  color: Colors.grey,
                ),
                onPressed: () {},
              ),
            ),
            actions: [
              SizedBox(
                  height: 50,
                  width: 50,
                  child: Center(
                      child: Text(
                    "3/3",
                    style: TextStyle(color: Colors.black),
                  )))
            ],
          ),
          body:model.isBusy?Center(child: CircularProgressIndicator()):
          SafeArea(
            top: true,
            bottom: true,
            child: Container(
              height: ScreenSize.height,
              width: ScreenSize.width,
              child: Stack(children: [
                Positioned(
                    top: ScreenSize.getHeight(
                        double.parse(800.toString()), 138.0),
                    child: SizedBox(
                      width: ScreenSize.getWidth(
                          double.parse(360.toString()), 255.0),
                      height: ScreenSize.getHeight(
                          double.parse(800.toString()), 479.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 24),
                                child: Text(
                                  "Almost there",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 24, top: 6),
                                child: Text(
                                  "Let’s finish registration",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
                Positioned(
                    top: ScreenSize.getHeight(
                        double.parse(800.toString()), 218.0),
                    left: ScreenSize.getWidth(
                        double.parse(360.toString()), 100.0),
                    right: ScreenSize.getWidth(
                        double.parse(360.toString()), 100.0),
                    child:
                     TakePic()
                ),
                Positioned(
                  top:
                      ScreenSize.getHeight(double.parse(800.toString()), 371.0),
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                      width: ScreenSize.width,
                      height: ScreenSize.getHeight(
                          double.parse(800.toString()), 200.0),
                      child: TitleSection()),
                ),
              ]),
            ),
          ),
        );
      },
      viewModelBuilder: () {
        final arguments = ModalRoute.of(context)!.settings.arguments as SignUpView4Arguments;
        name = arguments.name;
        email=arguments.email;
        password=arguments.password;
        // file=arguments.file;
        phone=arguments.phone;

        selectedCategories=arguments.selectedCategories;
        selectedValue=arguments.selectedValue;
        return SignUpView4Model(name: name, email: email, password: password, phone: phone, selectedcategory: selectedCategories, selectedValue: selectedValue,amt: amt);
      },
    );
  }
}

class TitleSection extends ViewModelWidget<SignUpView4Model> {
  TitleSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, SignUpView4Model viewModel) {

    void upload(String adhar, String selectedValue) {
      viewModel.uploadFile(
          viewModel.name,
          viewModel.email,
          viewModel.password,
          viewModel.phone,
          viewModel.selectedcategory,
          selectedValue,
          viewModel.url,
          viewModel.amt,
          adhar);

    }
    return Form(
        key: viewModel.formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Text(
                "Adhar Verification",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24),
              child: Container(
                height:
                    ScreenSize.getHeight(double.parse(800.toString()), 100.0),
                child: Container(
                    height: ScreenSize.getHeight(
                        double.parse(800.toString()), 50.0),
                    width: ScreenSize.getWidth(
                        double.parse(360.toString()), 312.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: ScreenSize.getWidth(
                              double.parse(360.toString()), 100.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value?.length != 4) {
                                return 'Enter Vaid Number';
                              }
                              return null;
                            },
                            controller: viewModel.text1,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 4,
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                        ),
                        Container(
                          width: ScreenSize.getWidth(
                              double.parse(360.toString()), 100.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value?.length != 4) {
                                return 'Enter Vaid Number';
                              }
                              return null;
                            },
                            controller: viewModel.text2,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 4,
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                        ),
                        Container(
                          width: ScreenSize.getWidth(
                              double.parse(360.toString()), 100.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value?.length != 4) {
                                return 'Enter Vaid Number';
                              }
                              return null;
                            },
                            controller: viewModel.text3,
                            keyboardType: TextInputType.number,
                            maxLength: 4,
                            textAlign: TextAlign.center,
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                        )
                      ],
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 57.0, right: 24),
              child: Container(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff3F54D1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    child: Text('Next',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xffffffff),
                        )),
                    onPressed: () {

                      if(viewModel.formKey.currentState!.validate()) {
                        String Adhar = '${viewModel.text1.text}${viewModel.text2.text}${viewModel.text3.text}';
                        print(Adhar);
                        if (Adhar.length == 12) {
                          loadingBuilder("loading");
                          upload(Adhar,viewModel.selectedValue);

                        }
                      }
                    },
                  )),
            ),
          ],
        ));
  }


}

class TakePic extends ViewModelWidget<SignUpView4Model> {
  TakePic({super.key});

  @override
  Widget build(BuildContext context, SignUpView4Model viewModel) {
    var url;

    File? _image;

    // This is the image picker
    final _picker = ImagePicker();

    getImage() async {
      final XFile? pickedImage =
      await _picker.pickImage(source: ImageSource.gallery);

      _image = File(pickedImage!.path);
      viewModel.UpdateFile(_image);

      var imagefile = FirebaseStorage.instance
          .ref()
          .child("contact_photo")
          .child("/propic.jpg");
      UploadTask task = imagefile.putFile(_image!);
      TaskSnapshot snapshot = await task;
      url = await snapshot.ref.getDownloadURL();

      viewModel.UpdateFie(url);

      // print(file);
    }

    return SizedBox(
        height: ScreenSize.getHeight(double.parse(800.toString()), 136.0),
        width:  ScreenSize.getHeight(double.parse(800.toString()), 160.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(children: [
              Container(
                  height:
                  ScreenSize.getHeight(double.parse(800.toString()), 130.0),
                  width:
                  ScreenSize.getWidth(double.parse(360.toString()), 130.0),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: viewModel.file == null
                          ? InkWell(
                        onTap: () {
                          getImage();
                        },
                        child: Stack(children: [
                          CircleAvatar(
                              radius: 65,
                              backgroundColor: Color(0xff029368),
                              // backgroundImage:
                              //     AssetImage("assets/images/painter.png"),
                              child: Stack(children: [
                                Align(
                                    alignment: Alignment.bottomRight,
                                    child: CircleAvatar(
                                        radius: 18,
                                        backgroundColor: Colors.white,
                                        child: Icon(Icons
                                            .edit) // change this children
                                    ))
                              ])),
                        ]),
                      )
                          : InkWell(
                        onTap: () {
                          getImage();
                        },
                        child: Stack(children: [
                          CircleAvatar(
                              radius: 65,
                              backgroundImage: FileImage(viewModel.file!),
                              backgroundColor: Color(0xffe5f6f1),
                              child: Stack(children: [
                                Align(
                                    alignment: Alignment.bottomRight,
                                    child: CircleAvatar(
                                        radius: 18,
                                        backgroundColor:
                                        Color(0xff4FE0B5),
                                        child: Icon(Icons
                                            .edit) // change this children
                                    ))
                              ])),
                        ]),
                      )))
            ]),
          ],
        ),

    );
  }
}
