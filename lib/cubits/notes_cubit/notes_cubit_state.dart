part of 'notes_cubit_cubit.dart';

abstract class NotesStates {}

final class NotesInitial extends NotesStates {}

final class NotesLoading extends NotesStates {}

final class NotesSuccess extends NotesStates {
  final List<NoteModel> notes;

  NotesSuccess(
    this.notes,
  );
}

final class NotesFailure extends NotesStates {
  final String errMessage;

  NotesFailure(
    this.errMessage,
  );
}
