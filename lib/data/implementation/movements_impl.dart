import 'package:banking_project/domain/repo/movements_repo.dart';
import 'package:banking_project/domain/entities/movements.dart';


class MovementsImplementation extends MovementsRepository{


  @override
  Future<List<Movements>> addMovements() async {
      
      List<Movements> movements = [];
      Movements mov1 = Movements("1", "Apartment", 600.0, DateTime.parse('2024-06-17'));
      movements.add(mov1);
      Movements mov2 = Movements("2", "Grocery", 150.0, DateTime.parse('2024-06-17'));
      movements.add(mov2);
      Movements mov3 = Movements("3", "Food", 200.0, DateTime.parse('2024-06-19'));
      movements.add(mov3);
      Movements mov4 = Movements("4", "Renting", 400.0, DateTime.parse('2024-06-19'));
      movements.add(mov4);
      Movements mov5 = Movements("5", "Cinema", 20.0, DateTime.parse('2024-06-21'));
      movements.add(mov5);
      Movements mov6 = Movements("6", "Restaurant", 100.0, DateTime.parse('2024-06-21'));
      movements.add(mov6);

      return movements;

      
  }

  @override
  Future<List<Movements>> getMovements(DateTime day, List<Movements> movements) {
    List<Movements> mov = [];

    for(var i = 0; i < movements.length; i++){
      if(movements[i].date == day){
        mov.add(movements[i]);
      }
    }
    return Future.value(mov);

  }
}