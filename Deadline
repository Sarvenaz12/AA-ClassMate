import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:deadline_tracker/models/deadline.dart';
import 'package:deadline_tracker/services/database_service.dart';
import 'package:deadline_tracker/screens/add_edit_deadline_screen.dart';

class DeadlineTracker extends StatefulWidget {
  const DeadlineTracker({Key? key}) : super(key: key);

  @override
  _DeadlineTrackerState createState() => _DeadlineTrackerState();
}

class _DeadlineTrackerState extends State<DeadlineTracker> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<Deadline>> _deadlines = {};

  @override
  void initState() {
    super.initState();
    _loadDeadlines();
  }

  _loadDeadlines() async {
    final data = await DatabaseService().getDeadlines();
    setState(() {
      _deadlines = data;
    });
  }

  _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });
  }

  _onFormatChanged(CalendarFormat format) {
    setState(() {
      _calendarFormat = format;
    });
  }

  _onAddDeadline() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddEditDeadlineScreen(),
      ),
    );
    _loadDeadlines();
  }

  _onEditDeadline(Deadline deadline) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddEditDeadlineScreen(deadline: deadline),
      ),
    );
    _loadDeadlines();
  }

  _onDeleteDeadline(Deadline deadline) async {
    await DatabaseService().deleteDeadline(deadline.id!);
    _loadDeadlines();
  }

  _showDeadlineDialog(Deadline deadline) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(deadline.title),
          content: Text(deadline.description),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _onEditDeadline(deadline);
              },
              child: Text('Edit'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _onDeleteDeadline(deadline);
              },
              child: Text('Delete'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
