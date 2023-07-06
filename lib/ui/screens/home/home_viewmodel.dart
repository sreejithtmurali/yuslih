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

import 'category.dart';
class HomeViewModel extends BaseViewModel {
  int _current = 0;
List<Category> clist=[
  Category(id: 1, name: 'Expert Painter', image: 'assets/images/painter.png'),
  Category(id: 2, name: 'Carpenter', image: 'assets/images/carpenter.png'),
  Category(id: 3, name:   'Driver', image: 'assets/images/driver.png'),
  Category(id: 3, name:   'Plumber', image: 'assets/images/driver.png'),
  Category(id: 4, name:  'Cleaner', image: 'assets/images/carpenter.png'),
  Category(id: 5, name:  'Gardener', image: 'assets/images/carpenter.png'),
  Category(id: 6, name:    'House Keeping', image: 'assets/images/carpenter.png'),
  Category(id: 7, name: 'Welder', image: 'assets/images/carpenter.png'),
  Category(id: 8, name: 'Bike Mechanic', image: 'assets/images/carpenter.png'),
  Category(id: 9, name: 'AC Mechanic', image: 'assets/images/carpenter.png'),
  Category(id: 10, name: 'Helper', image: 'assets/images/construction.png'),
  Category(id: 11, name: 'Electrician', image: 'assets/images/electritionexpert.png'),
  Category(id: 12, name: 'others', image: 'assets/images/electritionexpert.png'),

];
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

  void navCategory(String c) {
    navigationService.navigateTo(Routes.categoryItem,arguments: CategoryItemArguments(categoryselected:c));
  }
  void fetchDataFromFirebase() {
    DatabaseReference db_Ref = FirebaseDatabase.instance.ref().child('workers');
    db_Ref.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot;
      Map Contact = data.value as Map<dynamic,dynamic>;
      print(Contact.toString());
      workers = convertFirebaseResponseToWorkerList(Contact);
      print('workers::::${workers.toString()}');
    });






  }

  List<Worker> convertFirebaseResponseToWorkerList(Map<dynamic, dynamic> firebaseResponse) {


    firebaseResponse.forEach((key, value) {
      String id = key;
      String password = value['password'];
      String name = value['name'];
      String url = value['url'];
      String email = value['email'];
      String adharno=value['adharno'];
      String  phone= value['phone'];
      String  dropdownValue= value['dropdownValue'];

      String  amt=value['amt'];
      String selectedCategory= value['selectedcategory'];

      Worker worker = Worker(id: id, password: password, name: name, url: url, email: email, adharno:adharno, phone: phone, dropdownValue: dropdownValue, amt: amt, selectedCategory: selectedCategory );
      workers.add(worker);
    });

    return workers;
  }

// Usage example:



// Accessing worker details





//




  // Example Firebase response

// Print the resulting list


}