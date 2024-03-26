import 'package:flutter/material.dart';
import 'package:healthcareapp/common/constant.dart';
import 'package:healthcareapp/common/custom_expansion_tile.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:healthcareapp/domain/entities/peserta/provider_location.dart';

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
  int? iP;
  int? oP;
  int? dT;
  int? mA;

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
    iP = widget.card.ip;
    oP = widget.card.op;
    dT = widget.card.dt;
    mA = widget.card.ma;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: horiverti(10, 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            color: kDarkGrey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: CustomExpansionTile(
          headerBackgroundColor: kSkyBlue,
          leading: Container(
            padding: vertical(10),
            child: GestureDetector(
              onTap: () {
                _launchUrl(nameText!);
              },
              child: Image.asset("asset/address.png", )
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nameText ?? '-',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: kPureBlack,
                ),
              ),
              Text(
                addressText ?? '-',
                style: const TextStyle(
                  fontSize: 10,
                  color: kPureBlack,
                ),
              ),
            ],
          ),
          children: <Widget>[
            Container(
              color: kPureWhite,
              padding: horiverti(10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Jenis layanan: ",
                    style: TextStyle(fontSize: 10),
                  ),
                  hp10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          padding: vertical(2.5),
                          decoration: BoxDecoration(
                            color: iP == 1 ? kPureGreen : kPureRed,
                            borderRadius: const BorderRadius.all(Radius.circular(5)),
                            boxShadow: [
                              BoxShadow(
                                color: kDarkGrey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Center(
                              child: Text(
                                "Rawat Inap",
                                style: TextStyle(
                                    color: iP == 1 ? kPureBlack : kPureWhite,
                                    fontSize: 12
                                ),
                              )),
                        ),
                      ),
                      wp10,
                      Expanded(
                        child: Container(
                          padding: vertical(2.5),
                          decoration: BoxDecoration(
                            color: oP == 1 ? kPureGreen : kPureRed,
                            borderRadius: const BorderRadius.all(Radius.circular(5)),
                            boxShadow: [
                              BoxShadow(
                                color: kDarkGrey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Center(
                              child: Text(
                                "Rawat Jalan",
                                style: TextStyle(
                                    color: oP == 1 ? kPureBlack : kPureWhite,
                                    fontSize: 12
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                  hp10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          padding: vertical(2.5),
                          decoration: BoxDecoration(
                            color: dT == 1 ? kPureGreen : kPureRed,
                            borderRadius: const BorderRadius.all(Radius.circular(5)),
                            boxShadow: [
                              BoxShadow(
                                color: kDarkGrey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Center(
                              child: Text(
                                "Gigi",
                                style: TextStyle(
                                    color: dT == 1 ? kPureBlack : kPureWhite,
                                    fontSize: 12
                                ),
                              )),
                        ),
                      ),
                      wp10,
                      Expanded(
                        child: Container(
                          padding: vertical(2.5),
                          decoration: BoxDecoration(
                            color: mA == 1 ? kPureGreen : kPureRed,
                            borderRadius: const BorderRadius.all(Radius.circular(5)),
                            boxShadow: [
                              BoxShadow(
                                color: kDarkGrey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Center(
                              child: Text(
                                "Bersalin",
                                style: TextStyle(
                                  color: mA == 1 ? kPureBlack : kPureWhite,
                                    fontSize: 12
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


// @override
  // Widget build(BuildContext context) {
  //   return CustomExpansionTile(
  //     title: Container(
  //       padding: const EdgeInsets.all(10),
  //       decoration: BoxDecoration(
  //         color: kSkyBlue,
  //         borderRadius: const BorderRadius.all(Radius.circular(10)),
  //         boxShadow: [
  //           BoxShadow(
  //             color: kDarkGrey.withOpacity(0.5),
  //             spreadRadius: 2,
  //             blurRadius: 7,
  //             offset: const Offset(0, 3),
  //           ),
  //         ],
  //       ),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Row(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Expanded(
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Text(
  //                       nameText ?? '-',
  //                       style: const TextStyle(
  //                         fontSize: 14,
  //                         fontWeight: FontWeight.bold,
  //                         color: kPureWhite,
  //                       ),
  //                     ),
  //                     const SizedBox(height: 5),
  //                     Text(
  //                       addressText ?? '-',
  //                       style: const TextStyle(
  //                         fontSize: 10,
  //                         color: kPureWhite,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               ElevatedButton(
  //                 onPressed: () {
  //                   _launchUrl(nameText!);
  //                 },
  //                 style: ElevatedButton.styleFrom(
  //                   backgroundColor: kPureWhite,
  //                   padding: const EdgeInsets.symmetric(vertical: 10),
  //                   shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(10),
  //                   ),
  //                 ),
  //                 child: Container(
  //                   padding: horizontal(10),
  //                   child: const Text(
  //                     'Maps\nHere',
  //                     style: TextStyle(
  //                       color: kPureRed,
  //                       fontSize: 12,
  //                       fontWeight: FontWeight.bold,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //     headerBackgroundColor: kSkyBlue,

  //   );
  // }
}
