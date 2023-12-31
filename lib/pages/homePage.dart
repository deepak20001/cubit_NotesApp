import 'package:cubit_notes_app/pages/addNotesPage.dart';
import 'package:cubit_notes_app/pages/editNotesPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/notesCubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final notesCubit = BlocProvider.of<NotesCubit>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddNotesPage(),
            ),
          );
        },
        label: const Text("Add Notes"),
        icon: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: BlocBuilder<NotesCubit, NotesState>(builder: (context, state) {
          return notesCubit.notes.isEmpty
              ? SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "NO NOTES\nADDED!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "MY NOTES",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.all(10.0).copyWith(bottom: 80),
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          reverse: true,
                          itemCount: notesCubit.notes.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                state.notes![index].title!.toUpperCase(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              subtitle: Text(
                                state.notes![index].detail!,
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              trailing: SizedBox(
                                width: 100,
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => EditNotesPage(
                                              index: index,
                                            ),
                                          ),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.edit,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        notesCubit.deleteNote(index);
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider(
                              color: Colors.grey.shade600,
                              thickness: 1.5,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
        }),
      ),
    );
  }
}
