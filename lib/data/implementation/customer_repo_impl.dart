import 'package:banking_project/data/services/customer_endpoints.dart';
import 'package:banking_project/data/services/providers_endpoints.dart';
import 'package:banking_project/domain/entities/customer.dart';
import 'package:banking_project/domain/repo/customer_repo.dart';
// import 'package:banking_project/domain/repo/provider_repo.dart';
// import 'package:banking_project/domain/entities/provider.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:banking_project/data/constants/app_constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CustomerRepoImpl extends CustomerRepo {
  //FlutterSecureStorage storage = AppConstants.storage;

  @override
  Future<CustomerResult> getCustomer() async {
    // var sessionToken = await storage.read(key: 'access_token');
    var url = customerURL;

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'App-id': AppConstants.appID,
      'Secret': AppConstants.secret,
    };

    var response = await http.get(headers: headers, url);

    if (response.statusCode == 200) {
      List<Customer> customers = [];
      var jsonResponse = json.decode(response.body);
      var listCustomers = jsonResponse['data'] as List<dynamic>;
     for (var customer in listCustomers) {
        customers.add(Customer.fromJson(customer));
      }
      return CustomerResult(customers: customers);
    } else { 
      String error = returnError(response.statusCode);
      return CustomerResult(error: error);
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
