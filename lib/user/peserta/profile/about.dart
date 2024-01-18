import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Text(
                      "Sejarah PT. Abadi SmiLynks"
                          "\n\n"
                          "PT. Abadi SmiLynks yang dikenal dengan SmiLynks berdiri sejak tanggal 2 Oktober 2009 untuk memberikan bantuan dalam bidang administrasi pelayanan kesehatan yang profesional dalam bidangnya dan didukung dengan jaringan pelayanan kesehatan yang terkoordinasi secara baik dan luas."
                          "\n\n"
                          "Seperti motto kami :"
                          "\n\n"
                          "  “Healthcare Management at Your Fingertips” "
                          "\n\n"
                          "SmiLynks disiapkan untuk menjadi Rekan yang dapat dipercaya dan diandalkan (as your Trusted Partner) dalam membantu perusahaan asuransi maupun perusahaan untuk mengadministrasikan biaya pelayanan kesehatan (Trusted Administration) yang menjadi hak masing – masing peserta maupun Karyawan dari perusahaan."
                          "\n\n"
                          "SmiLynks berkomitmen untuk memberikan yang terbaik kepada peserta asuransi maupun kepada karyawan perusahaan dengan sistem Reimbursement dan sistem Provider yang didukung oleh Rumah Sakit maupun Klinik di seluruh wilayah Indonesia.",
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Text(
                      "Visi"
                          "\n\n"
                          "“Menjadi Perusahaan Jasa Administrasi Pelayanan Kesehatan yang terbaik di Indonesia”"
                          "\n\n"
                          "Dengan visi tersebut, maka SmiLynks akan menjadi Rekan Administrasi Pelayanan Kesehatan yang Terbaik bagi Perusahaan Umum, "
                          "Perusahaan Asuransi dan menjadi mitra yang dapat dipercaya oleh Pemberi Pelayanan kesehatan yang menjadi Provider kami.",
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Text(
                      "Misi"
                          "\n\n"
                          "1. Menyediakan Jasa Administrasi Pelayanan Kesehatan yang lebih baik dan terkendali dengan mengutamakan keakuratan data."
                          "\n\n"
                          "2. Menjadi mitra yang dapat dipercaya dan diandalkan baik bagi Perusahaan Asuransi, Perusahaan maupun bagi Pemberi Pelayanan Kesehatan yang menjadi Provider."
                          "\n\n"
                          "3. Membangun Sistem Informasi yang akurat dengan teknologi informasi yang disesuai dengan kebutuhan terkini",
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        Placeholder(
                          fallbackWidth: MediaQuery.of(context).size.width * 0.35,
                          child:
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: Image.asset(
                              "asset/office.jpg",
                              fit: BoxFit.fill,
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Expanded(
                            child: Text(
                              "About Us"
                                  "\n\n"
                                  "Smilynks"
                                  "\n"
                                  "Jl. Pluit Kencana Raya No. 85A"
                                  "\n"
                                  "Jakarta Utara, 14450, Indonesia"
                                  "\n"
                                  "Telp : +62 21 6624399 (ext 22/33)"
                                  "\n"
                                  "Fax : +62 21 6624299"
                                  "\n"
                                  "Email : alarmcenter.1@smilynks.co.id",
                              style: TextStyle(fontSize: 13),
                              textAlign: TextAlign.left,
                            )
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          )
      ),
    );
  }
}
