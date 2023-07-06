import 'dart:async';

import 'package:stacked/stacked.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../app/utils.dart';
import '../../../models/RspBanner.dart';
import '../../../services/api_service.dart';

class DashBoardViewModel extends BaseViewModel {
  int _current = 0;

  int get current => _current;

  void updateindex(int i){
    _current=i;
    notifyListeners();
  }
  final _apiService = locator<ApiService>();
  List<RspBanner> banner_images = [];




  Future<void> getSponsorSlide() async {
    var data = await  runBusyFuture(_apiService.getSponsorSlide());
    if (data.isNotEmpty) {
      banner_images = data;
    }
  }


  void navCart(){
    navigationService.navigateTo(Routes.cartView);
  }
}
