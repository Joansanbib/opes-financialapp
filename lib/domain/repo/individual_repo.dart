import 'package:banking_project/domain/entities/individual.dart';

abstract class IndividualRepo{
  Future<void> createIndividual(var url);

  Future<Individuals> getIndividuals(var url);

  Future<Individual> getIndividual(var url, var id);

  Future<void> startOnBoarding(var url);

  Future<void> updateIndividual(var url);

}