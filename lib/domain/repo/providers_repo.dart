import 'package:banking_project/domain/entities/provider.dart';

abstract class ProvidersRepo{

  Future<ProvidersResult> getProvider();

}