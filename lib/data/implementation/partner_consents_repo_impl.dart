import 'package:banking_project/data/constants/app_constants.dart';
import 'package:banking_project/data/services/partner_consents_endpoints.dart';
import 'package:banking_project/domain/entities/partner_consent.dart';
import 'package:banking_project/domain/repo/partner_consents_repo.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PartnerConsentsRepoImpl extends PartnerConsentsRepo {
  @override
  Future<PartnerConsentsResult> getPartnerConsents() async {
    var url = partnerConsentsURL;

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'App-id': AppConstants.appID,
      'Secret': AppConstants.secret,
    };

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      List<PartnerConsent> partnerConsents = [];
      var jsonResponse = json.decode(response.body);
      var listPartnerConsents = jsonResponse['data'] as List<dynamic>;
      for (var partnerConsent in listPartnerConsents) {
        partnerConsents.add(PartnerConsent.fromJson(partnerConsent));
      }
      return PartnerConsentsResult(partnerConsents: partnerConsents);
    } else {
      String error = returnError(response.statusCode);
      return PartnerConsentsResult(error: error);
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
