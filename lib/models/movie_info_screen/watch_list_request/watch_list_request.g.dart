// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_list_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WatchListRequest _$WatchListRequestFromJson(Map<String, dynamic> json) =>
    WatchListRequest(
      mediaType: json['media_type'] as String?,
      mediaId: json['media_id'] as int?,
      watchlist: json['watchlist'] as bool?,
    );

Map<String, dynamic> _$WatchListRequestToJson(WatchListRequest instance) =>
    <String, dynamic>{
      'media_type': instance.mediaType,
      'media_id': instance.mediaId,
      'watchlist': instance.watchlist,
    };
