import 'package:flutter/material.dart';
import 'package:todo_app_tcc/domain/entities/note.dart';
import 'package:todo_app_tcc/domain/use_cases/delete_note.dart';
import 'package:todo_app_tcc/domain/use_cases/get_all_notes.dart';

class HomeViewModel {
  final GetAllNotes _getAllNotes;
  final DeleteNote _deleteNote;

  HomeViewModel(this._getAllNotes, this._deleteNote);

  ValueNotifier<List<Note>> notes = ValueNotifier([]);
  ValueNotifier<bool> isLoading = ValueNotifier(false);
  ValueNotifier<String?> error = ValueNotifier(null);

  Future<void> loadNotes() async {
    isLoading.value = true;
    error.value = null;

    try {
      final list = await _getAllNotes();
      notes.value = list;
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> delete(String id) async {
    await _deleteNote(id);
    notes.value = List.from(notes.value)..removeWhere((element) => element.id == id);
  }
}
