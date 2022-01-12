// To parse required this JSON data, do
//
//     final channelSnippet = channelSnippetFromJson(jsonString);

import 'dart:convert';

ChannelSnippet channelSnippetFromJson(String str) =>
    ChannelSnippet.fromJson(json.decode(str));

String channelSnippetToJson(ChannelSnippet data) => json.encode(data.toJson());

class ChannelSnippet {
  ChannelSnippet({
    required this.title,
    required this.description,
    required this.customUrl,
    required this.publishedAt,
    required this.thumbnails,
    required this.localized,
    required this.country,
  });

  String title;
  String description;
  String customUrl;
  DateTime publishedAt;
  Thumbnails thumbnails;
  Localized localized;
  String country;

  factory ChannelSnippet.fromJson(Map<String, dynamic> json) => ChannelSnippet(
        title: json["title"],
        description: json["description"],
        customUrl: json["customUrl"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        thumbnails: Thumbnails.fromJson(json["thumbnails"]),
        localized: Localized.fromJson(json["localized"]),
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "customUrl": customUrl,
        "publishedAt": publishedAt.toIso8601String(),
        "thumbnails": thumbnails.toJson(),
        "localized": localized.toJson(),
        "country": country,
      };
}

class Localized {
  Localized({
    required this.title,
    required this.description,
  });

  String title;
  String description;

  factory Localized.fromJson(Map<String, dynamic> json) => Localized(
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
      };
}

class Thumbnails {
  Thumbnails({
    required this.thumbnailsDefault,
    required this.medium,
    required this.high,
  });

  Default thumbnailsDefault;
  Default medium;
  Default high;

  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
        thumbnailsDefault: Default.fromJson(json["default"]),
        medium: Default.fromJson(json["medium"]),
        high: Default.fromJson(json["high"]),
      );

  Map<String, dynamic> toJson() => {
        "default": thumbnailsDefault.toJson(),
        "medium": medium.toJson(),
        "high": high.toJson(),
      };
}

class Default {
  Default({
    required this.url,
    required this.width,
    required this.height,
  });

  String url;
  int width;
  int height;

  factory Default.fromJson(Map<String, dynamic> json) => Default(
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
      };
}
