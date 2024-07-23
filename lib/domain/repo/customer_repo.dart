import 'package:banking_project/domain/entities/customer.dart';

abstract class CustomerRepo{

  Future<CustomerResult> getCustomer();
  
}