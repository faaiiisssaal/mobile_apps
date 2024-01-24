import 'package:flutter/material.dart';
import 'package:helathcareapp/feature/common/constant.dart';
import 'package:intl/intl.dart';

class ForgotMemberSection extends StatefulWidget {
  const ForgotMemberSection({super.key});

  @override
  State<ForgotMemberSection> createState() => _ForgotMemberSectionState();
}

class _ForgotMemberSectionState extends State<ForgotMemberSection> {
  final TextEditingController _memberforgotController = TextEditingController();

  void _showCalendar(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900, 1, 1),
      lastDate: DateTime.now(),
    );

    if (selectedDate != null) {
      setState(() {
        _memberforgotController.text = DateFormat('yyyy-M-dd').format(selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            padding: paddingall(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: mediaheight(0.2, context),
                ),
                const SizedBox(
                    child: Text(
                  "Recovery\nAccount",
                  style: TextStyle(fontSize: 36),
                )),
                c10,
                SizedBox(
                    height: mediaheight(0.05, context),
                    child: const Text("Enter your DoB for verifying your account")),
                GestureDetector(
                  onTap: () async {
                    _showCalendar(context);
                  },
                  child: AbsorbPointer(
                    child: TextFormField(
                      controller: _memberforgotController,
                      decoration: const InputDecoration(
                        hintText: 'Date of Birth',
                        prefixIcon: Icon(Icons.date_range_outlined),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                c10,
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("Send"),
                )
              ],
            ),
          ),
        )
    );
  }
}
