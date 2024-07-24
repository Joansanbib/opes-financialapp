import 'package:banking_project/domain/entities/partner_consent.dart';
import 'package:banking_project/viewmodels/partner_consents_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class PartnerConsents extends StatefulWidget {
  const PartnerConsents({super.key});

  @override
  State<StatefulWidget> createState() => _PartnerConsentsState();
}

class _PartnerConsentsState extends State<PartnerConsents> {
  List<PartnerConsent>? partnerConsents = [];
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
    Provider.of<PartnerConsentsViewmodel>(context, listen: false);
    var result = await providerVM.getPartnerConsents();
    if (result is List<PartnerConsent>) {
      partnerConsents = result;
    }else{
      error = result;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Partner Consents')),
        body: SingleChildScrollView(
            child: Column(
          children: [
             if (partnerConsents != null)
                ...partnerConsents!.map((consent) => Text('${consent.id!}, ${consent.connectionId},  ${consent.customerId}, ${consent.status},  ${consent.revokedBy}, ${consent.revokedAt}, ${consent.createdAt}, ${consent.updatedAt}  '))
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
