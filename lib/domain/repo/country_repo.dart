import 'package:banking_project/domain/entities/country.dart';


abstract class CountryRepo{

  Future<CountriesResult> getCountries();

}