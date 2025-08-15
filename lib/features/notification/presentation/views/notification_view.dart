import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_admin/core/services/get_it_service.dart';
import 'package:fruits_hub_admin/core/utils/constants/app_colors.dart';
import 'package:fruits_hub_admin/core/utils/constants/app_text_styles.dart';
import 'package:fruits_hub_admin/features/notification/domain/entity/notification_entity.dart';
import 'package:fruits_hub_admin/features/notification/domain/repos/notification_repository.dart';
import 'package:fruits_hub_admin/features/notification/presentation/manager/notification/notification_cubit.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  static const routeName = 'notification';

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();
  bool _isImportant = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationCubit(getIt.get<NotificationRepository>()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Send Notification",
            style: TextStyles.bold19,
          ),
          centerTitle: true,
        ),
        body: BlocConsumer<NotificationCubit, NotificationState>(
          listener: (context, state) {
            if (state is NotificationSent) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Notification sent successfully!')),
              );
              _titleController.clear();
              _bodyController.clear();
              setState(() => _isImportant = false);
            } else if (state is NotificationError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            final isLoading = state is NotificationLoading;

            return Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    const Text(
                      "Create New Notification",
                      style: TextStyles.bold19,
                    ),
                    const SizedBox(height: 20),

                    // Title field
                    TextFormField(
                      controller: _titleController,
                      decoration: const InputDecoration(
                        labelText: "Title",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.title),
                      ),
                      validator: (value) =>
                          value == null || value.isEmpty ? 'Enter title' : null,
                    ),
                    const SizedBox(height: 16),

                    // Body field
                    TextFormField(
                      controller: _bodyController,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        labelText: "Body",
                        border: OutlineInputBorder(),
                        alignLabelWithHint: true,
                        prefixIcon: Icon(Icons.message),
                      ),
                      validator: (value) =>
                          value == null || value.isEmpty ? 'Enter body' : null,
                    ),
                    const SizedBox(height: 16),

                    // Important checkbox
                    CheckboxListTile(
                      value: _isImportant,
                      onChanged: (value) =>
                          setState(() => _isImportant = value ?? false),
                      title: const Text("Mark as Important"),
                      secondary:
                          const Icon(Icons.priority_high, color: Colors.red),
                      contentPadding: EdgeInsets.zero,
                    ),
                    const SizedBox(height: 20),

                    // Submit button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton.icon(
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        icon: isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : const Icon(Icons.send, color: Colors.white),
                        label: Text(
                          isLoading ? "Sending..." : "Send Notification",
                          style: TextStyles.bold16
                              .copyWith(color: AppColors.whiteColor),
                        ),
                        onPressed: isLoading
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  NotificationEntity notification =
                                      NotificationEntity(
                                    title: _titleController.text,
                                    message: _bodyController.text,
                                    isRead: false,
                                    date: DateTime.now(),
                                    id: DateTime.now()
                                        .millisecondsSinceEpoch
                                        .toString(),
                                  );
                                  context
                                      .read<NotificationCubit>()
                                      .sendNotification(notification);
                                }
                              },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
