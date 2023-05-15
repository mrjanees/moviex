class GeneratePopUpValues {
  static const List<String> languages = [
    'English',
    'Malayalam',
    'Tamil',
    'Kannada',
    'Hindi',
    'Arabic',
    'Korean',
    'French',
    'Spanish'
  ];

  static const List<String> genres = [
    'Crime',
    'Action',
    'Adventure',
    'Animation',
    'Drama',
    'Family',
    'Fantasy',
    'History',
    'Horror',
    'Mystery',
    'Romance',
    'Science Fiction',
    'Thriller',
    'War'
  ];

  static String numberTolanguageCode(int number) {
    switch (number) {
      case 0:
        return 'en';
      case 1:
        return 'ml';
      case 2:
        return 'ta';
      case 3:
        return 'kn';
      case 4:
        return 'hi';
      case 5:
        return 'ar';
      case 6:
        return 'ko';
      case 7:
        return 'fr';
      case 8:
        return 'es';
      default:
        {
          return 'en';
        }
    }
  }
}
