class PocketBaseUser {
  final String name;
  final String username;
  final String email;
  final bool emailVisibility;
  final String password;
  final String passwordConfirm;
  final String? avatar;

  PocketBaseUser({
    required this.name,
    required this.username,
    required this.email,
    required this.emailVisibility,
    required this.password,
    required this.passwordConfirm,
    this.avatar,
  });

  PocketBaseUser copyWith({
    String? name,
    String? username,
    String? email,
    bool? emailVisibility,
    String? password,
    String? passwordConfirm,
    String? avatar,
  }) {
    return PocketBaseUser(
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      emailVisibility: emailVisibility ?? this.emailVisibility,
      password: password ?? this.password,
      passwordConfirm: passwordConfirm ?? this.passwordConfirm,
      avatar: avatar ?? this.avatar,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'username': username,
      'email': email,
      'emailVisibility': emailVisibility,
      'password': password,
      'passwordConfirm': passwordConfirm,
      'avatar': avatar,
    };
  }

  factory PocketBaseUser.fromMap(Map<String, dynamic> map) {
    return PocketBaseUser(
      name: map['name'],
      username: map['username'],
      email: map['email'],
      emailVisibility: map['emailVisibility'],
      password: map['password'],
      passwordConfirm: map['passwordConfirm'],
      avatar: map['avatar'],
    );
  }
}
