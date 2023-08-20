import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit():super(AddNoteInitial());
  Color color = const Color(0xffcb7014);

  addNote(NoteModel noteModel) async {
    noteModel.color=color.value;
    emit(AddNoteLoading());
    try {
      var noteBox = Hive.box<NoteModel>(kNotesBox);
      await noteBox.add(noteModel);
      emit(AddNoteSuccess());
    } catch (error) {
     emit( AddNoteFailure(error.toString()));
    }
  }
}
