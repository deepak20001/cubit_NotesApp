import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNotesCubit extends Cubit<String> {
  AddNotesCubit() : super("start");

  final titleController = TextEditingController();
  final detailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void submit() {
    if (formKey.currentState!.validate()) {
      debugPrint(titleController.text);
    }
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
