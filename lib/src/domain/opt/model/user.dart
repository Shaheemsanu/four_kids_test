import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int? id;
  String? name;
  dynamic address;
  String? phone;
  int? active;
  @JsonKey(name: 'contact_person')
  String? contactPerson;
  int? approvel;
  String? email;
  @JsonKey(name: 'location_latitude')
  double? locationLatitude;
  @JsonKey(name: 'location_longitude')
  double? locationLongitude;
  @JsonKey(name: 'whatsapp_number')
  String? whatsappNumber;
  @JsonKey(name: 'wholesale_user')
  int? wholesaleUser;
  String? image;

  User({
    this.id,
    this.name,
    this.address,
    this.phone,
    this.active,
    this.contactPerson,
    this.approvel,
    this.email,
    this.locationLatitude,
    this.locationLongitude,
    this.whatsappNumber,
    this.wholesaleUser,
    this.image,
  });

  @override
  String toString() {
    return 'User(id: $id, name: $name, address: $address, phone: $phone, active: $active, contactPerson: $contactPerson, approvel: $approvel, email: $email, locationLatitude: $locationLatitude, locationLongitude: $locationLongitude, whatsappNumber: $whatsappNumber, wholesaleUser: $wholesaleUser, image: $image)';
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    int? id,
    String? name,
    dynamic address,
    String? phone,
    int? active,
    String? contactPerson,
    int? approvel,
    String? email,
    double? locationLatitude,
    double? locationLongitude,
    String? whatsappNumber,
    int? wholesaleUser,
    String? image,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      active: active ?? this.active,
      contactPerson: contactPerson ?? this.contactPerson,
      approvel: approvel ?? this.approvel,
      email: email ?? this.email,
      locationLatitude: locationLatitude ?? this.locationLatitude,
      locationLongitude: locationLongitude ?? this.locationLongitude,
      whatsappNumber: whatsappNumber ?? this.whatsappNumber,
      wholesaleUser: wholesaleUser ?? this.wholesaleUser,
      image: image ?? this.image,
    );
  }
}
