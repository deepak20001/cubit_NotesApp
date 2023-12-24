import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/notesCubit.dart';

class AddNotesPage extends StatelessWidget {
  const AddNotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final addNotesCubit = BlocProvider.of<NotesCubit>(context);

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: addNotesCubit.formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    "ENTER YOUR \nNOTES",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextFormField(
                    controller: addNotesCubit.titleController,
                    validator: addNotesCubit.titleValidator,
                    decoration: const InputDecoration(
                      hintText: "Enter title",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: addNotesCubit.detailController,
                    validator: addNotesCubit.detailValidator,
                    minLines: 3,
                    maxLines: null,
                    decoration: const InputDecoration(
                      hintText: "Enter detail",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 40),
                  MaterialButton(
                    color: Colors.amber,
                    minWidth: double.infinity,
                    onPressed: () {
                      addNotesCubit.submit();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        "SAVE",
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
