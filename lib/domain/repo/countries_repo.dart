import 'package:banking_project/domain/entities/country.dart';


abstract class CountriesRepo{

  Future<CountriesResult> getCountries();

}