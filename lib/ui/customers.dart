import 'package:banking_project/domain/entities/customer.dart';
import 'package:banking_project/viewmodels/customers_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Customers extends StatefulWidget {
  const Customers({super.key});

  @override
  State<StatefulWidget> createState() => _CustomerState();
}

class _CustomerState extends State<Customers> {
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
    Provider.of<CustomersViewmodel>(context, listen: false);
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
        appBar: AppBar(title: const Text('Customers')),
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
