import 'dart:async';

import 'package:yuslih/ui/screens/home/workerrr.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';

import '../../../app/app.router.dart';
import '../../../app/utils.dart';
import '../../../models/RspBanner.dart';
import '../../../services/api_service.dart';

class CategoryItemViewModel extends BaseViewModel {
  int _current = 0;

  CategoryItemViewModel({required this.categoryselected});

  String categoryselected="others";
   void updatecat(String c){
     categoryselected=c;
     notifyListeners();
   }

  int get current => _current;
  int index = 1;
  void updateindex(int i){
    index=i;
    notifyListeners();
  }
  final _apiService = locator<ApiService>();
  late Future<List<RspBanner>> banner_images;

  Future<List<RspBanner>> getSponsorSlide() async {
    banner_images=_apiService.getSponsorSlide();
    notifyListeners();
    return _apiService.getSponsorSlide();
  }
  void navCart(){
    navigationService.navigateTo(Routes.homeView);
  }




  List<Worker> workers = [];
  List<Worker> workersofcat = [];

  void navSignup(){
    navigationService.navigateTo(Routes.signUpView);
  }



  void fetchDataFromFirebase() {

    DatabaseReference db_Ref = FirebaseDatabase.instance.ref().child('workers');
    db_Ref.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot;
      Map Contact = data.value as Map<dynamic,dynamic>;
      print(Contact.toString());
      workers = convertFirebaseResponseToWorkerList(Contact);
      print('workers::::${workers.toString()}');
      for(int i=0;i<workers.length;i++){
        print('${workers[i].selectedCategory} ${categoryselected}');
        if(workers[i].selectedCategory.trim()==categoryselected.trim()){
          workersofcat.add(workers[i]);
        }
      }
    });






  }

  List<Worker> convertFirebaseResponseToWorkerList(Map<dynamic, dynamic> firebaseResponse) {
print(categoryselected);

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
        workers.add(worker);

    });

    return workers;
  }



}
