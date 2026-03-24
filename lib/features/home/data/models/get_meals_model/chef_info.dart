import 'package:hive/hive.dart';

/// _id : "653aa89d6fa960fe1ac59208"
/// name : "Ammar"
/// phone : "01021570316"
/// brandName : "Ammar Chef"
///
part 'chef_info.g.dart';

@HiveType(typeId: 1)
class ChefData
{
  ChefData({
      this.id, 
      this.name, 
      this.phone, 
      this.brandName,});

  ChefData.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    phone = json['phone'];
    brandName = json['brandName'];
  }
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? phone;
  @HiveField(3)
  String? brandName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['phone'] = phone;
    map['brandName'] = brandName;
    return map;
  }

}