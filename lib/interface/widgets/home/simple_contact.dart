import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timezone/timezone.dart' as tz;

class SimpleContact extends StatefulWidget {
  const SimpleContact({super.key});

  @override
  State<SimpleContact> createState() => _SimpleContactState();
}

class _SimpleContactState extends State<SimpleContact> {
  late String selectedTimezone;
  late Map<String, String> timezonesMap;
  late List<String> timezones;
  late List<String> dropdownItems;
  late List<Widget> selectedItems;

  @override
  void initState() {
    timezonesMap = getAllTimezonesWithGMT();
    timezones = timezonesMap.keys.toList();
    selectedTimezone = timezonesMap[tz.local.name]!;

    dropdownItems = timezones.map<String>((String value) {
      return timezonesMap[value] ?? 'error';
    }).toList();

    selectedItems = timezones.map<Widget>((option) {
      return Text(
        timezonesMap[option]!,
        style: const TextStyle(
          color: Colors.white,
        ),
      );
    }).toList();

    super.initState();
  }

  Map<String, String> getAllTimezonesWithGMT() {
    Map<String, String> timezoneMap = {};
    for (String timezone in tz.timeZoneDatabase.locations.keys) {
      var location = tz.getLocation(timezone);
      var offset = location.currentTimeZone.offset;

      var offsetSeconds = (offset / 1000).truncate();
      var hours = (offsetSeconds / 3600).truncate();
      var minutes = ((offsetSeconds % 3600) / 60).truncate();

      var sign = hours >= 0 ? '+' : '-';
      var gmt = 'GMT$sign${hours.abs().toString().padLeft(2, '0')}:${minutes.abs().toString().padLeft(2, '0')}';

      timezoneMap[timezone] = '$timezone ($gmt)';

      timezoneMap[timezone] = '$timezone ($gmt)';
    }
    return timezoneMap;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            "Let's work on something together, you can book a meeting below or drop a dm on twitter",
            style: TextStyle(
              color: Colors.white,
              fontFamily: GoogleFonts.openSans().fontFamily,
            ),
          ),
        ),
        Text(
          "Book a meeting",
          style: TextStyle(
            color: Colors.white,
            fontFamily: GoogleFonts.openSans().fontFamily,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        SizedBox(
          width: size.width * 0.23,
          child: DropdownSearch<String>(
            // popUp desplegable de la lista de zonas horarias (aparece cuando se da click en el dropdown)
            popupProps: PopupProps.menu(
              showSelectedItems: true,
              showSearchBox: true,
              itemBuilder: (context, item, isSelected) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
                  child: Text(
                    item,
                    style: TextStyle(
                      color: isSelected ? Colors.green : Colors.white,
                    ),
                  ),
                );
              },
              listViewProps: const ListViewProps(
                padding: EdgeInsets.all(5.0),
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
              ),
              menuProps: MenuProps(
                borderRadius: BorderRadius.circular(12.0),
                backgroundColor: const Color(0xFF222222),
                elevation: 20,
                barrierColor: Colors.black.withOpacity(0.2),
                // positionCallback: (popupButtonObject, overlay) {
                //   return RelativeRect.fromRect(
                //     Rect.fromPoints(
                //       popupButtonObject.localToGlobal(
                //         const Offset(0, 100),
                //         ancestor: overlay,
                //       ),
                //       popupButtonObject.localToGlobal(
                //         popupButtonObject.size.bottomRight(Offset.zero) + const Offset(50, 100),
                //         ancestor: overlay,
                //       ),
                //     ),
                //     Offset.zero & overlay.size,
                //   );
                // },
              ),
              searchFieldProps: TextFieldProps(
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  hintText: 'Search your location',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              scrollbarProps: ScrollbarProps(
                thickness: 8.0,
                radius: const Radius.circular(3.0),
                thumbColor: Colors.green.withOpacity(0.8),
              ),
            ),
            items: dropdownItems,
            dropdownBuilder: (context, selectedItem) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      selectedItem ?? "errror",
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            },
            dropdownDecoratorProps: DropDownDecoratorProps(
              baseStyle: TextStyle(color: Colors.white),
              dropdownSearchDecoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
            dropdownButtonProps: const DropdownButtonProps(
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.white,
              ),
            ),
            onChanged: print,
            selectedItem: selectedTimezone,
          ),
        ),
        Container(
          height: 300,
          color: Colors.red,
          width: size.width,
        )
      ],
    );
  }
}
