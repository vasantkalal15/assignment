import 'package:flutter/material.dart';

class CustomSwitchButton extends StatelessWidget {
  final bool? isEmailSelected;
  final Function(bool) onChanged;
  final Key? key;

  const CustomSwitchButton({
    this.key,
    required this.isEmailSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isEmailSelected != null) {
          onChanged(!isEmailSelected!);
        }
      },
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: isEmailSelected ?? false ? Colors.green : Colors.black38,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  isEmailSelected == false ? 'Phone' : '',
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        isEmailSelected == false ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  isEmailSelected == true ? 'Email' : '',
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        isEmailSelected == true ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
