import 'package:flutter/cupertino.dart';
import 'package:helathcareapp/common/constant.dart';
import 'package:helathcareapp/domain/entities/provider_location.dart';

class ProvLoc extends StatefulWidget {
  final ProviderLocation card;

  const ProvLoc({super.key, required this.card});

  @override
  State<ProvLoc> createState() => _ProvLocState();
}

class _ProvLocState extends State<ProvLoc> {

  String? idText;
  String? nameText;
  String? descText;
  String? prodtypeText;
  String? addressText;

  @override
  void initState() {
    super.initState();
    idText = widget.card.id;
    nameText = widget.card.name;
    descText = widget.card.description;
    prodtypeText = widget.card.producttype;
    addressText = widget.card.address;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: paddingall(10),
      color: kLightBlack,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              idText ?? '-'
          ),
          Text(
              idText ?? '-'
          ),
          Text(
              idText ?? '-'
          ),
          hp10,
          Row(
            children: [
              Expanded(
                child: Text(
                    "$nameText - $descText",
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
