import 'dart:core';


import 'package:banking_project/data/implementation/customer_repo_impl.dart';
// import 'package:banking_project/data/implementation/partner_consents_repo_impl.dart';
// import 'package:banking_project/data/implementation/providers_repo_impl.dart';

class CustomerViewmodel {
  final CustomerRepoImpl customerRepoImpl;

  CustomerViewmodel(this.customerRepoImpl);

  Future<dynamic> getCustomer() async {
    // Use the movementsImplementation here
    var response = await customerRepoImpl.getCustomer();
    if(response.customers != null && response.customers!.isNotEmpty){
      return response.customers;
    }
    else{
      return response.error;
    }
  }
}