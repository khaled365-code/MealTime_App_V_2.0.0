import 'address_components.dart';
import 'geometry.dart';
import 'plus_code.dart';

/// address_components : [{"long_name":"Egypt","short_name":"EG","types":["country","political"]},{"long_name":"Mansoura Qism 2","short_name":"Mansoura Qism 2","types":["administrative_area_level_3","political"]},{"long_name":"El Mansoura 2","short_name":"El Mansoura 2","types":["administrative_area_level_2","political"]},{"long_name":"Dakahlia Governorate","short_name":"Dakahlia Governorate","types":["administrative_area_level_1","political"]},{"long_name":"7661443","short_name":"7661443","types":["postal_code"]}]
/// formatted_address : "المنصورة-الزقازيق، المنصورة (قسم 2)، المنصورة، الدقهلية،، المنصورة (قسم 2)، ثان المنصورة، الدقهلية،، Mansoura Qism 2, El Mansoura 2, Dakahlia Governorate 7661443, Egypt"
/// geometry : {"location":{"lat":31.0681301,"lng":31.408514},"location_type":"GEOMETRIC_CENTER","viewport":{"northeast":{"lat":31.0694790802915,"lng":31.4098629802915},"southwest":{"lat":31.0667811197085,"lng":31.4071650197085}}}
/// place_id : "ChIJGRkRTXZ39xQRg9ixKkTzfOY"
/// plus_code : {"compound_code":"3C95+7C El Mansoura 2, Egypt","global_code":"8G3H3C95+7C"}
/// types : ["establishment","point_of_interest"]

class AddressResults {
  AddressResults({
      this.addressComponents, 
      this.formattedAddress, 
      this.geometry, 
      this.placeId, 
      this.plusCode, 
      this.types,});

  AddressResults.fromJson(dynamic json) {
    if (json['address_components'] != null) {
      addressComponents = [];
      json['address_components'].forEach((v) {
        addressComponents?.add(AddressComponents.fromJson(v));
      });
    }
    formattedAddress = json['formatted_address'];
    geometry = json['geometry'] != null ? Geometry.fromJson(json['geometry']) : null;
    placeId = json['place_id'];
    plusCode = json['plus_code'] != null ? PlusCode.fromJson(json['plus_code']) : null;
    types = json['types'] != null ? json['types'].cast<String>() : [];
  }
  List<AddressComponents>? addressComponents;
  String? formattedAddress;
  Geometry? geometry;
  String? placeId;
  PlusCode? plusCode;
  List<String>? types;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (addressComponents != null) {
      map['address_components'] = addressComponents?.map((v) => v.toJson()).toList();
    }
    map['formatted_address'] = formattedAddress;
    if (geometry != null) {
      map['geometry'] = geometry?.toJson();
    }
    map['place_id'] = placeId;
    if (plusCode != null) {
      map['plus_code'] = plusCode?.toJson();
    }
    map['types'] = types;
    return map;
  }

}