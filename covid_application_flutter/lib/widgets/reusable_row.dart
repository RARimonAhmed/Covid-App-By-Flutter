import 'package:flutter/material.dart';

class ReusableRow extends StatelessWidget {
  String title, values;
  ReusableRow({super.key, required this.title, required this.values});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, bottom: 5, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(values),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Divider(
            color: Colors.red.withOpacity(0.03),
          ),
        ],
      ),
    );
  }
}
