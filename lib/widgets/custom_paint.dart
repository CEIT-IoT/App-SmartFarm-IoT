import 'package:app_iot/widgets/circleprogress.dart';
import 'package:flutter/material.dart';

class CustomPaintCircleProgress extends StatefulWidget {
  final double? value;
  final String? textvalue;
  final String? title;
  final String? symbol;
  final bool ues;
  const CustomPaintCircleProgress(
      {Key? key,
      required this.value,
      required this.title,
      required this.symbol,
      required this.ues,
      this.textvalue})
      : super(key: key);

  @override
  State<CustomPaintCircleProgress> createState() =>
      _CustomPaintCircleProgressState();
}

class _CustomPaintCircleProgressState extends State<CustomPaintCircleProgress> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: CircleProgress(widget.value!, widget.ues),
      child: SizedBox(
        width: 200,
        height: 200,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text('ອຸ່ນຫະພູມ'),
              Text(
                "2",
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
