import 'package:absensi_app/src/theme/colors.dart';
import 'package:flutter/material.dart';

class OutletForm extends StatefulWidget {
  const OutletForm({this.textEditingController, super.key});
  final TextEditingController? textEditingController;
  @override
  State<OutletForm> createState() => _OutletFormState();
}

class _OutletFormState extends State<OutletForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      padding: (const EdgeInsets.symmetric(horizontal: 24)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Stok Awal",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 4),
          // Container(
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(10),
          //   ),
          //   child: TextFormField(
          //     controller: widget.textEditingController,
          //     keyboardType: TextInputType.number,
          //     decoration: InputDecoration(
          //       hintText: "0",
          //       hintStyle: const TextStyle(
          //         fontSize: 12,
          //         fontWeight: FontWeight.w400,
          //         color: XAppColors.grey,
          //       ),
          //       border: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(10.0),
          //         borderSide: const BorderSide(
          //           color: XAppColors.grey,
          //         ),
          //       ),
          //       contentPadding: const EdgeInsets.only(
          //           left: 15, bottom: 5, top: 5, right: 15),
          //     ),
          //     readOnly: false,
          //   ),
          // ),
        ],
      ),
    );
  }
}
