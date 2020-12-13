import 'package:estuduff/core/resource/colors_estuduff.dart';
import 'package:estuduff/core/resource/dimensions.dart';
import 'package:estuduff/features/program/domain/entity/program.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

class ProgramDropDownEstudUff extends StatefulWidget {
  final List<Program> options;
  final String placeholder;
  //final bool isRequired;
  final Function onSelected;

  const ProgramDropDownEstudUff({
    Key key,
    @required this.options,
    @required this.placeholder,
    this.onSelected,
    //  @required this.isRequired
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _ProgramDropDownEstudUffState();
  }
}

class _ProgramDropDownEstudUffState extends State<ProgramDropDownEstudUff> {
  int dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: Dimensions.getEdgeInsets(context, top: 20),
        child: FormField<String>(
          // TO-DO: Validator
          builder: (FormFieldState<String> state) {
            return InputDecorator(
              decoration: InputDecoration(
                errorStyle: TextStyle(
                  color: Colors.redAccent,
                  fontSize: Dimensions.getTextSize(16.0, context),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide:
                      BorderSide(color: ColorsEstudUff.lightGrey, width: 1.0),
                ),
              ),
              isEmpty: dropdownValue == '',
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  hint: Text(widget.placeholder),
                  value: dropdownValue,
                  isDense: true,
                  onChanged: (newValue) {
                    setState(() {
                      dropdownValue = newValue;
                      state.didChange(newValue);
                    });
                  },
                  items: widget.options.map((program) {
                    return DropdownMenuItem(
                      value: program.id,
                      child: Text("${program.name}"),
                    );
                  }).toList(),
                ),
              ),
            );
          },
        ));
  }
}
