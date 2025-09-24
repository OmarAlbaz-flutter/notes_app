import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_text_form_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CustomTextFormField(
            hintText: "Text",
            maxLines: 1,
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            hintText: 'Content',
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
