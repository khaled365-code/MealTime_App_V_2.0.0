/// lat : 31.0667811197085
/// lng : 31.4071650197085

class Southwest {
  Southwest({
      this.lat, 
      this.lng,});

  Southwest.fromJson(dynamic json) {
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