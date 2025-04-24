import 'package:flutter/material.dart';
import '../../domain/entities/note.dart';
import '../../domain/use_cases/add_note.dart';
import '../../domain/use_cases/update_note.dart';

class NoteEditAddViewModel {
  final AddNote _addNote;
  final UpdateNote _updateNote;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  final ValueNotifier<bool> isSaving = ValueNotifier(false);
  final ValueNotifier<String?> error = ValueNotifier(null);

  final bool isEditMode;
  final Note? original;

  NoteEditAddViewModel({required AddNote addNote, required UpdateNote updateNote, this.original})
    : _addNote = addNote,
      _updateNote = updateNote,
      isEditMode = original != null {
    if (original != null) {
      titleController.text = original!.title ?? '';
      contentController.text = original!.content ?? '';
    }
  }

  Future<void> save() async {
    isSaving.value = true;
    error.value = null;

    try {
      if (isEditMode && original != null) {
        final updated = original!.copyWith(title: titleController.text, content: contentController.text);
        await _updateNote(updated);
      } else {
        final newNote = Note.create(title: titleController.text, content: contentController.text);
        await _addNote(newNote);
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      isSaving.value = false;
    }
  }
}
