import 'package:flutter_youtube_clone_sample/src/models/statistics.dart';

import 'channel_snippet.dart';

class Youtuber {
  Youtuber({
    this.snippet,
    this.statistics,
  });

  ChannelSnippet? snippet;
  Statistics? statistics;

  factory Youtuber.fromJson(Map<String?, dynamic> json) => Youtuber(
        snippet: ChannelSnippet.fromJson(json["snippet"]),
        statistics: Statistics.fromJson(json["statistics"]),
      );
}
