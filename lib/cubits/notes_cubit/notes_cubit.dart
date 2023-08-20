import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/models/note_model.dart';

import '../../constants.dart';
part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit():super(NoteInitial());
  static NotesCubit get(context)=> BlocProvider.of(context);


   List<NoteModel>? notes;
  fetchAllNotes()async{
      var noteBox = Hive.box<NoteModel>(kNotesBox);
      notes=noteBox.values.toList();
      emit(NoteSuccess());
  }

}
