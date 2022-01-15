import 'package:animequotes/api_services/api_services.dart';
import 'package:animequotes/models/anime_quotes_models.dart';
import 'package:flutter/material.dart';

class AnimeQuoteProvider with ChangeNotifier {
  final ApiServices _apiServices = ApiServices();
  List<AnimeQuoteModel> _apiModelList = [];
  List<AnimeQuoteModel> get ApiModelList => _apiModelList;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  void callApi() async {
    _apiModelList = await _apiServices.getSomeData();
    print(_apiModelList[0].character);
    _isLoading = false;
    notifyListeners();
  }
}
