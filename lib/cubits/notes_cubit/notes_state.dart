part of 'notes_cubit.dart';
//! cubit → logic , state → UI changing
@immutable
sealed class NotesState {}


final class NotesInitial extends NotesState {}
//  final class NotesLoading extends NotesState {}

 final class NotesSuccess extends NotesState {}
//   final List<NoteModel> notes; //? to send it with state

//   NotesSuccess(this.notes);
// }

// final class NotesFailure extends NotesState {
//   final String errMessage;
//   NotesFailure(this.errMessage);
// }

