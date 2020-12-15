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
  var dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: Dimensions.getEdgeInsets(context, bottom: 28),
      child: FormField<String>(
        // TODO: Validator
        builder: (FormFieldStatestate) {
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
              child: DropdownButton(
                hint: Text(widget.placeholder),
                value: dropdownValue,
                isDense: true,
                onChanged: (newValue) {
                  setState(() {
                    dropdownValue = newValue;
                    widget.onSelected(newValue);
                  });
                },
                items: widget.options.map((value) {
                  return DropdownMenuItem(
                    value: widget.options.indexOf(value),
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
