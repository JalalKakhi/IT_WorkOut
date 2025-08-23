import 'package:IT_workout/IT_workout/shared/combonents/combontents.dart';
import 'package:flutter/material.dart';

class DatePickerScreen extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final VoidCallback onTap;

  const DatePickerScreen({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    required this.onTap,
  });

  @override
  State<DatePickerScreen> createState() => _DatePickerScreenState();
}

class _DatePickerScreenState extends State<DatePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.grey, fontFamily: 'Roboto')),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    inputDecorationTheme: InputDecorationTheme(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: widget.onTap,
                    child: AbsorbPointer(
                      child: defultTextFormField(
                          controlar: widget.controller,
                          labelText: widget.hintText,
                          isObscure: false,
                          colors: Colors.black,
                          textInputType: TextInputType.datetime,
                          validate: (String? p1) {}),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Container(
              width: 100, // Maintains alignment with unit dropdowns
            ),
          ],
        ),
      ],
    );
  }
}
