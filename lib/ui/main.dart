import 'package:banking_project/data/implementation/countries_repo_impl.dart';
import 'package:banking_project/data/implementation/customers_repo_impl.dart';
import 'package:banking_project/data/implementation/movements_repo_impl.dart';
import 'package:banking_project/data/implementation/partner_consents_repo_impl.dart';
import 'package:banking_project/data/implementation/providers_repo_impl.dart';
import 'package:banking_project/ui/dashboard.dart';
import 'package:banking_project/viewmodels/countries_viewmodel.dart';
import 'package:banking_project/viewmodels/customers_viewmodel.dart';
import 'package:banking_project/viewmodels/movements_viewmodel.dart';
import 'package:banking_project/viewmodels/partner_consents_viewmodel.dart';
import 'package:banking_project/viewmodels/providers_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<MovementsRepoImplementation>(
          create: (_) => MovementsRepoImplementation(),
        ),
        ProxyProvider<MovementsRepoImplementation, MovementsViewModel>(
          update: (_, movementImpl, __) => MovementsViewModel(movementImpl),
        ),
        Provider<CountriesRepoImpl>(
          create: (_) => CountriesRepoImpl(),
        ),
        ProxyProvider<CountriesRepoImpl, CountriesViewModel>(
          update: (_, countriesImpl, __) => CountriesViewModel(countriesImpl),
        ),
        Provider<ProvidersRepoImpl>(
          create: (_) => ProvidersRepoImpl(),
        ),
        ProxyProvider<ProvidersRepoImpl, ProvidersViewmodel>(
          update: (_, providerImpl, __) => ProvidersViewmodel(providerImpl),
        ),
        Provider<PartnerConsentsRepoImpl>(
          create: (_) => PartnerConsentsRepoImpl(),
        ),
        ProxyProvider<PartnerConsentsRepoImpl, PartnerConsentsViewmodel>(
          update: (_, partnerConsentsImpl, __) => PartnerConsentsViewmodel(partnerConsentsImpl),
        ),
        Provider<CustomersRepoImpl>(
          create: (_) => CustomersRepoImpl(),
        ),
        ProxyProvider<CustomersRepoImpl, CustomersViewmodel>(
          update: (_, customerImpl, __) => CustomersViewmodel(customerImpl),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
        home: const Dashboard(),
        // Change here the home widget to see the different screens
    );
  }
}