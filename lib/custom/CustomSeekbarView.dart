import 'package:flutter/material.dart';

class CustomSeekbarview extends StatelessWidget {

  double valueHolder;
  double min;
  double max;
  int divisions;
  Function(double) onChanged;
  Function(double) semanticFormatterCallback;

  CustomSeekbarview(this.valueHolder,{this.min,this.max,this.divisions,this.onChanged,this.semanticFormatterCallback});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Slider(
          value: valueHolder!=null ? valueHolder.toDouble() : 1,
          min: min,
          max: max,
          divisions: divisions,
          activeColor: Colors.white,
          inactiveColor: Colors.black,
          label: '${valueHolder.round()}',
          onChanged: onChanged,
          semanticFormatterCallback: semanticFormatterCallback
      ),
    );
  }
}
