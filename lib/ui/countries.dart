import 'package:banking_project/domain/entities/country.dart';
import 'package:banking_project/viewmodels/countries_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Countries extends StatefulWidget {
  const Countries({super.key});

  @override
  State<StatefulWidget> createState() => _CountryState();
}

class _CountryState extends State<Countries> {
  List<Country>? countriesAll = [];
  String error = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadData();
    });
  }

  void loadData() async {
    final countryViewModel =
        Provider.of<CountriesViewModel>(context, listen: false);
    var result = await countryViewModel.getCountries();
    if (result is List<Country>) {
      countriesAll = result;
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
             if (countriesAll != null)
              ...countriesAll!.map((country) => Text('${country.name} ${country.code} ${country.refreshStartTime}'))
            else
              const CircularProgressIndicator(),
          ],
        )));
  }
}
