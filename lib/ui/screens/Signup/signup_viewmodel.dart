import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stacked/stacked.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import '../../../app/app.router.dart';
import '../../../app/utils.dart';

class SignUpViewModel extends BaseViewModel {
  final formKeysignup = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var conpasswordController = TextEditingController();
  File _file=File("");


  File get file => _file;

  Future<XFile?> compressAndGetFile(String assetPath) async {
    final ByteData assetByteData = await rootBundle.load(assetPath);
    final List<int> assetBytes = assetByteData.buffer.asUint8List();

    final Directory tempDir = await getTemporaryDirectory();
    final String tempPath = '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';

    final File tempFile = File(tempPath);
    final XFile? compressedFile = await FlutterImageCompress.compressAndGetFile(
      tempFile.path,
      assetBytes as String,
      quality: 80, // Adjust the quality as per your needs (0 to 100)
    );

    return compressedFile;
  }

Future<void> convertAssetImageToFile() async {
    try {
      // Provide the asset path of the image you want to convert
      final String assetPath = 'assets/images/iconnn.png';

      final File convertedFile = (await compressAndGetFile(assetPath)) as File;

      _file = convertedFile;


      print('Image converted successfully. File path: ${_file?.path}');
    } catch (e) {
      print('Error converting asset image to file: $e');
    }
  }

  var url;
  late String name,email,password, path;

  void NavNext(String name1,String email1,String pass1) {
    this.name=name1;
    this.email=email1;
    this.password=pass1;


    SignUpView2Arguments s=  SignUpView2Arguments(name: name, email: email, password: password);

    navigationService.navigateTo(Routes.signUpView2,
        arguments:s);
  }
  void NavLogin(){
    navigationService.navigateTo(Routes.loginView);
  }





  UpdateFile(var u)
  {

    _file=u;
  }
  UpdateFie(var u)
  {

    url=u;
  }


  uploadFile(String name,String email,String pass,var url) async {
    DatabaseReference db_Ref = FirebaseDatabase.instance.ref().child('user');
    try {
      if (url != null) {
        Map<String, String> user = {
          'name': name,
          'emai': email,
          "password":pass,
          'url': url,
        };

        db_Ref!.push().set(user).whenComplete(() {
          navigationService.navigateTo(Routes.loginView);
        });
      }
    } on Exception catch (e) {
      print(e);
    }
  }



}
