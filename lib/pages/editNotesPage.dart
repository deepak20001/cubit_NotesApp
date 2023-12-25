// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/notesCubit.dart';

class EditNotesPage extends StatelessWidget {
  const EditNotesPage({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    final editNotesCubit = BlocProvider.of<NotesCubit>(context);

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: editNotesCubit.formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    "EDIT YOUR \nNOTES",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextFormField(
                    controller: editNotesCubit.titleController,
                    validator: editNotesCubit.titleValidator,
                    decoration: InputDecoration(
                      hintText: editNotesCubit.notes[index].title,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: editNotesCubit.detailController,
                    validator: editNotesCubit.detailValidator,
                    minLines: 3,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: editNotesCubit.notes[index].detail,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 40),
                  MaterialButton(
                    color: Colors.amber,
                    minWidth: double.infinity,
                    onPressed: () {
                      editNotesCubit.updateNote(index);
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        "UPDATE",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
