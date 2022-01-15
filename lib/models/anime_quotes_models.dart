class AnimeQuoteModel {
  String? anime;
  String? character;
  String? quote;

  AnimeQuoteModel({
    required this.anime,
    required this.character,
    required this.quote,
  });

  AnimeQuoteModel.fromJson(Map<String, dynamic> json)
      : anime = json['anime'] as String?,
        character = json['character'] as String?,
        quote = json['quote'] as String?;

  Map<String, dynamic> toJson() =>
      {'anime': anime, 'character': character, 'quote': quote};
}
