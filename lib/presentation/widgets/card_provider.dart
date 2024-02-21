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

  String? areaText;
  String? nameText;
  String? descText;

  @override
  void initState() {
    super.initState();
    areaText = widget.card.area;
    nameText = widget.card.name;
    descText = widget.card.description;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: paddingall(10),
      color: kLightBlue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              areaText ?? '-'
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
