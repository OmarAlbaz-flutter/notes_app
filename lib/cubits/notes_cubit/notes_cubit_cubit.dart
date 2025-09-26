import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'notes_cubit_state.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(NotesInitial());

  fetchAllNotes() {
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      emit(
        NotesSuccess(
          notesBox.values.toList(),
        ),
      );
    } catch (e) {
      emit(
        NotesFailure(
          e.toString(),
        ),
      );
    }
  }
}
