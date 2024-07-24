import 'package:banking_project/data/services/providers_endpoints.dart';
import 'package:banking_project/domain/repo/providers_repo.dart';
import 'package:banking_project/domain/entities/provider.dart';
import 'package:banking_project/data/constants/app_constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProvidersRepoImpl extends ProvidersRepo {

  @override
  Future<ProvidersResult> getProvider() async {
    var url = providersURL;

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'App-id': AppConstants.appID,
      'Secret': AppConstants.secret,
    };

    var response = await http.get(headers: headers, url);

    if (response.statusCode == 200) {
      List<Provider> providers = [];
      var jsonResponse = json.decode(response.body);
      var listProviders = jsonResponse['data'] as Map<String, dynamic>;
      providers.add(Provider.fromJson(listProviders));
      return ProvidersResult(providers: providers);
    } else {
      String error = returnError(response.statusCode);
      return ProvidersResult(error: error);
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
