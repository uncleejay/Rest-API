

class  Post{
  final int number;
  final List<dynamic> people;

  Post({this.number, this.people});

//  the factory method is used to initialize the class with the
// parameter values of a JSON file

  factory Post.fromJSON(Map<String, dynamic> json){
//    factory constructor
    return Post(
      number: json['number'],
      people: json['people'],
    );
  }

}