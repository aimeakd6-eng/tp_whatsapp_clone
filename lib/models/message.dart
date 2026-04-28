class Message {
  final String text;
  final bool isSent; // true = envoyé (droite), false = reçu (gauche)
  final String time;

  const Message({
    required this.text,
    required this.isSent,
    required this.time,
  });
}