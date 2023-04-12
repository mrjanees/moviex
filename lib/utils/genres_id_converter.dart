String genresIdIntoGeresName(List<int> id) {
  List<String?> genres = [];

  id.forEach((id) {
    switch (id) {
      case 28:
        genres.add('Action');
        break;
      case 12:
        genres.add('Adventure');
        break;
      case 16:
        genres.add('Animation');
        break;
      case 35:
        genres.add('Comedy');
        break;
      case 80:
        genres.add('Crime');
        break;
      case 99:
        genres.add('Documentary');
        break;
      case 18:
        genres.add('Drama');
        break;
      case 10751:
        genres.add('Family');
        break;
      case 14:
        genres.add('Fantasy');
        break;
      case 36:
        genres.add('History');
        break;
      case 27:
        genres.add('Horror');
        break;
      case 10402:
        genres.add('Music');
        break;
      case 9648:
        genres.add('Mystery');
        break;
      case 10749:
        genres.add('Romance');
        break;
      case 878:
        genres.add('Science Fiction');
        break;
      case 10770:
        genres.add('Tv Movie');
        break;
      case 53:
        genres.add('Thriller');
        break;
      case 10752:
        genres.add('War');
        break;
      case 37:
        genres.add('Western');
        break;
    }
  });
  return genres.join(', ');
}
