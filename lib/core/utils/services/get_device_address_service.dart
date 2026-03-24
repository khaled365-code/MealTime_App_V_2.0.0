
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import '../../commons/global_models/user_address_model/address_model.dart';
import 'location_service.dart';

class DeviceAddressService
{

  static String currentAddressApiKey='AIzaSyDMjM_oncic_3ycIgRFh1Xe9eSGzpV_TXU';

 static Future<AddressModel> getAppAddress() async
  {

   try {
         LocationData dataLocation= await LocationService.getAppLocation();
         double longitude=dataLocation.longitude!;
         double latitude=dataLocation.latitude!;
         final response= await http.get(Uri.parse('https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$currentAddressApiKey&language=ar'));
         if(response.statusCode==200)
         {
           var result = response.body;
           var data = json.decode(result);
           AddressModel addressModel = AddressModel.fromJson(data);
           return addressModel;
         }
         else
         {
           throw Exception('Failed to load address from request');
         }
       }
       catch (e)
    {
      throw Exception(e.toString());
    }

  }







}