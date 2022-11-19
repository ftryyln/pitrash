import 'package:calendar_view/calendar_view.dart';
import 'package:get/get.dart';

class ScheduleController extends GetxController {

  var eventController = EventController();

  setMingguAsEvent() {
    final event = CalendarEventData(
      date: DateTime(2021, 8, 10),
      event: "Event 1", title: 'Pickup',
    );

    eventController.add(event);
  }
}