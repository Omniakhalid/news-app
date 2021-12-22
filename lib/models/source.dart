class Source{
  String? id;
  String name;
  Source(this.id,this.name);
  //named constructor
  Source.fromJson(Map<String, Object?> json)
    : this( //this ==> 3yda 3la el constructor el 3ady
    json['id'] as String?,
    json['name']! as String,
    );
}