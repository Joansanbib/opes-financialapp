import 'dart:core';

import 'package:banking_project/data/implementation/countries_repo_impl.dart';
import 'package:banking_project/domain/entities/country.dart';

class CountriesViewModel {
  final CountriesRepoImpl countriesRepoImpl;

  CountriesViewModel(this.countriesRepoImpl);

  Future<dynamic> getCountries() async {
    // Use the movementsImplementation here
    var response = await countriesRepoImpl.getCountries();
    if(response.countries != null && response.countries!.isNotEmpty){
      return response.countries;
    }
    else{
      return response.error;
    }
  }
}