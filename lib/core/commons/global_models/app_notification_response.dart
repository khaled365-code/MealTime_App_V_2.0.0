


class AppNotificationResponse
{
   AppNotificationResponse({
    this.id,
    this.actionId,
    this.input,
    this.payload,
  });

  /// The notification's id.
  ///
  /// This is nullable as support for this only supported for notifications
  /// created using version 10 or newer of this plugin.
  final int? id;

  /// The id of the action that was triggered.
  final String? actionId;

  /// The value of the input field if the notification action had an input
  /// field.
  final String? input;

  /// The notification's payload.
  final String? payload;

  /// The notification response type.
}