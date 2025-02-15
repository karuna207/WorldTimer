import "package:flutter/material.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    if (args != null) {
      data = data.isNotEmpty ? data : args; // Assign only if not null
    }


    bool isDay = data['isDay'] ?? false;

    String bgimage = isDay ? 'day.png' : 'night.png';
    Color? bgcolor = isDay ? Colors.blue[200] : Colors.indigo[800];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "WorldClock",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: bgcolor,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/$bgimage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: [
                ElevatedButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = result ?? {}; // Ensure result is not null
                    });
                  },
                  icon: Icon(Icons.edit_location),
                  label: Text('Edit Location'),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'] ?? 'Unknown Location', // Handle null location
                      style: TextStyle(
                        fontSize: 24,
                        letterSpacing: 2,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['time'] ?? '--:--', // Handle null time
                      style: TextStyle(
                        fontSize: 24,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
