import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:yuslih/ui/screens/home/workerrr.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';

import '../../../app/app.router.dart';
import '../../../app/utils.dart';
import '../../../models/RspBanner.dart';
import '../../../services/api_service.dart';
import '../../../services/database_helper.dart';

class CategoryItemViewModel extends BaseViewModel {
  final _dbservice = locator<DBWorkerManager>();
  List<Worker> favlist = [];

  Future<void> getFavlist() async {
    var data = await runBusyFuture(_dbservice.getStudentList());
    if (data.isNotEmpty) {
      favlist = data;
      notifyListeners();
    }
  }
  Future<bool> addfav(Worker worker) async {
    print("addfav caled");
    var data;
    try {
       data = await runBusyFuture(_dbservice.insertStudent(worker));
       getFavlist();
    }catch(e){
      print(e.toString());
      getFavlist();

    }
    if (data>0) {
     return true;

    }
    else{
     runBusyFuture(_dbservice.deleteWoker(worker.id));
      return false;

    }

  }

  int _current = 0;
  String categoryselected = "others";

  CategoryItemViewModel({required this.categoryselected});


  int get current => _current;
  int index = 1;

  void updateindex(int i) {
    index = i;
    notifyListeners();
  }

  final _apiService = locator<ApiService>();
  late Future<List<RspBanner>> banner_images;

  Future<List<RspBanner>> getSponsorSlide() async {
    banner_images = _apiService.getSponsorSlide();
    notifyListeners();
    return _apiService.getSponsorSlide();
  }

  void navCart() {
    navigationService.navigateTo(Routes.homeView);
  }


  List<Worker> workers = [];
  List<Worker> workersofcat = [];

  void navSignup() {
    navigationService.navigateTo(Routes.signUpView);
  }


  void fetchDataFromFirebase() {
    DatabaseReference db_Ref = FirebaseDatabase.instance.ref().child('workers');
    db_Ref.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot;
      Map Contact = data.value as Map<dynamic, dynamic>;
      print(Contact.toString());
      workersofcat = convertFirebaseResponseToWorkerList(Contact);
      print('workers::::${workersofcat.toString()}');
      notifyListeners();
    });
  }

  List<Worker> convertFirebaseResponseToWorkerList(
      Map<dynamic, dynamic> firebaseResponse) {
    print(categoryselected);
    workersofcat.clear();
    firebaseResponse.forEach((key, value) {
      String id = key;
      String password = value['password'];
      String name = value['name'];
      String url = value['url'];
      String email = value['email'];
      String adharno = value['adharno'];
      String phone = value['phone'];
      String dropdownValue = value['dropdownValue'];
      String amt = value['amt'];
      String selectedCategory = value['selectedcategory'];

      Worker worker = Worker(id: id,
          password: password,
          name: name,
          url: url,
          email: email,
          adharno: adharno,
          phone: phone,
          dropdownValue: dropdownValue,
          amt: amt,
          selectedCategory: selectedCategory);

      if (worker.selectedCategory.trim() == categoryselected.trim()) {
        workersofcat.add(worker);
      }
      workers.add(worker);
    });

    return workersofcat;
  }

  void updatecat(String c) {
    categoryselected = c.trim();
    fetchDataFromFirebase();
    notifyListeners();
  }

  Color getColor(Worker workersofcat) {
    Color c = Colors.grey;
    if (favlist.length == 0) {
      c = Colors.grey;
    }
    for (int i = 0; i <= favlist.length; i++) {
      try {
        if (favlist[i].email.trim() == workersofcat.email.trim()) {
          c = Colors.red;
          break;
        } else {
          c = Colors.grey;
        }
      } catch (e) {
        print(e.toString());
      }
    }
      return c;
    }

}
