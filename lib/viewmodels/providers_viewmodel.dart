import 'dart:core';


import 'package:banking_project/data/implementation/providers_repo_impl.dart';

class ProvidersViewmodel {
  final ProvidersRepoImpl providersRepoImpl;

  ProvidersViewmodel(this.providersRepoImpl);

  Future<dynamic> getProviders() async {
    var response = await providersRepoImpl.getProvider();
    if(response.providers != null && response.providers!.isNotEmpty){
      return response.providers;
    }
    else{
      return response.error;
    }
  }
}