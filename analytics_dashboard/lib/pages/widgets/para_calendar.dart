import 'package:analytics_dashboard/data/dummy_data.dart';
import 'package:analytics_dashboard/themes/para_colors.dart';
import 'package:analytics_dashboard/themes/para_sizes.dart';
import 'package:analytics_dashboard/themes/para_text_styles.dart';
import 'package:analytics_dashboard/widgets/para_card.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
// import 'package:paracels/data/dummy_data.dart';
// import 'package:paracels/themes/themes.dart';
// import 'package:paracels/widgets/para_card.dart';

final workDayColor = ParaColors.selection;
final sickLeaveColor = ParaColors.error;
final vacationColor = ParaColors.valid;

class ParaCalendar extends StatelessWidget {
  const ParaCalendar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final new10to20 = DummyData.new10to20;
    final new20to100 = DummyData.new20to100;
    final new100andMore = DummyData.new100andMore;
    // DummyData d = DummyData();
    Map<String,int> dateMap = DummyData.getCurrentDate();
    // print(month);

    return ParaCard(
      paddingSpacing: ParaSizes.spacing2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CalendarDatePicker2(
            config: CalendarDatePicker2Config(
              currentDate: DateTime(dateMap["year"]!, dateMap["month"]!, dateMap["day"]!),
              calendarViewMode: CalendarDatePicker2Mode.day,
              weekdayLabels: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sat'],
              modePickersGap: 0,
              firstDayOfWeek: 1,
              dayTextStyle: ParaTextStyles.body2.copyWith(fontWeight: FontWeight.w600),
              todayTextStyle: ParaTextStyles.body2.copyWith(fontWeight: FontWeight.w600),
              selectedDayTextStyle:
                  ParaTextStyles.body2.copyWith(fontWeight: FontWeight.w500, color: ParaColors.background),
              centerAlignModePicker: true,
              weekdayLabelTextStyle: ParaTextStyles.body2Bold.copyWith(color: ParaColors.secondary),
              selectedDayHighlightColor: ParaColors.selection,
              calendarViewScrollPhysics: const NeverScrollableScrollPhysics(),
              disableModePicker: true,
              controlsTextStyle: ParaTextStyles.headline3,
              dayBuilder: ({required date, decoration, isDisabled, isSelected, isToday, textStyle}) {
                final isnew10to20 = new10to20.contains(date);
                final isnew20to100 = new20to100.contains(date);
                final isnew100andMore = new100andMore.contains(date);

                if (!isnew10to20 && !isnew20to100 && !isnew100andMore) {
                  return null;
                }

                Color? pointColor() {
                  if (isnew10to20) {
                    return workDayColor;
                  }
                  if (isnew20to100) {
                    return sickLeaveColor;
                  }
                  if (isnew100andMore) {
                    return vacationColor;
                  }
                  return null;
                }

                return Container(
                  decoration: decoration,
                  child: Center(
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Text(
                          MaterialLocalizations.of(context).formatDecimal(date.day),
                          style: textStyle,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 27.5),
                          child: Container(
                            height: 6,
                            width: 6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: pointColor(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            displayedMonthDate: DateTime(dateMap["year"]!, dateMap["month"]!, dateMap["day"]!),
            value: [DateTime(dateMap["year"]!, dateMap["month"]!, dateMap["day"]!)],
          ),
          Padding(
            padding: const EdgeInsets.all(ParaSizes.spacing24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: workDayColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(child: Text('10-20', style: ParaTextStyles.body3)),
                    ],
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: sickLeaveColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(child: Text('20-100', style: ParaTextStyles.body3)),
                    ],
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: vacationColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(child: Text('100+', style: ParaTextStyles.body3)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text("New users datewise"),
          ],)
        ],
      ),
    );
  }
}
