import 'package:flutter_riverpod/legacy.dart';
final selectedStreamProductsProvider = StateProvider<List<int>>((ref) => []);
class ChatMessage {
final String username;
final String message;
ChatMessage(this.username, this.message);
}
final streamChatProvider = StateProvider<List<ChatMessage>>((ref) => [
ChatMessage('PokeFan88', 'Omgg that card condition is crazy!'),
ChatMessage('NmSujon', 'Omgg that card'),
ChatMessage('PokeFan88', 'Omgg that card'),
]);