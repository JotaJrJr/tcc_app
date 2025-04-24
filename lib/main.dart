import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_tcc/data/app_db.dart';
import 'package:todo_app_tcc/data/repositories/note_repository_impl.dart';
import 'package:todo_app_tcc/features/home/home_view_model.dart';
import 'package:todo_app_tcc/features/home/home_page.dart';

import 'domain/use_cases/add_note.dart';
import 'domain/use_cases/delete_note.dart';
import 'domain/use_cases/get_all_notes.dart';
import 'domain/use_cases/get_note_by_id.dart';
import 'domain/use_cases/update_note.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        Provider<AppDb>(create: (_) => AppDb(), dispose: (_, db) => db.close()),
        ProxyProvider<AppDb, NoteRepositoryImpl>(update: (_, db, __) => NoteRepositoryImpl(db)),
        ProxyProvider<NoteRepositoryImpl, GetAllNotes>(update: (_, repo, __) => GetAllNotes(repo)),
        ProxyProvider<NoteRepositoryImpl, DeleteNote>(update: (_, repo, __) => DeleteNote(repo)),

        ProxyProvider<NoteRepositoryImpl, AddNote>(update: (_, repo, __) => AddNote(repo)),
        ProxyProvider<NoteRepositoryImpl, UpdateNote>(update: (_, repo, __) => UpdateNote(repo)),

        // Agora injetamos o ViewModel direto, e já carregamos as notas:
        Provider<HomeViewModel>(
          create: (ctx) {
            final vm = HomeViewModel(ctx.read<GetAllNotes>(), ctx.read<DeleteNote>());
            vm.loadNotes();
            return vm;
          },
          dispose: (_, vm) {},
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO App TCC',
      theme: ThemeData.from(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: HomePage(),
    );
  }
}
