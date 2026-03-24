/// lat : 31.0694790802915
/// lng : 31.4098629802915

class Northeast {
  Northeast({
      this.lat, 
      this.lng,});

  Northeast.fromJson(dynamic json) {
    lat = json['lat'];
    lng = json['lng'];
  }
  num? lat;
  num? lng;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['lng'] = lng;
    return map;
  }

}