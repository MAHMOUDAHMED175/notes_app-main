import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';

import 'add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteSuccess) {
            NotesCubit.get(context).fetchAllNotes();
            Navigator.pop(context);
          }
          // if (state is AddNoteFailure) {
          //   ScaffoldMessenger.of(context)
          //       .showSnackBar(SnackBar(content: Text(state.errorMessage)));
          // }
        },

        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: MediaQuery
                      .of(context)
                      .viewInsets
                      .bottom),
              child: const SingleChildScrollView(child: AddNoteForm()),
            ),
          );
        },
      ),
    );
  }
}