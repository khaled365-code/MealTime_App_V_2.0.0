import 'northeast.dart';
import 'southwest.dart';

/// northeast : {"lat":31.0694790802915,"lng":31.4098629802915}
/// southwest : {"lat":31.0667811197085,"lng":31.4071650197085}

class Viewport {
  Viewport({
      this.northeast, 
      this.southwest,});

  Viewport.fromJson(dynamic json) {
    northeast = json['northeast'] != null ? Northeast.fromJson(json['northeast']) : null;
    southwest = json['southwest'] != null ? Southwest.fromJson(json['southwest']) : null;
  }
  Northeast? northeast;
  Southwest? southwest;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (northeast != null) {
      map['northeast'] = northeast?.toJson();
    }
    if (southwest != null) {
      map['southwest'] = southwest?.toJson();
    }
    return map;
  }

}