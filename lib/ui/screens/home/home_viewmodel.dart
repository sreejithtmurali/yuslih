import 'dart:async';
import 'dart:convert';


import 'package:stacked/stacked.dart';
import 'package:yuslih/ui/screens/home/workerrr.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../app/utils.dart';
import '../../../models/RspBanner.dart';
import '../../../services/api_service.dart';
import 'package:firebase_database/firebase_database.dart';
class HomeViewModel extends BaseViewModel {
  int _current = 0;

  int get current => _current;
  int index = 1;
  List<Worker> workers = [];
  void updateindex(int i) {
    index = i;
    notifyListeners();
  }

  final _apiService = locator<ApiService>();
  List<RspBanner> banner_images = [];


  Future<void> getSponsorSlide() async {
    var data = await runBusyFuture(_apiService.getSponsorSlide());
    if (data.isNotEmpty) {
      banner_images = data;
    }
  }


  void navCart() {
    navigationService.navigateTo(Routes.cartView);
  }


  void fetchDataFromFirebase() {
    DatabaseReference db_Ref = FirebaseDatabase.instance.ref().child('user');
    db_Ref.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot;
      Map Contact = data.value as Map;

      print(Contact.toString());
    });
  }

  void fetchWorkersFromFirebase() {
    DatabaseReference db_Ref = FirebaseDatabase.instance.ref().child('workers');
    db_Ref.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot;
      //var Workerrr = data.value;

      Map<String, Map<String, dynamic>> Workerrr= data.value as Map<String, Map<String, dynamic>>;



     notifyListeners();

      String jsonResponse = json.encode(Workerrr.toString());
      print('jsonResponse    $jsonResponse');

      workers = convertMapToList(Workerrr);
      workers.forEach((worker) {
        print(worker.name);
      });



      notifyListeners();
      print('list    $workers');

    });
  }




//




  // Example Firebase response

// Print the resulting list


}