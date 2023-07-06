
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:yuslih/app/app.router.dart';
import 'package:yuslih/app/utils.dart';
import 'package:stacked/stacked.dart';
import 'package:yuslih/ui/screens/home/workerrr.dart';
class LoginViewModel extends BaseViewModel {


  final _formKey = GlobalKey<FormState>();
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  List<Worker> workers = [];
 void navHomr(){

   if(workers.isEmpty){
     fetchDataFromFirebase();
   }
   print(workers.length);

     for (int i = 0; i < workers.length; i++) {
       if (usernameController.text.trim().toString()==workers[i].email.trim().toString()) {
         if((passwordController.text.trim().toString()== workers[i].password.trim().toString()))
            {
               navigationService.navigateTo(Routes.dashBoardView);
               break;
            }
             }else{
               print("mismatch${usernameController.text} ${workers[i].email}");
             }
     }

 }
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

  get formKey => _formKey;


}
