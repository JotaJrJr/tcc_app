import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_tcc/domain/use_cases/update_note.dart';
import 'package:todo_app_tcc/features/home/home_view_model.dart';
import 'package:todo_app_tcc/features/note_edit_add_page/note_edit_add_page.dart';
import 'package:todo_app_tcc/features/note_edit_add_page/view/note_edit_add_page_mobile.dart';

import '../../../domain/entities/note.dart';
import '../../../domain/use_cases/add_note.dart';
import '../../note_edit_add_page/note_edit_add_view_model.dart';

class HomePageMobile extends StatelessWidget {
  final HomeViewModel viewModel;
  const HomePageMobile({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Minhas Tarefas')),
      body: ValueListenableBuilder<bool>(
        valueListenable: viewModel.isLoading,
        builder: (_, loading, __) {
          if (loading) {
            return const Center(child: CircularProgressIndicator());
          }
          return ValueListenableBuilder<List<Note>>(
            valueListenable: viewModel.notes,
            builder: (_, notes, __) {
              if (notes.isEmpty) {
                return const Center(child: Text('Nenhuma nota'));
              }
              return ListView.builder(
                itemCount: notes.length,
                itemBuilder: (_, i) {
                  final note = notes[i];
                  return ListTile(
                    title: Text(note.title ?? ''),
                    trailing: IconButton(icon: const Icon(Icons.delete), onPressed: () => viewModel.delete(note.id!)),
                    onTap:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (ctx) => Provider<NoteEditAddViewModel>(
                                  // aqui pegamos AddNote e UpdateNote que você já
                                  // injetou lá no main.dart
                                  create:
                                      (_) => NoteEditAddViewModel(
                                        addNote: ctx.read<AddNote>(),
                                        updateNote: ctx.read<UpdateNote>(),
                                        original: note, // passamos a nota pra editar
                                      ),
                                  child: const NoteEditAddPage(),
                                ),
                          ),
                        ).then((_) => viewModel.loadNotes()),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: () => Navigator.pushNamed(context, '/note').then((_) => viewModel.loadNotes()),
        onPressed:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (ctx) => Provider<NoteEditAddViewModel>(
                      create:
                          (_) => NoteEditAddViewModel(addNote: ctx.read<AddNote>(), updateNote: ctx.read<UpdateNote>()),
                      child: const NoteEditAddPage(),
                    ),
              ),
            ).then((_) => viewModel.loadNotes()),

        child: const Icon(Icons.add),
      ),
    );
  }
}
