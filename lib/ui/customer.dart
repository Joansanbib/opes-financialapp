import 'package:banking_project/domain/entities/customer.dart';
import 'package:banking_project/domain/entities/partner_consents.dart';
import 'package:banking_project/viewmodels/customer_viewmodel.dart';
import 'package:banking_project/viewmodels/partner_consents_viewmodel.dart';
import 'package:banking_project/viewmodels/provider_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:banking_project/domain/entities/provider.dart';


class customerUI extends StatefulWidget {
  const customerUI({super.key});

  @override
  State<StatefulWidget> createState() => _CustomerState();
}

class _CustomerState extends State<customerUI> {
  List<Customer>? customer = [];
  String error = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadData();
    });
  }

  void loadData() async {
    final providerVM =
    Provider.of<CustomerViewmodel>(context, listen: false);
    var result = await providerVM.getCustomer();
    if (result is List<Customer>) {
      customer = result;
    }else{
      error = result;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Countries')),
        body: SingleChildScrollView(
            child: Column(
          children: [
             if (customer != null)
                ...customer!.map((customer) => Text('${customer.id}, ${customer.identifier}, ${customer.secret}, ${customer.createdAt},  ${customer.updatedAt}, ${customer.blockedAt},  '))
                else
              Text(error),
              Text(error),
              Text(error),
              Text(error),
              Text(error),
          ],
        )));
  }
}
