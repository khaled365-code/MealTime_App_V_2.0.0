/// compound_code : "3C95+7C El Mansoura 2, Egypt"
/// global_code : "8G3H3C95+7C"

class PlusCode {
  PlusCode({
      this.compoundCode, 
      this.globalCode,});

  PlusCode.fromJson(dynamic json) {
    compoundCode = json['compound_code'];
    globalCode = json['global_code'];
  }
  String? compoundCode;
  String? globalCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['compound_code'] = compoundCode;
    map['global_code'] = globalCode;
    return map;
  }

}