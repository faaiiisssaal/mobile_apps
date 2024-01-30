import 'package:flutter/material.dart';
import 'data.dart';

class Comp extends StatelessWidget {
  final Policies jsonData;

  const Comp({super.key, required this.jsonData});

  @override
  Widget build(BuildContext context) {
    List<Widget> detailCards = [];

    for (Policy policy in jsonData.policies) {
      for (InsuranceDataPage detail in policy.details) {
        Widget card = Card(
          margin: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text('Policy No: ${policy.policyNo}'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name: ${detail.name}'),
                    Text('EP: ${detail.effective}'),
                    Text('AM: ${detail.memberactive}'),
                    Text('P: ${detail.plan}'),
                    Text('TNC: ${detail.terms}'),
                    Text('FP: ${detail.policyfee}'),
                  ],
                ),
              ),
            ],
          ),
        );

        detailCards.add(card);
      }
    }

    return SingleChildScrollView(
      child: Column(
        children: detailCards,
      ),
    );
  }
}
