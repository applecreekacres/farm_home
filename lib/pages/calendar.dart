import 'package:farm_home/providers/providers.dart';
import 'package:farm_home/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:provider/provider.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _currentMonth = DateTime.now();

  Future<List<NeatCleanCalendarEvent>> buildEvents(BuildContext context) async {
    List<NeatCleanCalendarEvent> events;
    var recProvider = Provider.of<RecordProvider>(context);
    DateTime monthStart =
        DateTime.utc(_currentMonth.year, _currentMonth.month, 1);
    DateTime monthEnd =
        DateTime.utc(_currentMonth.year, _currentMonth.month + 1, 1);

    var neat = await recProvider.getRecordsInDateRange(monthStart, monthEnd);

    return neat
        .map(
          (event) => NeatCleanCalendarEvent(
            event.title,
            startTime: event.timestamp!,
            endTime: event.timestamp!,
            isAllDay: true,
            // icon: RecordConstants.recordInfo.where((info) => info.name == event.itemName()).first.icon,
            isDone: event.isDone,
            description: event.notes,
            id: event.itemName(),
          ),
        )
        .toList();
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
        child: FutureWidget(
          future: buildEvents(context),
          onLoading: () => Center(child: CircularProgressIndicator()),
          onData: (data) {
            return Calendar(
              startOnMonday: false,
              weekDays: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
              eventsList: data,
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
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 11),
              onDateSelected: (date) {},
              onEventSelected: (date) {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => RecordConstants.recordInfo
                //         .where((ref) => ref.name == date.id)
                //         .first
                //         .edit(data)!,
                //   ),
                // );
              },
              onMonthChanged: (date) {
                setState(() {
                  _currentMonth = date;
                });
              },
            );
          },
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
