/// long_name : "Egypt"
/// short_name : "EG"
/// types : ["country","political"]

class AddressComponents {
  AddressComponents({
      this.longName, 
      this.shortName, 
      this.types,});

  AddressComponents.fromJson(dynamic json) {
    longName = json['long_name'];
    shortName = json['short_name'];
    types = json['types'] != null ? json['types'].cast<String>() : [];
  }
  String? longName;
  String? shortName;
  List<String>? types;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['long_name'] = longName;
    map['short_name'] = shortName;
    map['types'] = types;
    return map;
  }

}