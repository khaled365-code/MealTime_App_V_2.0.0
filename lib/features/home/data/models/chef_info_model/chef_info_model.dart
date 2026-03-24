import 'chef_data.dart';

/// chef : {"location":{"type":"Point","coordinates":[31.38737220898334,31.04352521315619]},"_id":"669317009bc8bcfb2b1f3894","name":"chef khaled","phone":"01013328223","email":"khaleddortmound123@gmail.com","brandName":"Zizo HmHm","profilePic":"https://res.cloudinary.com/dx2kspdex/image/upload/v1720915711/profilePic/formal_me.jpg_m7xGrEYMUwg2OKv8DS_2/formal_me.jpgtKeJgNerChZc5ygYvswEC.jpg","minCharge":8000,"disc":"fast and fresh food ","frontId":"https://res.cloudinary.com/dx2kspdex/image/upload/v1720915709/front_id/food_certificate.pngpM4Vo8MPDSBOLgz40mZ0o/food_certificate.pngVaHhsua2MnO804BbhjKo6.png","backId":"https://res.cloudinary.com/dx2kspdex/image/upload/v1720915710/back_id/food_certificate.png6sy_V4ZvM-DH6PcENoW9C/food_certificate.pngckf3FYdWMnT3lkEFW4b79.png","menu":[{"_id":"669a8f9feabc664e27d9558d","name":"Blah Sham","description":"delicious and easy to eat","price":200,"howToSell":"quantity","images":["https://res.cloudinary.com/dx2kspdex/image/upload/v1721405343/Meals/%D8%A8%D9%84%D8%AD%20%D8%B4%D8%A7%D9%85.jpgcYkxXKEiDorIm9J7cyNNt/%D8%A8%D9%84%D8%AD%20%D8%B4%D8%A7%D9%85.jpgtDHSNXemxWmg_s9cC-Lat.jpg"],"category":"Desserts","status":"accepted","createdAt":"2024-07-19T16:09:03.693Z"},{"_id":"669a938aadba6a180f6c6a17","name":"Pelmini","description":"Russia national dish","price":650,"howToSell":"number","images":["https://res.cloudinary.com/dx2kspdex/image/upload/v1721406346/Meals/pelmini.webpWCHJOcYUNrcZ9BEAseJG7/pelmini.webpmDwihv7oCDWRu2FRfLFej.webp"],"category":"Beef","status":"accepted","createdAt":"2024-07-19T16:25:47.140Z"},{"_id":"669a9405adba6a180f6c6a30","name":"Chicken","description":"delicious and spicy 1/2 kilo","price":1000,"howToSell":"quantity","images":["https://res.cloudinary.com/dx2kspdex/image/upload/v1721406468/Meals/chick.jpgHKeSmuVmbS9U7jt3Oy9yt/chick.jpgcgG7BFkPDXTA6ZSV-Sffz.jpg"],"category":"Chicken","status":"accepted","createdAt":"2024-07-19T16:27:49.439Z"}],"online":false,"healthCertificate":"https://res.cloudinary.com/dx2kspdex/image/upload/v1720915711/healthCertificate/food_certificate.pngOF-YsA2Vv4-6HKo1hO0lP/food_certificate.pngkOawdFPF3ESIOlMoi4AYD.png","stock":0,"status":"accepted","createdAt":"2024-07-14T00:08:33.611Z"}

class ChefInfoModel {
  ChefInfoModel({
      this.chef,});

  ChefInfoModel.fromJson(dynamic json) {
    chef = json['chef'] != null ? ChefData.fromJson(json['chef']) : null;
  }
  ChefData? chef;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (chef != null) {
      map['chef'] = chef?.toJson();
    }
    return map;
  }

}