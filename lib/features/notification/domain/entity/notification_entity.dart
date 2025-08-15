class NotificationEntity {
  final String id;
  final String title;
  final String message;
  final DateTime date;
  final bool isRead;

  const NotificationEntity({
    required this.id,
    required this.title,
    required this.message,
    required this.date,
    required this.isRead,
  });
}
