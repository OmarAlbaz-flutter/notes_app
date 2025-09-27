import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/colors_listview.dart';
import 'package:notes_app/views/widgets/custom_button.dart';
import 'package:notes_app/views/widgets/custom_text_form_field.dart';

class AddNotesForm extends StatefulWidget {
  const AddNotesForm({
    super.key,
  });

  @override
  State<AddNotesForm> createState() => _AddNotesFormState();
}

class _AddNotesFormState extends State<AddNotesForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextFormField(
            onSaved: (value) {
              title = value;
            },
            hintText: "Title",
            maxLines: 1,
          ),
          SizedBox(
            height: 15,
          ),
          CustomTextFormField(
            onSaved: (value) {
              subTitle = value;
            },
            hintText: 'Content',
            maxLines: 5,
          ),
          SizedBox(
            height: 50,
          ),
          ColorsListView(),
          SizedBox(
            height: 10,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return addNoteButton(state, context);
            },
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  CustomButton addNoteButton(AddNoteState state, BuildContext context) {
    return CustomButton(
      isLoading: state is AddNoteLoading ? true : false,
      onTap: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          var currentDate = DateTime.now();
          var formattedDate = DateFormat('yyyy-MM-dd').format(currentDate);
          var noteModel = NoteModel(
            color: Colors.lightBlueAccent.toARGB32(),
            date: formattedDate,
            subTitle: subTitle!,
            title: title!,
          );
          BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
        } else {
          autovalidateMode = AutovalidateMode.always;
          setState(() {});
        }
      },
      centerText: 'Add',
    );
  }
}
