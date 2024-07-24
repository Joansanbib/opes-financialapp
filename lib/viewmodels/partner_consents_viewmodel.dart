import 'dart:core';


import 'package:banking_project/data/implementation/partner_consents_repo_impl.dart';
class PartnerConsentsViewmodel {
  final PartnerConsentsRepoImpl partnerConsentsRepoImpl;

  PartnerConsentsViewmodel(this.partnerConsentsRepoImpl);

  Future<dynamic> getPartnerConsents() async {
    var response = await partnerConsentsRepoImpl.getPartnerConsents();
    if(response.partnerConsents != null && response.partnerConsents!.isNotEmpty){
      return response.partnerConsents;
    }
    else{
      return response.error;
    }
  }
}