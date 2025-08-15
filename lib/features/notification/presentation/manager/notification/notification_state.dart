part of 'notification_cubit.dart';

@immutable
sealed class NotificationState {}

final class NotificationInitial extends NotificationState {}

final class NotificationLoading extends NotificationState {}

final class NotificationSent extends NotificationState {}

final class NotificationError extends NotificationState {
  final String message;
  NotificationError({required this.message});
}
