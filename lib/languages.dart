import 'languages.g.dart';
export 'languages.g.dart';

// TO consider, using flags here to help

class Language {
  Language(this.code, this.nameEn, this.name);

  final String code;
  final String nameEn;
  final String name;

  Language.fromMap(Map<String, String> map)
      : nameEn = map['nameEn']!,
        code = map['code']!,
        name = map['name']!;

  /// Returns the Language matching the given ISO code from the standard list.
  factory Language.fromIsoCode(String code) =>
      Languages.defaultLanguages.firstWhere((l) => l.code == code);

  bool operator ==(o) => o is Language && nameEn == o.nameEn && code == o.code;

  @override
  int get hashCode => code.hashCode;
}
