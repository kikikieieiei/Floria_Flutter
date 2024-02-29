import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:table_calendar/table_calendar.dart';

// Define an interface for the holiday fetcher
abstract class HolidayFetcher {
  Future<Map<DateTime, List<dynamic>>> fetchPublicHolidays(
      int year, String countryCode);
}

// Implement the HolidayFetcher interface
class NagerHolidayFetcher implements HolidayFetcher {
  @override
  Future<Map<DateTime, List<dynamic>>> fetchPublicHolidays(
      int year, String countryCode) async {
    final response = await http.get(Uri.parse(
        'https://date.nager.at/api/v3/PublicHolidays/$year/$countryCode'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      List<dynamic> holidays = jsonDecode(response.body);
      // Convert the list of holidays into a map of DateTime to List<dynamic>
      Map<DateTime, List<dynamic>> holidayMap = {};
      for (var holiday in holidays) {
        DateTime holidayDate = DateTime.parse(holiday['date']);
        holidayMap[holidayDate] = holidayMap[holidayDate] ?? [];
        holidayMap[holidayDate]!.add(holiday);
      }
      return holidayMap;
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load public holidays');
    }
  }
}

class Calendar extends StatefulWidget {
  @override
  _HolidayScreenState createState() => _HolidayScreenState();
}

class _HolidayScreenState extends State<Calendar> {
  Map<DateTime, List<dynamic>> holidays = {};
  bool isLoading = false;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    fetchHolidays(_focusedDay.year, _focusedDay.month);
  }

  Future<void> fetchHolidays(int year, int month) async {
    setState(() {
      isLoading = true;
    });
    try {
      // Create an instance of the NagerHolidayFetcher
      final holidayFetcher = NagerHolidayFetcher();
      // Use the interface method to fetch holidays
      holidays = await holidayFetcher.fetchPublicHolidays(year, 'US');
      // Filter holidays for the selected month
      holidays.removeWhere((key, value) => key.month != month);
    } catch (e) {
      print('Error: $e');
      // Handle error accordingly, for example showing an error message
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xffC33355),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          'Upcoming Holiday Events',
          style: TextStyle(
              color: Color(0xffC33355),
              // fontFamily: "Yeseva One",
              fontWeight: FontWeight.bold),
        ),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(color: Color(0xffC33355)),
            )
          : Column(
              children: [
                TableCalendar(
                  firstDay: DateTime.utc(2024, 1, 1),
                  lastDay: DateTime.utc(2024, 12, 31),
                  focusedDay: _focusedDay,
                  calendarFormat: _calendarFormat,
                  headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleTextStyle: TextStyle(
                          color: Color(0xffC33355),
                          fontSize: 18,
                          // fontFamily: "Yeseva One",
                          fontWeight: FontWeight.bold),
                      titleCentered: true),
                  calendarStyle: CalendarStyle(
                    defaultTextStyle: TextStyle(color: Colors.black),
                    weekendTextStyle: TextStyle(color: Colors.red),
                    todayTextStyle: TextStyle(color: Colors.white),
                    todayDecoration: BoxDecoration(
                        color: Color(0xffC33355), shape: BoxShape.circle),
                  ),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _focusedDay = selectedDay;
                      fetchHolidays(selectedDay.year, selectedDay.month);
                    });
                  },
                  eventLoader: (day) => holidays[day] ?? [],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: holidays.length,
                    itemBuilder: (context, index) {
                      final eventDate = holidays.keys.elementAt(index);
                      final events = holidays[eventDate];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20, left: 18),
                            child: Text(
                              '${eventDate.day}/${eventDate.month}/${eventDate.year}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          for (var event in events!)
                            ListTile(
                              title: Text(
                                event['name'],
                                style: TextStyle(color: Color(0xffC33355)),
                              ),
                              subtitle: Text(event['date']),
                            ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
