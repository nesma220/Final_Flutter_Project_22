import 'package:flutter/material.dart';

class MyCalendarPage extends StatelessWidget {
  const MyCalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> bookings = [
      {
        'title': 'House Cleaning',
        'client': 'Jenny Wilson',
        'status': 'Upcoming',
        'image': 'assets/cleaning.jpeg', 
      },
      {
        'title': 'Appliance Service',
        'client': 'Alex Nguyen',
        'status': 'Upcoming',
        'image': 'assets/appliance.jpeg', 
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Calendar'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'December 2024',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.calendar_today_outlined,
                              color: Colors.purple),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 7,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                      ),
                      itemCount: 31, 
                      itemBuilder: (context, index) {
                        final day = index + 1;
                        return Container(
                          decoration: BoxDecoration(
                            color: day == 23
                                ? Colors.purple
                                : Colors.grey[200], 
                            borderRadius: BorderRadius.circular(8),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '$day',
                            style: TextStyle(
                              color: day == 23 ? Colors.white : Colors.black54,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: bookings.isEmpty
                  ? const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.event_busy,
                          size: 64,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'You have no service booking on this date',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Service Booking (${bookings.length})',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text('See All'),
                            ),
                          ],
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: bookings.length,
                            itemBuilder: (context, index) {
                              final booking = bookings[index];
                              return Card(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage:
                                        AssetImage(booking['image']),
                                    radius: 24,
                                  ),
                                  title: Text(booking['title']),
                                  subtitle: Text(booking['client']),
                                  trailing: Chip(
                                    label: Text(
                                      booking['status'],
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: Colors.purple,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
