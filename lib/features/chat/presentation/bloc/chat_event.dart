abstract class ChatEvent {}

class LoadMessages extends ChatEvent {}

class SendMessage extends ChatEvent {
  final String text;
  final String userId;
  final String name;
  SendMessage({required this.text, required this.userId, required this.name});
}
