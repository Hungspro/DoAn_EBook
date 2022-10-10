class Book{
  String type;
  String name;
  String publisher;
  DateTime date;
  String imgUrl;
  num score;
  num rating;
  String review;
  num height;
  Book(
    this.type,
    this.name,
    this.publisher,
    this.date,
    this.imgUrl,
    this.score,
    this.rating,
    this.review,
    this.height,
  ); 
  static List<Book> generateBooks(){
    return[
      Book(
        'type', 
        'name', 
        'publisher', 
        DateTime(2022, 9, 26), 
        'assets/images/Book Covers of Note April 2016.jpg', 
        4, 
        300, 
        'review', 
        300.0
        ),
        Book(
        'type', 
        'name', 
        'publisher', 
        DateTime(2022, 9, 26), 
        'assets/images/gray318.jpg', 
        4, 
        300, 
        'review', 
        300.0
        ),
        Book(
        'type', 
        'name', 
        'publisher', 
        DateTime(2022, 9, 26), 
        'assets/images/One Day.jpg', 
        4, 
        300, 
        'review', 
        300.0
        ),
        Book(
        'type', 
        'name', 
        'publisher', 
        DateTime(2022, 9, 26), 
        'assets/images/The Bees by Laline Paull.jpg', 
        4, 
        300, 
        'review', 
        300.0
        ),
        Book(
        'type', 
        'name', 
        'publisher', 
        DateTime(2022, 9, 26), 
        'assets/images/The Book of Disquiet_ The Complete Edition _ New Directions Publishing.png', 
        4, 
        300, 
        'review', 
        300.0
        ),

    ];
  }
}