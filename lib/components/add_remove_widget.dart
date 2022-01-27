import 'package:flutter/material.dart';
import 'package:my_shop/ressources/strings.dart';

class AddRemoveWidget extends StatelessWidget {


  final VoidCallback pressPlusButton;
  final VoidCallback pressMinusButton;
  final String quantityToDisplay;

  const AddRemoveWidget({
    Key? key,
    required this.pressPlusButton,
    required this.pressMinusButton,
    required this.quantityToDisplay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.grey
                ),
                shape: BoxShape.circle
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(
                  Icons.remove,
                  size: 15,
                  color: Colors.grey
              ),
              onPressed: pressMinusButton,
            ),
          ),
        ),
        Expanded(
          child: Text(
          quantityToDisplay,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: (quantityToDisplay == Strings.maxItems) ? Colors.red : Colors.black
          )
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.grey
                ),
                shape: BoxShape.circle,
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.add,
                size: 15,
                color: Colors.grey,
              ),
              onPressed: pressPlusButton,
            ),
          ),
        ),
      ],
    );
  }
}