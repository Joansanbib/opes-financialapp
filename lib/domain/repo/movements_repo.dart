import 'package:banking_project/domain/entities/movements.dart';

abstract class MovementsRepository{

  Future<List<Movements>>getMovements(DateTime day, List<Movements> movements);

  Future<List<Movements>> addMovements();

}