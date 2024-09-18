class UserModel {
  final int id;
  final String name;
  final String location;
  final String imagePath;
  final String verifiedIconPath;
  final String locationIconPath;

  UserModel({
    required this.id,
    required this.name,
    required this.location,
    required this.imagePath,
    required this.verifiedIconPath,
    required this.locationIconPath,
  });
}
