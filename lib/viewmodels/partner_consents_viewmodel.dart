import 'dart:core';


import 'package:banking_project/data/implementation/partner_consents_repo_impl.dart';
import 'package:banking_project/data/implementation/providers_repo_impl.dart';

class PartnerConsentsViewmodel {
  final PartnerConsentsRepoImpl partnerConsentsRepoImpl;

  PartnerConsentsViewmodel(this.partnerConsentsRepoImpl);

  Future<dynamic> getPartnerConsents() async {
    // Use the movementsImplementation here
    var response = await partnerConsentsRepoImpl.getPartnerConsents();
    if(response.partnerConsents != null && response.partnerConsents!.isNotEmpty){
      return response.partnerConsents;
    }
    else{
      return response.error;
    }
  }
}