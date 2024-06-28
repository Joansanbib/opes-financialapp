import 'dart:core';


import 'package:banking_project/data/implementation/providers_repo_impl.dart';

class ProviderViewmodel {
  final ProvidersRepoImpl providersRepoImpl;

  ProviderViewmodel(this.providersRepoImpl);

  Future<dynamic> getProviders() async {
    // Use the movementsImplementation here
    var response = await providersRepoImpl.getProvider();
    if(response.providers != null && response.providers!.isNotEmpty){
      return response.providers;
    }
    else{
      return response.error;
    }
  }
}