import '../model/entries_api/entries_api.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

class ApiService{
static Future<EntriesApi> getEnteries()async{
    var response =await http.get(Uri.parse("https://api.publicapis.org/entries"));

    final Map<String,dynamic> data=jsonDecode(response.body);
    print(data.runtimeType);
    EntriesApi api =EntriesApi.fromMap(data);
    return api;
  }
  }