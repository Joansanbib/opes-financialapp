import 'package:banking_project/domain/repo/movements_repo.dart';
import 'package:banking_project/domain/entities/movement.dart';


class MovementsRepoImplementation extends MovementsRepo{

  //Simulates fake movements to use the data on other app widgets
  
  @override
  Future<List<Movement>> addMovements() async {
      
      List<Movement> movements = [];
      Movement mov1 = Movement("1", "Apartment", 600.0, DateTime.parse('2024-06-17'));
      movements.add(mov1);
      Movement mov2 = Movement("2", "Grocery", 150.0, DateTime.parse('2024-06-17'));
      movements.add(mov2);
      Movement mov3 = Movement("3", "Food", 200.0, DateTime.parse('2024-06-19'));
      movements.add(mov3);
      Movement mov4 = Movement("4", "Renting", 400.0, DateTime.parse('2024-06-19'));
      movements.add(mov4);
      Movement mov5 = Movement("5", "Cinema", 20.0, DateTime.parse('2024-06-21'));
      movements.add(mov5);
      Movement mov6 = Movement("6", "Restaurant", 100.0, DateTime.parse('2024-06-21'));
      movements.add(mov6);

      return movements;

      
  }

  @override
  Future<List<Movement>> getMovements(DateTime day, List<Movement> movements) {
    List<Movement> mov = [];

    for(var i = 0; i < movements.length; i++){
      if(movements[i].date == day){
        mov.add(movements[i]);
      }
    }
    return Future.value(mov);

  }
}