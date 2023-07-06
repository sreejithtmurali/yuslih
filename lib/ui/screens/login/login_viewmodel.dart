import 'package:yuslih/app/app.router.dart';
import 'package:yuslih/app/utils.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
 void navHomr(){
   navigationService.navigateTo(Routes.dashBoardView);
 }
 void navSignup(){
   navigationService.navigateTo(Routes.signUpView);
 }
}
