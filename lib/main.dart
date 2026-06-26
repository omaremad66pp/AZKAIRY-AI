import 'package:flutter/material.dart';

void main() {
  runApp(const IslamicLifeApp());
}

class IslamicLifeApp extends StatelessWidget {
  const IslamicLifeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Islamic App',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0F0D),
      ),
      home: const MainLayout(),
    );
  }
}

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const AzkarCategoriesScreen(),
    const PrayerTimesScreen(),
    const QuranPlaceholderScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: const Color(0xFFD4AF37),
        unselectedItemColor: Colors.grey,
        backgroundColor: const Color(0xFF121B17),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'الأذكار'),
          BottomNavigationBarItem(icon: Icon(Icons.access_time), label: 'الصلاة'),
          BottomNavigationBarItem(icon: Icon(Icons.chrome_reader_mode), label: 'القرآن'),
        ],
      ),
    );
  }
}

class AzkarCategoriesScreen extends StatelessWidget {
  const AzkarCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {'title': 'أذكار الصباح', 'icon': Icons.wb_sunny, 'color': Colors.orange.shade900, 'data': [
        {'text': 'أَصْبَحْنَا وَأَصْبَحَ الْمُلْكُ لِلَّهِ وَالْحَمْدُ لِلَّهِ.', 'count': 1},
        {'text': 'آية الكرسي: اللَّهُ لَا إِلَٰهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ.', 'count': 1},
      ]},
      {'title': 'أذكار المساء', 'icon': Icons.brightness_3, 'color': Colors.purple.shade900, 'data': [
        {'text': 'أَمْسَيْنَا وَأَمْسَى الْمُلْكُ لِلَّهِ وَالْحَمْدُ لِلَّهِ.', 'count': 1},
        {'text': 'قُلْ هُوَ اللَّهُ أَحَدٌ... (3 مرات)', 'count': 3},
      ]},
      {'title': 'أذكار الصلاة', 'icon': Icons.mosque, 'color': const Color(0xFF1E3A2F), 'data': [
        {'text': 'أستغفر الله (ثلاثاً)، اللهم أنت السلام ومنك السلام.', 'count': 1},
        {'text': 'سبحان الله (33 مرة)، الحمد لله (33 مرة)، الله أكبر (33 مرة)', 'count': 33},
      ]},
      {'title': 'أذكار السفر', 'icon': Icons.flight_takeoff, 'color': Colors.blueGrey, 'data': [
        {'text': 'سُبْحَانَ الَّذِي سَخَّرَ لَنَا هَٰذَا وَمَا كُنَّا لَهُ مُقْرِنِينَ.', 'count': 1},
      ]},
      {'title': 'أذكار الملبس', 'icon': Icons.checkroom, 'color': Colors.brown, 'data': [
        {'text': 'الحَمْدُ للَّهِ الَّذِي كَسَانِي هَذَا الثَّوْبَ وَرَزَقَنِيهِ مِنْ غَيْرِ حَوْلٍ مِنِّي وَلَا قُوَّةٍ.', 'count': 1},
      ]},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('الأذكار اليومية', style: TextStyle(color: Color(0xFFD4AF37), fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF121B17),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Card(
              color: const Color(0xFF16221C),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: categories[index]['color'],
                  child: Icon(categories[index]['icon'], color: Colors.white),
                ),
                title: Text(categories[index]['title'], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xFFD4AF37)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AzkarDisplayScreen(
                        title: categories[index]['title'],
                        azkarList: categories[index]['data'],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class AzkarDisplayScreen extends StatefulWidget {
  final String title;
  final List<Map<String, dynamic>> azkarList;
  const AzkarDisplayScreen({super.key, required this.title, required this.azkarList});

  @override
  State<AzkarDisplayScreen> createState() => _AzkarDisplayScreenState();
}

class _AzkarDisplayScreenState extends State<AzkarDisplayScreen> {
  late List<int> _counts;

  @override
  void initState() {
    super.initState();
    _counts = widget.azkarList.map((e) => e['count'] as int).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(color: Color(0xFFD4AF37))),
        backgroundColor: const Color(0xFF121B17),
      ),
      body: ListView.builder(
        itemCount: widget.azkarList.length,
        itemBuilder: (context, index) {
          return Card(
            color: const Color(0xFF16221C),
            margin: const EdgeInsets.all(12),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    widget.azkarList[index]['text'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18, height: 1.6),
                  ),
                  const Divider(height: 25),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _counts[index] == 0 ? Colors.grey : const Color(0xFFD4AF37),
                    ),
                    onPressed: _counts[index] == 0 ? null : () {
                      setState(() {
                        _counts[index]--;
                      });
                    },
                    child: Text(_counts[index] == 0 ? 'تم الانتهاء ✓' : 'المتبقي: ${_counts[index]}'),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class PrayerTimesScreen extends StatelessWidget {
  const PrayerTimesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('مواقيت الصلاة', style: TextStyle(color: Color(0xFFD4AF37))),
        backgroundColor: const Color(0xFF121B17),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(25),
            color: const Color(0xFF121B17),
            child: const Column(
              children: [
                Text('الصلاة القادمة: العصر', style: TextStyle(color: Colors.white70, fontSize: 18)),
                SizedBox(height: 10),
                Text('متبقي 02:15:00', style: TextStyle(color: Color(0xFFD4AF37), fontSize: 28, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(15),
              children: const [
                PrayerTimeRow(name: 'الفجر', time: '04:12 ص', isNext: false),
                PrayerTimeRow(name: 'الظهر', time: '12:00 م', isNext: false),
                PrayerTimeRow(name: 'العصر', time: '03:20 م', isNext: true),
                PrayerTimeRow(name: 'المغرب', time: '06:45 م', isNext: false),
                PrayerTimeRow(name: 'العشاء', time: '08:15 م', isNext: false),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PrayerTimeRow extends StatelessWidget {
  final String name;
  final String time;
  final bool isNext;
  const PrayerTimeRow({super.key, required this.name, required this.time, required this.isNext});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isNext ? const Color(0xFF1E3A2F) : const Color(0xFF16221C),
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        title: Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: isNext ? const Color(0xFFD4AF37) : Colors.white)),
        trailing: Text(time, style: const TextStyle(fontSize: 16, color: Colors.white70, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class QuranPlaceholderScreen extends StatelessWidget {
  const QuranPlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('القرآن والمنبه الذكي', style: TextStyle(color: Color(0xFFD4AF37))), backgroundColor: const Color(0xFF121B17)),
      body: const Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.library_music, size: 80, color: Color(0xFFD4AF37)),
              SizedBox(height: 20),
              Text(
                'القرآن الكريم والأذان التلقائي',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 15),
              Text(
                'تمت تهيئة التصميم العصري بنجاح لاستقبال ملفات تشغيل القرآن وصوت الأذان والمنبه تلقائياً في التحديثات القادمة للبرنامج!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.white60, height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
