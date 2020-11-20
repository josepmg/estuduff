import 'package:estuduff/core/resource/colors_estuduff.dart';
import 'package:estuduff/core/resource/dimensions.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

class DropDownEstudUff extends StatefulWidget {
  final List<String> options;
  final String placeholder;
  //final bool isRequired;
  final Function onSelected;

  const DropDownEstudUff({
    Key key,
    @required this.options,
    @required this.placeholder,
    this.onSelected,
    //  @required this.isRequired
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _DropDownEstudUffState();
  }
}

class _DropDownEstudUffState extends State<DropDownEstudUff> {
  String dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: Dimensions.getEdgeInsets(context, bottom: 28),
        child: FormField<String>(
          // TO-DO: Validator
          builder: (FormFieldState<String> state) {
            return InputDecorator(
              decoration: InputDecoration(
                  errorStyle: TextStyle(
                      color: Colors.redAccent,
                      fontSize: Dimensions.getTextSize(16.0, context)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(color: ColorsEstudUff.lightGrey))),
              isEmpty: dropdownValue == '',
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: Text(widget.placeholder),
                  value: dropdownValue,
                  isDense: true,
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                      state.didChange(newValue);
                    });
                  },
                  items: widget.options.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            );
          },
        ));
  }
}
