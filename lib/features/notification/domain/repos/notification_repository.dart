import 'package:fruits_hub_admin/features/notification/domain/entity/notification_entity.dart';

abstract class NotificationRepository {
  Future<void> sendNotification(NotificationEntity notification);
}