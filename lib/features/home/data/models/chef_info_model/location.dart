/// type : "Point"
/// coordinates : [31.38737220898334,31.04352521315619]

class Location {
  Location({
      this.type, 
      this.coordinates,});

  Location.fromJson(dynamic json) {
    type = json['type'];
    coordinates = json['coordinates'] != null ? json['coordinates'].cast<num>() : [];
  }
  String? type;
  List<num>? coordinates;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['coordinates'] = coordinates;
    return map;
  }

}