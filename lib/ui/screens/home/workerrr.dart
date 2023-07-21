import 'package:firebase_database/firebase_database.dart';

class Worker {
   String? id;
  late String password;
  late String adharno;
  late String phone;
  late String dropdownValue;
  late String name;
  late String amt;
  late String selectedCategory;
  late String email;
  late String url;

  Worker({
    this.id,
    required this.password,
    required this.adharno,
    required this.phone,
    required this.dropdownValue,
    required this.name,
    required this.amt,
    required this.selectedCategory,
    required this.email,
    required this.url,
  });

   Map<String, dynamic> toMap() {
     return {'id':id,'name': name, 'password': password,'adharno':adharno,'phone':phone,'dropdownValue':dropdownValue,'amt':amt,'selectedCategory':selectedCategory,'email':email,'url':url};
   }

}
