import 'package:stacked/stacked.dart';

import '../../../app/app.router.dart';
import '../../../app/utils.dart';

class Splash3ViewModel extends BaseViewModel {



  void navSignup()  {

      navigationService.navigateTo(Routes.signUpView);
      // }
    }

  void navLogin()  {

    navigationService.navigateTo(Routes.loginView);
    // }
  }




}
