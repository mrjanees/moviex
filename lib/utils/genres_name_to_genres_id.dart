List<int> genresNametoGeresId(List<String> id) {
  List<int> genres = [];

  for (var name in id) {
    switch (name) {
      case 'Action':
        genres.add(28);
        break;
      case 'caseAdventure':
        genres.add(12);
        break;
      case 'Animation':
        genres.add(16);
        break;
      case 'Comedy':
        genres.add(35);
        break;
      case 'Crime':
        genres.add(80);
        break;
      case 'Documentary':
        genres.add(99);
        break;
      case 'Drama':
        genres.add(18);
        break;
      case 'Family':
        genres.add(10751);
        break;
      case 'Fantasy':
        genres.add(14);
        break;
      case 'History':
        genres.add(36);
        break;
      case 'Horror':
        genres.add(27);
        break;
      case 'Music':
        genres.add(10402);
        break;
      case 'Mystery':
        genres.add(9648);
        break;
      case 'Romance':
        genres.add(10749);
        break;
      case 'Science Fiction':
        genres.add(878);
        break;
      case 'Tv Movie':
        genres.add(10770);
        break;
      case 'Thriller':
        genres.add(53);
        break;
      case 'War':
        genres.add(10752);
        break;
      case 'Western':
        genres.add(37);
        break;
    }
  }
  return genres;
}
