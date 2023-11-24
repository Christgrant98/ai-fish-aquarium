class Comment {
  String username;
  String mail;
  String comment;

  Comment({
    required this.username,
    required this.mail,
    required this.comment,
  });

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      username: map['username'],
      mail: map['mail'],
      comment: map['comment'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "username": username,
      "mail": mail,
      "comment": comment,
    };
  }
}
