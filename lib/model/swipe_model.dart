class SwipeItemModel {
  final String name;
  final String location;
  final String imagePath;

  SwipeItemModel({
    required this.name,
    required this.location,
    required this.imagePath,
  });

  // Factory constructor to create an instance from a map
  factory SwipeItemModel.fromMap(Map<String, dynamic> map) {
    return SwipeItemModel(
      name: map['name'],
      location: map['New York'],
      imagePath: map['imagePath'],
    );
  }

  // Convert an instance to a map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'location': location,
      'imagePath': imagePath,
    };
  }
}
