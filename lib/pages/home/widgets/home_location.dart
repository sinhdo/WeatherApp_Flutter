import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeLocation extends StatelessWidget {

  final nameLocation;
  @override
  Widget build(BuildContext context) {
    final df = DateFormat('dd-MM-yyyy');
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/icons/location.png'),
            SizedBox(width: 10),
            Text(
              nameLocation.toString(),
              style: TextStyle(fontSize: 28, color: Colors.white),
            ),
          ],
        ),
        SizedBox(height: 17),
        Text(
          df.format(DateTime.now()),
          style: TextStyle(
            fontSize: 28,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  HomeLocation({required this.nameLocation});
}
