import 'package:banking_project/domain/entities/customer.dart';

abstract class CustomersRepo{

  Future<CustomersResult> getCustomer();
  
}