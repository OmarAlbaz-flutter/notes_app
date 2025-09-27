import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/color_edit_listview.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_form_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          CustomAppBar(
            onTap: () {
              widget.noteModel.title = title ?? widget.noteModel.title;
              widget.noteModel.subTitle = content ?? widget.noteModel.subTitle;
              widget.noteModel.save();
              Navigator.pop(context);
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "Success Edit",
                  ),
                ),
              );
            },
            text: "Edit Note",
            icon: Icons.check,
          ),
          SizedBox(
            height: 50,
          ),
          CustomTextFormField(
            onChanged: (value) {
              title = value;
            },
            hintText: widget.noteModel.title,
          ),
          SizedBox(
            height: 15,
          ),
          CustomTextFormField(
            onChanged: (value) {
              content = value;
            },
            hintText: widget.noteModel.subTitle,
            maxLines: 5,
          ),
          SizedBox(
            height: 10,
          ),
          EditNoteColorsList(
            noteModel: widget.noteModel,
          ),
        ],
      ),
    );
  }
}
