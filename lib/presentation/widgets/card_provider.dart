import 'package:flutter/cupertino.dart';
import 'package:helathcareapp/domain/entities/provider_location.dart';

class ProvLoc extends StatefulWidget {
  final ProviderLocation card;

  const ProvLoc({super.key, required this.card});

  @override
  State<ProvLoc> createState() => _ProvLocState();
}

class _ProvLocState extends State<ProvLoc> {

  @override
  Widget build(BuildContext context) {
    return Text(
        widget.card.description ?? '-'
    );
  }
}
