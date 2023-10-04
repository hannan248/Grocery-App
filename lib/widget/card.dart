import 'package:flutter/material.dart';

import '../model/grocery.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.grocery});

  final Grocery grocery;

//(final Grocery grocery;) that is used to share our card view
// that we want to show in list builder in grocery list view file.
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Name: ${grocery.name}',
                  style:
                      const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const Spacer(),
                Text(
                  '${grocery.amount} \$',
                  style:
                      const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Quantity ${grocery.quantity}',
                  style:
                      const TextStyle( fontSize: 16),
                ),
                const Spacer(),
                Text(
                  'Type: ${grocery.type}',
                  style:
                      const TextStyle( fontSize: 16),
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  grocery.formattedDate,
                  style:
                      const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
