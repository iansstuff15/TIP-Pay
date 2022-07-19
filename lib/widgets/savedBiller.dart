import 'package:flutter/material.dart';

import 'biller_list_item.dart';

class SavedBiller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(
        height: 20,
      ),
      const Text(
        'Saved Billers',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      const SizedBox(
        height: 10,
      ),
      SizedBox(
          height: 120,
          width: double.infinity,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) => BillerListItem(),
              // ignore: prefer_const_constructors
              separatorBuilder: (context, index) => SizedBox(
                    width: 10,
                  ),
              itemCount: 5))
    ]));
  }
}
