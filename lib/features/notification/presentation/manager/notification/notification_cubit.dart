import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_admin/features/notification/domain/entity/notification_entity.dart';
import 'package:fruits_hub_admin/features/notification/domain/repos/notification_repository.dart';
import 'package:meta/meta.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepository notificationRepository;
  NotificationCubit(this.notificationRepository) : super(NotificationInitial());

  void sendNotification(NotificationEntity notification) async {
    emit(NotificationLoading());
    await notificationRepository.sendNotification(notification);
    emit(NotificationSent());
  }
}
