import 'package:app_iot/widgets/circleprogress.dart';
import 'package:flutter/material.dart';

class CustomPaintCircleProgress extends StatelessWidget {
  final double? value;
  final String? title;
  final String? symbol;
  final bool ues;
  const CustomPaintCircleProgress(
      {Key? key,
      required this.value,
      required this.title,
      required this.symbol,
      required this.ues})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: CircleProgress(value!, ues),
      child: SizedBox(
        width: 200,
        height: 200,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text('ອຸ່ນຫະພູມ'),
              Text(
                ' 25',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              Text(
                '°C',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
