import 'package:banking_project/data/services/countries_endpoints.dart';
import 'package:banking_project/domain/repo/country_repo.dart';
import 'package:banking_project/domain/entities/country.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:banking_project/data/constants/app_constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CountriesRepoImpl extends CountryRepo {
  FlutterSecureStorage storage = AppConstants.storage;

  @override
  Future<CountriesResult> getCountries() async {
    // var sessionToken = await storage.read(key: 'access_token');
    var url = countriesULR;

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'App-id': AppConstants.appID,
      'Secret': AppConstants.secret,
    };

    var response = await http.get(headers: headers, url);

    if (response.statusCode == 200) {
      List<Country> countries = [];
      var jsonResponse = json.decode(response.body);
      var listCountries = jsonResponse['data'] as List<dynamic>;
      for (var countryJson in listCountries) {
        countries.add(Country.fromJson(countryJson as Map<String, dynamic>));
      }
      return CountriesResult(countries: countries);
    } else {
      String error = returnError(response.statusCode);
      return CountriesResult(error: error);
    }
  }

  String returnError(int errorCode) {
    String errorMessage = "";
    switch (errorCode) {
      case 200:
        errorMessage = "LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM";
        break;
      case 400:
        errorMessage = "LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM";
        break;
      case 401:
        errorMessage = "LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM";
        break;
      case 403:
        errorMessage = "LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM";
        break;
      case 404:
        errorMessage = "LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM";
        break;
      case 412:
        errorMessage = "LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM";
        break;
      case 422:
        errorMessage = "LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM";
        break;
    }
    return errorMessage;
  }
}
