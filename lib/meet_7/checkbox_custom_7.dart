import 'package:flutter/widgets.dart';

class CheckBoxCustom7 extends StatefulWidget {
  const CheckBoxCustom7({super.key});
  final bool? valueCheck;

  @override
  State<CheckBoxCustom7> createState() => _CheckBoxCustom7State();
}

class _CheckBoxCustom7State extends State<CheckBoxCustom7> {
  bool valueCheck = false;
  @override
  void initState() {
    valueCheck = widget.valueCheck ?? false;
    super.initState();
  }
@override
  Widget build(BuildContext context) {
    return Row(
      

    );
  }
}
