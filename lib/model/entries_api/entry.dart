import 'dart:convert';

class Entry {
  String? api;
  String? description;
  String? auth;
  bool? https;
  String? cors;
  String? link;
  String? category;

  Entry({
    this.api,
    this.description,
    this.auth,
    this.https,
    this.cors,
    this.link,
    this.category,
  });

  @override
  String toString() {
    return 'Entry(api: $api, description: $description, auth: $auth, https: $https, cors: $cors, link: $link, category: $category)';
  }

  factory Entry.fromMap(Map<String, dynamic> data) => Entry(
        api: data['API'] as String?,
        description: data['Description'] as String?,
        auth: data['Auth'] as String?,
        https: data['HTTPS'] as bool?,
        cors: data['Cors'] as String?,
        link: data['Link'] as String?,
        category: data['Category'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'API': api,
        'Description': description,
        'Auth': auth,
        'HTTPS': https,
        'Cors': cors,
        'Link': link,
        'Category': category,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Entry].
  factory Entry.fromJson(String data) {
    return Entry.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Entry] to a JSON string.
  String toJson() => json.encode(toMap());
}
