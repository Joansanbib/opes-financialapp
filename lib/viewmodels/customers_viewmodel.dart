import 'dart:core';


import 'package:banking_project/data/implementation/customers_repo_impl.dart';


class CustomersViewmodel {
  final CustomersRepoImpl customerRepoImpl;

  CustomersViewmodel(this.customerRepoImpl);

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