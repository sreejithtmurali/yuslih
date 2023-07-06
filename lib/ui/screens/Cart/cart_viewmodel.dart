import 'dart:async';
import 'dart:convert';

import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';

import '../../../app/app.router.dart';
import '../../../app/utils.dart';
import '../../../models/RspBanner.dart';
import '../../../services/api_service.dart';

class CartViewModel extends BaseViewModel {
  int _current = 0;

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
}
