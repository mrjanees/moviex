import 'package:json_annotation/json_annotation.dart';

import 'created_by.dart';
import 'genre.dart';
import 'last_episode_to_air.dart';
import 'network.dart';
import 'production_company.dart';
import 'production_country.dart';
import 'season.dart';
import 'spoken_language.dart';

part 'tv_info_details.g.dart';

@JsonSerializable()
class TvInfoDetails {
  bool? adult;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'created_by')
  List<CreatedBy>? createdBy;
  @JsonKey(name: 'episode_run_time')
  List<dynamic>? episodeRunTime;
  @JsonKey(name: 'first_air_date')
  String? firstAirDate;
  @JsonKey(name: 'genres')
  List<Genre>? genres;
  @JsonKey(name: 'homepage')
  String? homepage;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'in_production')
  bool? inProduction;
  @JsonKey(name: 'languages')
  List<String>? languages;
  @JsonKey(name: 'last_air_date')
  String? lastAirDate;
  @JsonKey(name: 'last_episode_to_air')
  LastEpisodeToAir? lastEpisodeToAir;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'next_episode_to_air')
  dynamic nextEpisodeToAir;
  @JsonKey(name: 'networks')
  List<Network>? networks;
  @JsonKey(name: 'number_of_episodes')
  int? numberOfEpisodes;
  @JsonKey(name: 'number_of_seasons')
  int? numberOfSeasons;
  @JsonKey(name: 'origin_country')
  List<String>? originCountry;
  @JsonKey(name: 'original_language')
  String? originalLanguage;
  @JsonKey(name: 'original_name')
  String? originalName;
  @JsonKey(name: 'overview')
  String? overview;
  @JsonKey(name: 'popularity')
  double? popularity;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'production_companies')
  List<ProductionCompany>? productionCompanies;
  @JsonKey(name: 'production_countries')
  List<ProductionCountry>? productionCountries;
  @JsonKey(name: 'seasons')
  List<Season>? seasons;
  @JsonKey(name: 'spoken_languages')
  List<SpokenLanguage>? spokenLanguages;
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'tagline')
  String? tagline;
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'vote_average')
  double? voteAverage;
  @JsonKey(name: 'vote_count')
  int? voteCount;
  String? trailerkey;

  TvInfoDetails({
  this.trailerkey,
    this.adult,
    this.backdropPath,
    this.createdBy,
    this.episodeRunTime,
    this.firstAirDate,
    this.genres,
    this.homepage,
    this.id,
    this.inProduction,
    this.languages,
    this.lastAirDate,
    this.lastEpisodeToAir,
    this.name,
    this.nextEpisodeToAir,
    this.networks,
    this.numberOfEpisodes,
    this.numberOfSeasons,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.seasons,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.type,
    this.voteAverage,
    this.voteCount,
  });

  @override
  String toString() {
    return 'TvInfoDetails(adult: $adult, backdropPath: $backdropPath, createdBy: $createdBy, episodeRunTime: $episodeRunTime, firstAirDate: $firstAirDate, genres: $genres, homepage: $homepage, id: $id, inProduction: $inProduction, languages: $languages, lastAirDate: $lastAirDate, lastEpisodeToAir: $lastEpisodeToAir, name: $name, nextEpisodeToAir: $nextEpisodeToAir, networks: $networks, numberOfEpisodes: $numberOfEpisodes, numberOfSeasons: $numberOfSeasons, originCountry: $originCountry, originalLanguage: $originalLanguage, originalName: $originalName, overview: $overview, popularity: $popularity, posterPath: $posterPath, productionCompanies: $productionCompanies, productionCountries: $productionCountries, seasons: $seasons, spokenLanguages: $spokenLanguages, status: $status, tagline: $tagline, type: $type, voteAverage: $voteAverage, voteCount: $voteCount)';
  }

  factory TvInfoDetails.fromJson(Map<String, dynamic> json) {
    return _$TvInfoDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TvInfoDetailsToJson(this);
}
