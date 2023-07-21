
import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.router.dart';
import '../../../app/utils.dart';
import '../Signup3/signup_view3model.dart';

class SignUpView4Model extends BaseViewModel {
  bool _isBusy = false;

  bool get isBusy => _isBusy;

  void toggleProgress() {
    _isBusy = !_isBusy;
    notifyListeners();
  }

  final DialogService _dialogService = DialogService();

  Future<void> showDialogue() async {
    setBusy(_isBusy); // Set the ViewModel as busy

    await _dialogService.showDialog(
      title: 'Uploading',
      description: 'please wait...',
    );

    setBusy(_isBusy); // Set the ViewModel as not busy
  }




  late String name;
  late String email;
  late String password;
  late String phone,amt;
   File? _file;
  String selectedcategory;
  late String selectedValue;
  SignUpView4Model ({ required this.name, required this.email, required this.password, required this.phone,
      required this.selectedcategory, required this.selectedValue,required this.amt});
  final formKey = GlobalKey<FormState>();
  var text1 = TextEditingController();
  var text2 = TextEditingController();
  var text3= TextEditingController();




  init() {
    print(name);
    print(email);
    print(password);

    print(selectedcategory.toString());
    print(phone);
    print(selectedValue);
    if(_file==null){
     _file= getImageFileFromAsset('assets/images/iconnn.png') as File?;
    }

  }






  File? get file => _file;

  Future<File> getImageFileFromAsset(String assetPath) async {
    // Get the temporary directory path
    final directory = await getTemporaryDirectory();
    // Create a new file in the temporary directory
    final file = File('${directory.path}/${assetPath.split('/').last}');

    // Check if the file already exists, if not, copy the asset image to the file
    if (!file.existsSync()) {
      final data = await rootBundle.load(assetPath);
      final bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
    }

    return file;
  }


  var url;
  UpdateFile(var u)
  {

    _file=u;
  }
  UpdateFie(var u)
  {

    url=u;
  }


  uploadFile(String name, String email, String password,String phone, String selectedcategory, String dropdownValue,var url,String amt,String Adharno) async {
    DatabaseReference db_Ref = FirebaseDatabase.instance.ref().child('workers');
    void toggleProgress() {
      _isBusy = !_isBusy;
      notifyListeners();
    }
    showDialogue();

    try {
      if (url != null) {
        Map<String, String> workers = {
          'name': name,
          'email': email,
          "password":password,
          'phone': phone,
          'selectedcategory': selectedcategory.toString(),
          "dropdownValue":dropdownValue,
          "amt":amt,
          'url': url,
          'adharno':Adharno
        };


        db_Ref!.push().set(workers).whenComplete(() {
          void toggleProgress() {
            _isBusy = !_isBusy;
            notifyListeners();
          }
          //code to navigate to login page
          navigationService.pushNamedAndRemoveUntil(Routes.loginView);
        });
      }
    } on Exception catch (e) {
      print(e);
    }
  }

}
// class MyWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<SignUpView4Model>.reactive(
//       viewModelBuilder: () => SignUpView4Model(),
//       builder: (context, viewModel, child) => ModalProgressHUD(
//         inAsyncCall: viewModel.isBusy,
//         progressIndicator: CircularProgressIndicator(),
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text('My App'),
//           ),
//           body: Center(
//             child: ElevatedButton(
//               child: Text('Show Progress Dialogue'),
//               onPressed: () {
//                 viewModel.toggleProgress();
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }