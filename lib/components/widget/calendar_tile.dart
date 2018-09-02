import 'package:flutter/material.dart';
import 'package:date_utils/date_utils.dart';

class CalendarTile extends StatelessWidget {
  final VoidCallback onDateSelected;
  final DateTime date;
  final String dayOfWeek;
  final bool isDayOfWeek;
  final bool isSelected;
  final bool libur;
  final TextStyle dayOfWeekStyles;
  final TextStyle dateStyles;
  final Widget child;

  CalendarTile({
    this.onDateSelected,
    this.date,
    this.child,
    this.libur,
    this.dateStyles,
    this.dayOfWeek,
    this.dayOfWeekStyles,
    this.isDayOfWeek: false,
    this.isSelected: false,
  });

  Widget renderDateOrDayOfWeek(BuildContext context) {
    if (isDayOfWeek) {
      return new InkWell(
        child: new Container(
          alignment: Alignment.center,
          child: new Text(
            dayOfWeek,
            style: dayOfWeekStyles,
          ),
        ),
      );
    } else {
      return Container(
        color: Colors.grey[200],
        child: new InkWell(
          onTap: onDateSelected,
          child: new Container(
            decoration: isSelected
                ? new BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Theme.of(context).primaryColor,
                  )
                : new BoxDecoration(),
            alignment: Alignment.center,
            child: new Text(
              Utils.formatDay(date).toString(),
              style: new TextStyle(
                  color: date.month < DateTime.now().month ||
                          date.weekday == 6 ||
                          date.weekday == 7
                      ? Colors.grey[400]
                      : date.day < DateTime.now().day
                          ? Colors.grey[400]
                          : isSelected ? Colors.white : Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (child != null) {
      return child;
    }
    return new Container(
      decoration: new BoxDecoration(
        color: Colors.white,
      ),
      child: renderDateOrDayOfWeek(context),
    );
  }
}
