

import 'package:stacked/stacked.dart';

import '../../../app/app.router.dart';
import '../../../app/utils.dart';

class Splash2ViewModel extends BaseViewModel {


void NavNext(){
  navigationService.navigateTo(Routes.splash3View);
}
}
