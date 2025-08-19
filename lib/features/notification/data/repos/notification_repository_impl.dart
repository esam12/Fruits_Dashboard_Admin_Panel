import 'package:cloud_functions/cloud_functions.dart';
import 'package:fruits_hub_admin/core/services/data_service.dart';
import 'package:fruits_hub_admin/core/utils/constants/backend_end_points.dart';
import 'package:fruits_hub_admin/features/notification/data/model/notification_model.dart';
import 'package:fruits_hub_admin/features/notification/domain/entity/notification_entity.dart';
import 'package:fruits_hub_admin/features/notification/domain/repos/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final DatabaseService databaseService;

  NotificationRepositoryImpl(this.databaseService);

  @override
  Future<void> sendNotification(NotificationEntity notification) async {
    final model = NotificationModel(
      id: notification.id,
      title: notification.title,
      message: notification.message,
      date: notification.date,
      isRead: notification.isRead,
    );

    await databaseService.addData(
      path: BackendEndPoints.notifications,
      docuementId: notification.id,
      data: model.toMap(),
    );
    final users = await databaseService.getData(path: BackendEndPoints.users);

    final callable =
        FirebaseFunctions.instance.httpsCallable('sendNotification');

    for (var user in users) {
      final token = user["fcmToken"];
      print("Sending notification to token: $token");
      print("Title: ${notification.title}, Body: ${notification.message}");

      // final userId = user["id"]; // إذا كنت مسجل id مع البيانات
      if (token != null) {
        await callable.call({
          "title": notification.title,
          "body": notification.message,
          "token": token,
        });
      }
    }
  }
}
