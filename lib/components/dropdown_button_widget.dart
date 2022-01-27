import 'package:flutter/material.dart';
import 'package:my_shop/ressources/theme.dart';

class dropdown_button_widget extends StatefulWidget {

  final List<int> sizes;

  final Color backgroundColor;

  const dropdown_button_widget({
    Key? key,
    required this.backgroundColor,
    required this.sizes,
  }) : super(key: key);

  @override
  State<dropdown_button_widget> createState() => _dropdown_button_widgetState();
}

class _dropdown_button_widgetState extends State<dropdown_button_widget> {

  String? _selectedSize;
  @override

  Widget build(BuildContext context) {

    final List<int> sizes = widget.sizes;
    final List<String> stringSizes = [...sizes.map((size) => size.toString())];


    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(30)
      ),
      padding: const EdgeInsets.symmetric(
          vertical: 2,
          horizontal: 20
      ),
      child: DropdownButton(
          value: _selectedSize,
          isExpanded: true,
          alignment: AlignmentDirectional.centerEnd,
          hint: const Text(
              "Sizes",
              style: TextStyle(
                  color: TEXT_COLOR
              )
          ),
          underline: Container(),
          icon: Icon(
            Icons.arrow_drop_down,
            color: widget.backgroundColor,
          ),
          items: stringSizes.map(buildMenuItem).toList(),
          onChanged: (selectedSize) => setState(() => this._selectedSize = selectedSize.toString()),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String size) =>
      DropdownMenuItem(
        value: size,
        child: Text(
          size,
          style: const TextStyle(
            color: TEXT_COLOR,
            fontWeight: FontWeight.bold
          )
        )
      );
}

