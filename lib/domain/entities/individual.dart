import 'package:banking_project/domain/entities/adreess.dart';

class Individual{

  final String id;
  final String firstName;
  final String lastName;
  final DateTime dateOfBirth;
  final String phoneNumber;
  final String email;
  final String status;
  final Adress adress;
  //Falta per definir Adress

  Individual(this.id, this.firstName, this.lastName, this.dateOfBirth, 
  this.phoneNumber, this.email, this.status, this.adress);

}
class Individuals{
  final List<Individual> individuals;
  Individuals(this.individuals);
}