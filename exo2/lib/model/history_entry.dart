class historyEntry {
  int? id;
  late String operation;
  late DateTime? date;

  historyEntry(this.operation) {
    date = DateTime.now();
  }

  Map<String, dynamic> toMap() {
    return {
      'operation': operation,
      'date': date?.millisecondsSinceEpoch
    };
  }

  historyEntry.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    operation = map['operation'];
    date = DateTime.fromMillisecondsSinceEpoch(map['date']);
  }
}
