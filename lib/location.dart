import 'package:geolocator/geolocator.dart';

class Location {

  double? longitute;
  double? latitude;
  Future<void> GetCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      longitute = position.longitude;
      latitude = position.latitude;
  
    } catch (e) {
      print(e);
    }
  }
}
