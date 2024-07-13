import 'package:location/location.dart';

class LocationService {
  static final _location = Location();
  static bool isServiceEnabled = false;
  static PermissionStatus _permissionStatsus = PermissionStatus.denied;
  static LocationData? locationData;

  static Future<void> init() async {
    await checkService();
    await checkPermission();
  }

  static Future<void> checkService() async {
    isServiceEnabled = await _location.serviceEnabled();

    if (!isServiceEnabled) {
      isServiceEnabled = await _location.requestService();

      if (!isServiceEnabled) {
        return;
      }
    }
  }

  static Future<void> checkPermission() async {
    _permissionStatsus = await _location.hasPermission();

    if (_permissionStatsus == PermissionStatus.denied) {
      await _location.requestPermission();
    }
    if (_permissionStatsus == PermissionStatus.granted) {
      return;
    }
  }

  static Future<LocationData?> getCurrentLocation() async {
    if (isServiceEnabled && _permissionStatsus == PermissionStatus.granted) {
      locationData = await _location.getLocation();
      return locationData!;
    } else {
      return null;
    }
  }

  
}
