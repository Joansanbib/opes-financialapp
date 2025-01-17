import 'package:banking_project/data/services/countries_endpoints.dart';
import 'package:banking_project/domain/repo/countries_repo.dart';
import 'package:banking_project/domain/entities/country.dart';
import 'package:banking_project/data/constants/app_constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CountriesRepoImpl extends CountriesRepo {
  @override
  Future<CountriesResult> getCountries() async {
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
        errorMessage = "Text displayed when the error is 200";
        break;
      case 400:
        errorMessage = "Text displayed when the error is 400";
        break;
      case 401:
        errorMessage = "Text displayed when the error is 401";
        break;
      case 403:
        errorMessage = "Text displayed when the error is 403";
        break;
      case 404:
        errorMessage = "Text displayed when the error is 404";
        break;
      case 412:
        errorMessage = "Text displayed when the error is 412";
        break;
      case 422:
        errorMessage = "Text displayed when the error is 422";
        break;
    }
    return errorMessage;
  }
}
