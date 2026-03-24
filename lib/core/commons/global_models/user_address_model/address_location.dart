/// lat : 31.0681301
/// lng : 31.408514

class AddressLocation {
  AddressLocation({
      this.lat, 
      this.lng,});

  AddressLocation.fromJson(dynamic json) {
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