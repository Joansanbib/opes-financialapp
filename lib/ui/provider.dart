import 'package:banking_project/viewmodels/provider_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:banking_project/domain/entities/provider.dart';


class ProviderUI extends StatefulWidget {
  const ProviderUI({super.key});

  @override
  State<StatefulWidget> createState() => _ProviderState();
}

class _ProviderState extends State<ProviderUI> {
  List<Providers>? providersAll = [];
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
    Provider.of<ProviderViewmodel>(context, listen: false);
    var result = await providerVM.getProviders();
    if (result is List<Providers>) {
      providersAll = result;
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
             if (providersAll != null)
                ...providersAll!.map((provider) => Text('${provider.id!}, ${provider.code!}, ${provider.name}, ${provider.modes!}, ${provider.status}, ${provider.automaticFetch}, ${provider.dynamicRegistrationCode}, ${provider.groupCode}, ${provider.groupName}, ${provider.hub}, ${provider.customerNotifiedOnSignIn}, ${provider.interactive}, ${provider.instruction}, ${provider.homeUrl}, ${provider.loginUrl}, ${provider.logoUrl}, ${provider.countryCode}, ${provider.refreshTimeout}, ${provider.holderInfo}, ${provider.maxConsentDays}, ${provider.createdAt}, ${provider.updatedAt}, ${provider.timezone}, ${provider.maxInteractiveDelay}, ${provider.optionalInteractivity}, ${provider.regulated}, ${provider.maxFetchInterval}, ${provider.customPendings}, ${provider.customPendingsPeriod}, ${provider.supportedFetchScopes}, ${provider.supportedAccountExtraFields}, ${provider.supportedTransactionExtraFields}, ${provider.supportedAccountNatures}, ${provider.supportedAccountTypes}, ${provider.identityCodes}, ${provider.bigCodes}, ${provider.supportedIframeEmbedding}, ${provider.paymentTemplates}, ${provider.supportedPaymentFields}, ${provider.requiredPaymentFields}, ${provider.noFundsRejectionSupported}')).toList()
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
