// ignore_for_file: public_member_api_docs, sort_constructors_first

class PlaceAutocomplete {
  final String description;
  final String placeId;
  PlaceAutocomplete({
    required this.description,
    required this.placeId,
  });
  factory PlaceAutocomplete.fromJson(Map<String, dynamic> json) {
    return PlaceAutocomplete(
        description: json['description'], placeId: json['place_id']);
  }
}
