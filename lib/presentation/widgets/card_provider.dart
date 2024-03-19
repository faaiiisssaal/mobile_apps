import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helathcareapp/common/constant.dart';
import 'package:helathcareapp/domain/entities/provider_location.dart';
import 'package:url_launcher/url_launcher.dart';

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
  String? notelpText;
  String? addressText;

  late Uri _url;

  Future<void> _launchUrl(String nameText) async {
    _url = Uri.parse('https://www.google.com/maps?q=$nameText');

    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }


  @override
  void initState() {
    super.initState();
    idText = widget.card.id;
    nameText = widget.card.name;
    descText = widget.card.description;
    addressText = widget.card.address;
    notelpText = widget.card.notelp;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: paddingall(10),
      margin: marginall(10),
      decoration: const BoxDecoration(
        color: kSkyBlue,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              nameText ?? '-',
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold
            ),
          ),
          hp10,
          Text(
              addressText ?? '-',
            style: const TextStyle(
              fontSize: 12
            ),
          ),
          hp10,
          Row(
            children: [
              Expanded(
                child: Text(
                    "$descText",
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  maxLines: 2,
                ),
              ),
            ],
          ),
          hp10,
          Text(
              notelpText ?? '-'
          ),
          ElevatedButton(
            onPressed: () {
              _launchUrl(nameText!);
            },
            child: const Text('Maps Here'),
          ),
        ],
      ),
    );
  }
}

