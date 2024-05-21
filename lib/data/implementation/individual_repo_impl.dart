import 'package:banking_project/data/constants/app_constants.dart';
import 'package:banking_project/domain/entities/individual.dart';
import 'package:banking_project/domain/repo/individual_repo.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class IndivualImplementation extends IndividualRepo{

  FlutterSecureStorage storage = AppConstants.storage;

  @override
  Future<void> createIndividual(url) async {
    var sessionToken = await storage.read(key: 'access_token');

    Map<String, String> headers = {
    'Authorization': 'Bearer $sessionToken',
    };

    var response = await http.post(url, headers: headers, body:{

    });
    String message = returnError(response.statusCode);

  }




  @override
  Future<Individual?> getIndividual(url, id) async {
    var session_token = await storage.read(key: 'access_token');

    Map<String, String> headers = {
    'Authorization': 'Bearer $session_token',
    };

    var response = await http.get(headers: headers, url);

    String message = returnError(response.statusCode);
  }



  @override
  Future<Individuals> getIndividuals(url) async {
    var sessionToken = await storage.read(key: 'access_token');

    Map<String, String> headers = {
    'Authorization': 'Bearer $sessionToken',
    };


    var response = await http.get(headers: headers, url);


    String message = returnError(response.statusCode);
  }



  @override
  Future<void> startOnBoarding(url) async {
    var sessionToken = await storage.read(key: 'access_token');

    Map<String, String> headers = {
    'Authorization': 'Bearer $sessionToken',
    };

    var response = await http.post(headers: headers, url, body:{

    });
    String message = returnError(response.statusCode);
  }



  @override
  Future<void> updateIndividual(url) async {
    var sessionToken = await storage.read(key: 'access_token');

    Map<String, String> headers = {
    'Authorization': 'Bearer $sessionToken',
    };


    var response = await http.patch(headers: headers, url , body:{

    });
    String message = returnError(response.statusCode);
  }

  String returnError(int errorCode){
    String errorMessage="";
    switch(errorCode){
      case 200 : errorMessage = "";
      break;
      case 400: errorMessage = "";
      break;
      case 401: errorMessage = "";
      break;
      case 403 : errorMessage = "";
      break;
      case 404: errorMessage = "";
      break; 
      case 412 : errorMessage = ""; 
      break;
      case 422 : errorMessage = ""; 
      break;
    }
    return errorMessage;
  }

}