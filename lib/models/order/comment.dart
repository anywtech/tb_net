// To parse this JSON data, do
//
//     final comment = commentFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Comment commentFromMap(String str) => Comment.fromMap(json.decode(str));

String commentToMap(Comment data) => json.encode(data.toMap());

class Comment {
  Comment({
    @required this.commentId,
    @required this.userIcon,
    @required this.userName,
    @required this.commentDate,
    @required this.comments,
    @required this.replyDate,
    @required this.replies,
  });

  final String commentId;
  final String userIcon;
  final String userName;
  final String commentDate;
  final String comments;
  final String replyDate;
  final String replies;

  Comment copyWith({
    String commentId,
    String userIcon,
    String userName,
    String commentDate,
    String comments,
    String replyDate,
    String replies,
  }) =>
      Comment(
        commentId: commentId ?? this.commentId,
        userIcon: userIcon ?? this.userIcon,
        userName: userName ?? this.userName,
        commentDate: commentDate ?? this.commentDate,
        comments: comments ?? this.comments,
        replyDate: replyDate ?? this.replyDate,
        replies: replies ?? this.replies,
      );

  factory Comment.fromMap(Map<String, dynamic> json) => Comment(
        commentId: json["commentId"],
        userIcon: json["userIcon"],
        userName: json["userName"],
        commentDate: json["commentDate"],
        comments: json["comments"],
        replyDate: json["replyDate"],
        replies: json["replies"],
      );

  Map<String, dynamic> toMap() => {
        "commentId": commentId,
        "userIcon": userIcon,
        "userName": userName,
        "commentDate": commentDate,
        "comments": comments,
        "replyDate": replyDate,
        "replies": replies,
      };
}

final List<Comment> comments = [
  new Comment(
      commentId: 'a10921',
      userIcon:
          'https://mk0qomafemocnned3wjh.kinstacdn.com/wp-content/uploads/2019/02/AI-thispersondoesnotexist.jpg',
      userName: 'elina',
      commentDate: '2021-05-01',
      comments:
          'Really good taste, amazing meat toasted. It\'s worth you having a try :), and it won\'t let you down. ❤',
      replyDate: '',
      replies: ''),
  new Comment(
      commentId: 'a10921',
      userIcon:
          'https://upload.wikimedia.org/wikipedia/commons/a/a0/Pierre-Person.jpg',
      userName: 'Jackson',
      commentDate: '2021-05-01',
      comments:
          'Really good taste, amazing meat toasted. It\'s worth you having a try :), and it won\'t let you down. ❤',
      replyDate: '2021-05-01',
      replies:
          'Hi, Alex. We sincerely apologize for our delay. It was because we failed serving too much orders only by 3 staff. We\'ve sent you some snacks as a gift, wish you take them and have a good day!'),
];
