import 'package:banking_project/data/constants/app_constants.dart';
import 'package:banking_project/data/services/partner_consents_endpoints.dart';
import 'package:banking_project/domain/entities/partner_consents.dart';
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
      List<PartnerConsents> partnerConsents = [];
      var jsonResponse = json.decode(response.body);
      var listPartnerConsents = jsonResponse['data'] as Map<String, dynamic>;
      partnerConsents.add(PartnerConsents.fromJson(listPartnerConsents));
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
        errorMessage =
            "LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM";
        break;
      case 400:
        errorMessage =
            "LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM";
        break;
      case 401:
        errorMessage =
            "LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM";
        break;
      case 403:
        errorMessage =
            "LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM";
        break;
      case 404:
        errorMessage =
            "LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM";
        break;
      case 412:
        errorMessage =
            "LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM";
        break;
      case 422:
        errorMessage =
            "LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM";
        break;
    }
    return errorMessage;
  }
}
