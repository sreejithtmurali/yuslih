import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import 'package:stacked/stacked.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

import '../../../constants/assets.gen.dart';
import '../../tools/screen_size.dart';
import 'signup_viewmodel.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          body: SafeArea(
            top: true,
            bottom: true,
            child: SingleChildScrollView(
              child: Container(
                height: ScreenSize.height + 100,
                width: ScreenSize.width,
                child: Stack(children: [
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //     left: 24.0,
                  //     right: 24.0,
                  //     top: 55,
                  //   ),
                  //   child: Container(
                  //     height: ScreenSize.getHeight(
                  //         double.parse(800.toString()), 47.0),
                  //     child: Center(
                  //       child: Assets.images.logo.image(
                  //           height: ScreenSize.getHeight(
                  //               double.parse(800.toString()), 47.0),
                  //           width: ScreenSize.getWidth(
                  //               double.parse(360.toString()), 117.0)),
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //     top: ScreenSize.getHeight(
                  //         double.parse(800.toString()), 45.0),
                  //     left:
                  //         ScreenSize.getWidth(double.parse(360.toString()), 17.0),
                  //     child: SizedBox(
                  //       width: ScreenSize.getWidth(
                  //           double.parse(360.toString()), 45.0),
                  //       height: ScreenSize.getHeight(
                  //           double.parse(800.toString()), 45.0),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.start,
                  //         children: [
                  //           BackButton(
                  //             color: Colors.black,
                  //           ),
                  //         ],
                  //       ),
                  //     )),
                  Positioned(
                      top: ScreenSize.getHeight(
                          double.parse(800.toString()), 100),
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
                                    "No account yet ?",
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
                                    "Let’s fix that now",
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
                        double.parse(1300.toString()), 259.0),
                    left: 0,
                    right: 0,
                    child: SizedBox(
                        width: ScreenSize.width,
                        height: ScreenSize.getHeight(
                            double.parse(800.toString()), 1300.0),
                        child: TitleSection()),
                  ),
                ]),
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => SignUpViewModel(),
    );
  }
}

class TitleSection extends ViewModelWidget<SignUpViewModel> {
  TitleSection({Key? key}) : super(key: key);
  DatabaseReference db_Ref = FirebaseDatabase.instance.ref().child('user');


  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('assets/$path');

    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.create(recursive: true);
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }

  @override
  Widget build(BuildContext context, SignUpViewModel viewModel) {


    ImagePicker image = ImagePicker();
    var url = viewModel.url;



    uploadFile() async {
      try {
        viewModel.uploadFile(viewModel.nameController.text,viewModel.usernameController.text,
            viewModel.passwordController.text, url);
      } on Exception catch (e) {
        print(e);
      }
    }

    void NavNext(String name, String email, String password, File file) {
      try {

        viewModel.NavNext(name, email, password);
      } on Exception catch (e) {
        print(e);
      }
    }

    return Form(
        key:viewModel.formKeysignup,
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Container(
                height:
                    ScreenSize.getHeight(double.parse(800.toString()), 150.0),
                child: Align(alignment: Alignment.center, child: TakePic())),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Name';
                  }
                  return null;
                },
                controller: viewModel.nameController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  filled: true,
                  fillColor: Color(0xffFAFAFA),

                  // border: OutlineInputBorder(
                  //   borderSide: BorderSide(
                  //       width: 1, color: Color(0xffE4F8F8)),
                  // ),
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Color(0xffBFBFBF)),
                  floatingLabelStyle: TextStyle(color: Color(0xffBFBFBF)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0xfE4F8F8)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0xff3F54D1)),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.red),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
              child: TextFormField(
                validator: (value) {
                  if (!(value!.contains("@"))) {
                    return 'Please enter Email';
                  }
                  return null;
                },
                controller: viewModel.usernameController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  filled: true,
                  fillColor: Color(0xffFAFAFA),

                  // border: OutlineInputBorder(
                  //   borderSide: BorderSide(
                  //       width: 1, color: Color(0xffE4F8F8)),
                  // ),
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Color(0xffBFBFBF)),
                  floatingLabelStyle: TextStyle(color: Color(0xffBFBFBF)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0xfE4F8F8)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0xff3F54D1)),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.red),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty || (value.length < 6)) {
                    return 'Please enter Password';
                  }
                  return null;
                },
                controller: viewModel.passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock_open),
                  filled: true,
                  fillColor: Color(0xffFAFAFA),

                  // border: OutlineInputBorder(
                  //   borderSide: BorderSide(
                  //       width: 1, color: Color(0xffE4F8F8)),
                  // ),
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Color(0xffBFBFBF)),
                  floatingLabelStyle: TextStyle(color: Color(0xffBFBFBF)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0xfE4F8F8)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0xff3F54D1)),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.red),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
              child: TextFormField(
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      (value != viewModel.passwordController.text)) {
                    return 'Password Mismatched';
                  }
                  return null;
                },
                controller: viewModel.conpasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock_open),
                  filled: true,
                  iconColor: Color(0xff000000),
                  fillColor: Color(0xffFAFAFA),

                  // border: OutlineInputBorder(
                  //   borderSide: BorderSide(
                  //       width: 1, color: Color(0xffE4F8F8)),
                  // ),
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(color: Color(0xffBFBFBF)),
                  floatingLabelStyle: TextStyle(color: Color(0xffBFBFBF)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0xfE4F8F8)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0xff3F54D1)),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.red),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 64.0, right: 24),
              child: Container(
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff4FE0B5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25))),
                      child: Text('Create Account',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          )),
                      onPressed: () {
                        if (viewModel.formKeysignup.currentState!.validate()) {
                          if (url != null) {
                            uploadFile();
                            // viewModel.NavLogin();
                          } else {
                            Fluttertoast.showToast(
                                msg: "Upload pic to continue",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
                        }
                      })),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 12.0, right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'or',
                    style: TextStyle(fontSize: 14, color: Color(0xff092f92)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 12.0, right: 24),
              child: Container(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff3F54D1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    child: Text('Iam a technician',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xffffffff),
                        )),
                    onPressed: () {
                      if (viewModel.formKeysignup.currentState!.validate()) {

                          NavNext(viewModel.nameController.text, viewModel.usernameController.text,
                              viewModel.passwordController.text, viewModel.file);
                          // viewModel.NavLogin();

                      }
                    },
                  )),
            ),
          ],
        ));
  }
}

class TakePic extends ViewModelWidget<SignUpViewModel> {
  TakePic({super.key});

  @override
  Widget build(BuildContext context, SignUpViewModel viewModel) {
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

    return Scaffold(
      body: SizedBox(
        height: ScreenSize.getHeight(double.parse(800.toString()), 130.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(children: [
              Container(
                  height:
                      ScreenSize.getHeight(double.parse(800.toString()), 130.0),
                  width:
                      ScreenSize.getHeight(double.parse(800.toString()), 130.0),
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
                                    backgroundImage: FileImage(viewModel.file),
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
      ),
    );
  }
}
