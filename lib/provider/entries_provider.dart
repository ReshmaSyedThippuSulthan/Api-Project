import 'package:enteries_apitask/service/api_function.dart';
import 'package:flutter/material.dart';

import '../model/entries_api/entries_api.dart';

class EntriesProvider with ChangeNotifier{
  
  EntriesApi? _apientry;
   EntriesApi? get apiEntry=>_apientry;
  
    setApiEntry()async{
      final response =await ApiService.getEnteries();
      if(response !=null){
        _apientry=response;
        notifyListeners();
      }
    }


}