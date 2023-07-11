import 'dart:convert';

import 'entry.dart';

class EntriesApi {
  int? count;
  List<Entry>? entries;

  EntriesApi({this.count, this.entries});

  @override
  String toString() => 'EntriesApi(count: $count, entries: $entries)';

  factory EntriesApi.fromMap(Map<String, dynamic> data) => EntriesApi(
        count: data['count'] as int?,
        entries: (data['entries'] as List<dynamic>?)
            ?.map((e) => Entry.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'count': count,
        'entries': entries?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [EntriesApi].
  factory EntriesApi.fromJson(String data) {
    return EntriesApi.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [EntriesApi] to a JSON string.
  String toJson() => json.encode(toMap());
}
