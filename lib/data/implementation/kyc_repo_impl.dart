import 'package:banking_project/domain/repo/kyc_repo.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:banking_project/data/constants/app_constants.dart';
import 'package:http/http.dart' as http;

class KycImplementation extends KycRepository{
  FlutterSecureStorage storage = AppConstants.storage;

  @override
  Future<void> questionnaire(url, apiKey) async{
    var sessionToken = await storage.read(key: 'access_token');

    Map<String, String> headers = {
    'Authorization': 'Bearer $sessionToken',
    };

    var response = await http.post(url, headers: headers, body:{

    });
    String message = returnError(response.statusCode);
  }

  @override
  Future<void> idVerification(url, apiKey) {
    throw UnimplementedError();
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