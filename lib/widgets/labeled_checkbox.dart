import 'package:flutter/material.dart';

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    Key? key,
    required this.label,
    required this.padding,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Checkbox(
              activeColor: Colors.orange,
              checkColor: Colors.black,
              value: value,
              onChanged: (bool? newValue) {
                if (newValue != null) {
                  onChanged(newValue);
                }
              },
            ),
            Expanded(child: Text(label)),
          ],
        ),
      ),
    );
  }
}
