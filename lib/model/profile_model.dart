// profile_model.dart
class ProfileModel {
  String dateOfBirth;
  String name;
  String description;
  String country;

  ProfileModel({
    this.dateOfBirth = '',
    this.name = '',
    this.description = '',
    this.country = '',
  });

  // Methods to update profile fields
  void updateDateOfBirth(String value) {
    dateOfBirth = value;
  }

  void updateName(String value) {
    name = value;
  }

  void updateDescription(String value) {
    description = value;
  }

  void updateCountry(String value) {
    country = value;
  }
}
