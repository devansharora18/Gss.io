class User {
  final String email;
  final String uid;

  const User({required this.email, required this.uid});

  Map<String, dynamic> toJson() => {'uid': uid, 'email': email};
}
