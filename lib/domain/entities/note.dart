class Note {
  final String? id;
  final String? title;
  final String? content;
  final int? createdAt;

  Note({this.id, this.title, this.content, this.createdAt});

  factory Note.create({String? id, String? title, String? content}) {
    final now = DateTime.now().millisecondsSinceEpoch;

    return Note(id: id, title: title, content: content, createdAt: now);
  }

  Note copyWith({String? id, String? title, String? content}) {
    return Note(id: id ?? this.id, title: title ?? this.title, content: content ?? this.content, createdAt: createdAt);
  }
}
