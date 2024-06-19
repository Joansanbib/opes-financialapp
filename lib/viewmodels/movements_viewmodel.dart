import 'dart:core';

import 'package:banking_project/data/implementation/movements_impl.dart';
import 'package:banking_project/domain/entities/movements.dart';

class MovementsViewModel {
  final MovementsImplementation movementsImplementation;

  MovementsViewModel(this.movementsImplementation);

  Future<List<Movements>> addMovements() async {
    // Use the movementsImplementation here
    return await movementsImplementation.addMovements();
  }

  Future<List<Movements>> getMovements(DateTime day, List<Movements> movements) async {
    return await movementsImplementation.getMovements(day, movements);
  }

}