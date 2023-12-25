// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/notes_model.dart';

class NotesState {
  final List<Notes>? notes;

  NotesState({
    this.notes,
  });
}

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesState());

  final titleController = TextEditingController();
  final detailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  List<Notes> notes = [];

  void submit() {
    if (formKey.currentState!.validate()) {
      notes.add(
        Notes(
          title: titleController.text,
          detail: detailController.text,
        ),
      );
      emit(NotesState(notes: notes));
      titleController.clear();
      detailController.clear();
    }
  }

  void deleteNote(int index) {
    notes.removeAt(index);
    emit(NotesState(notes: notes));
  }

  void updateNote(int index) {
    if (titleController.text.isEmpty) {
      titleController.text = notes[index].title!;
    }
    if (detailController.text.isEmpty) {
      detailController.text = notes[index].detail!;
    }
    notes[index].title = titleController.text;
    notes[index].detail = detailController.text;
    emit(NotesState(notes: notes));

    titleController.clear();
    detailController.clear();
  }

  String? titleValidator(String? value) {
    if (value!.isEmpty) {
      return "Please Enter title!";
    } else {
      return null;
    }
  }

  String? detailValidator(String? value) {
    if (value!.isEmpty) {
      return "Please Enter detail!";
    } else {
      return null;
    }
  }
}
