


import 'package:location/location.dart';

class LocationService
{

  static Location myLocation=Location();


  static Future<bool> checkAndRequestLocationService() async
   {
      bool serviceEnabled = await myLocation.serviceEnabled();
      if(!serviceEnabled)
        {
         serviceEnabled= await myLocation.requestService();
         if(!serviceEnabled)
           {
             return false;
           }
        }
      return true;

   }

  static Future<bool> checkAndRequestLocationPermission() async
   {

     PermissionStatus myPermissionStatus = await myLocation.hasPermission();
     if(myPermissionStatus==PermissionStatus.deniedForever)
       {
         return false;
       }
     else
       {
         if(myPermissionStatus==PermissionStatus.denied)
           {
             myPermissionStatus=await myLocation.requestPermission();
             if(myPermissionStatus!=PermissionStatus.granted)
               {
                 return false;
               }
           }
         return true;
       }
   }

  static Future getAppLocation() async
   {
     var bool1=await checkAndRequestLocationService();
     var bool2=await checkAndRequestLocationPermission();
     if(bool1==true && bool2==true)
       {
         LocationData myLocationData=await myLocation.getLocation();
         return myLocationData;
       }

   }





}
