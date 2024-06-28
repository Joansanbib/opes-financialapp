import 'package:banking_project/domain/entities/provider.dart';



abstract class ProviderRepo{

  Future<ProviderResult> getProvider();

}