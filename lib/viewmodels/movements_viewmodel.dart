import 'dart:core';

import 'package:banking_project/data/implementation/movements_repo_impl.dart';
import 'package:banking_project/domain/entities/movement.dart';

class MovementsViewModel {
  final MovementsRepoImplementation movementsImplementation;

  MovementsViewModel(this.movementsImplementation);

  Future<List<Movement>> addMovements() async {
    return await movementsImplementation.addMovements();
  }

  Future<List<Movement>> getMovements(DateTime day, List<Movement> movements) async {
    return await movementsImplementation.getMovements(day, movements);
  }

}