class UserModel {
  final String username;
  final String uid;
  final String profileImageUrl;
  final bool active;
  final String phoneNumber;
  final List<String> groupId;

  UserModel({
    required this.uid,
    required this.profileImageUrl,
    required this.username,
    required this.active,
    required this.phoneNumber,
    required this.groupId,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'profileImageUrl': profileImageUrl,
      'username': username,
      'active': active,
      'phoneNumber': phoneNumber,
      'groupId': groupId,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      profileImageUrl: map['profileImageUrl'] ?? '',
      username: map['username'] ?? '',
      active: map['active'] ?? false,
      phoneNumber: map['phoneNumber'] ?? '',
      groupId: List<String>.from(map['groupId'] ?? []),
    );
  }
}
