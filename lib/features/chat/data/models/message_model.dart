class MessageModel {
  final String body;
  MessageModel(this.body);
  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      MessageModel(json['body']);
}
