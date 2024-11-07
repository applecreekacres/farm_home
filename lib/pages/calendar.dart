import 'package:farm_home/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  List<NeatCleanCalendarEvent>? buildEvents(BuildContext context) {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("Calendar"),
      ),
      drawer: const FarmHomeDrawer(),
      body: SafeArea(
        child: Calendar(
          startOnMonday: true,
          weekDays: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
          eventsList: buildEvents(context),
          isExpandable: true,
          locale: "en_US",
          bottomBarArrowColor: Theme.of(context).colorScheme.primary,
          topRowIconColor: Theme.of(context).colorScheme.primary,
          eventDoneColor: Theme.of(context).colorScheme.secondary,
          selectedColor: Theme.of(context).colorScheme.primary,
          selectedTodayColor: Theme.of(context).colorScheme.secondary,
          todayColor: Theme.of(context).colorScheme.tertiary,
          eventColor: null,
          isExpanded: true,
          datePickerType: DatePickerType.date,
          dayOfWeekStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w800, fontSize: 11),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet<void>(
            context: context,
            showDragHandle: true,
            builder: (BuildContext context) {
              return RecordSelectWidget();
            }),
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.task),
      ),
    );
  }
}
