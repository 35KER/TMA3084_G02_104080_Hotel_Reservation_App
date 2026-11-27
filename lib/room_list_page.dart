import 'package:flutter/material.dart';

import 'room_type.dart';

class RoomListPage extends StatefulWidget {
  const RoomListPage({
    super.key,
    required this.preferred,
    required this.guests,
    required this.checkIn,
  });

  final RoomPreference preferred;
  final int guests;
  final String checkIn;

  @override
  State<RoomListPage> createState() => _RoomListPageState();
}

class _RoomListPageState extends State<RoomListPage> {
  late final List<RoomType> _rooms;

  @override
  void initState() {
    super.initState();
    _rooms = buildRooms(widget.preferred);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Choose Your Room')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: const Icon(
                Icons.calendar_month,
                color: Colors.deepPurple,
              ),
              title: Text('Check-in ${widget.checkIn}'),
              subtitle: Text('${widget.guests} guests'),
            ),
            ExpansionPanelList(
              expandedHeaderPadding: EdgeInsets.zero,
              elevation: 1,
              expansionCallback: (int index, bool isExpanded) {
                setState(() => _rooms[index].isExpanded = isExpanded);
              },
              children: _rooms.map<ExpansionPanel>((RoomType room) {
                return ExpansionPanel(
                  isExpanded: room.isExpanded,
                  canTapOnHeader: true,
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      leading: Icon(room.icon),
                      title: Text(room.name),
                    );
                  },
                  body: Padding(
                    padding: const EdgeInsets.only(
                      left: 56,
                      right: 16,
                      bottom: 12,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        room.description,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}