class LocationInfo {
  double latitude;
  double longitude;

  String? staticMapImageUrl; // Optional field for the static map image URL
  String? static_location; // Optional field for the static map image URL

  LocationInfo({required this.latitude, required this.longitude, this.staticMapImageUrl , this.static_location});
}
