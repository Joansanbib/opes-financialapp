import 'package:banking_project/domain/entities/movement.dart';

abstract class MovementsRepo{

  Future<List<Movement>>getMovements(DateTime day, List<Movement> movements);

  Future<List<Movement>> addMovements();

}