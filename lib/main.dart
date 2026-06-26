import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const IslamicLifeApp());
}

class IslamicLifeApp extends StatelessWidget {
  const IslamicLifeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'حياة المسلم الذكية',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0F0D),
        primaryColor: const Color(0xFF1E3A2F),
      ),
      home: const WelcomeScreen(),
    );
  }
}

// شاشة الترحيب والصلاة على النبي عند فتح التطبيق
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainLayout()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.mosque_rounded, size: 100, color: Color(0xFFD4AF37)),
            SizedBox(height: 30),
            Text(
              'عـَلـَيْهِ الصَّلَاةُ وَالسَّلَامُ',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFFD4AF37), letterSpacing: 1),
            ),
            SizedBox(height: 10),
            Text(
              'اللَّهُمَّ صَلِّ وَسَلِّمْ عَلَى نَبِيِّنَا مُحَمَّدٍ',
              style: TextStyle(fontSize: 18, color: Colors.white70),
            ),
            SizedBox(height: 40),
            CircularProgressIndicator(color: Color(0xFFD4AF37)),
          ],
        ),
      ),
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
    const QuranScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _screens[_selectedIndex],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Color(0xFF1E3A2F), width: 0.5)),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          selectedItemColor: const Color(0xFFD4AF37),
          unselectedItemColor: Colors.grey.shade500,
          backgroundColor: const Color(0xFF121E18),
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.menu_book_rounded), label: 'الأذكار'),
            BottomNavigationBarItem(icon: Icon(Icons.access_time_filled_rounded), label: 'المواقيت وباقي كام ساعة'),
            BottomNavigationBarItem(icon: Icon(Icons.import_contacts_rounded), label: 'القرآن الكريم'),
          ],
        ),
      ),
    );
  }
}

class AzkarCategoriesScreen extends StatelessWidget {
  const AzkarCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {
        'title': 'أذكار الصباح',
        'icon': Icons.wb_sunny_rounded,
        'color': Colors.amber.shade800,
        'data': [
          {'text': 'أَصْبَحْنَا وَأَصْبَحَ الْمُلْكُ لِلَّهِ وَالْحَمْدُ لِلَّهِ، لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ.', 'count': 1},
          {'text': 'اللَّهُ Lا إِلَهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ (آية الكرسي)', 'count': 1},
          {'text': 'قُلْ هُوَ اللَّهُ أَحَدٌ • قُل *عوذ برب الفلق • قُل أَعُوذُ بِرَبِّ النَّاسِ (3 مرات)', 'count': 3},
          {'text': 'بِسْمِ اللَّهِ الَّذِي لَا يَضُرُّ مَعَ اسْمِهِ شَيْءٌ فِي الْأَرْضِ وَلَا فِي السَّمَاءِ.', 'count': 3},
        ]
      },
      {
        'title': 'أذكار المساء',
        'icon': Icons.mode_night_rounded,
        'color': Colors.indigo.shade400,
        'data': [
          {'text': 'أَمْسَيْنَا وَأَمْسَى الْمُلْكُ لِلَّهِ وَالْحَمْدُ لِلَّهِ.', 'count': 1},
          {'text': 'اللَّهُمَّ بِكَ أَمْسَيْنَا، وَبِكَ أَصْبَحْنَا، وَبِكَ نَحْيَا، وَبِكَ نَمُوتُ.', 'count': 1},
          {'text': 'أَعُوذُ بِكَلِمَاتِ اللَّهِ التَّامَّاتِ مِنْ شَرِّ مَا خَلَقَ.', 'count': 3},
        ]
      },
      {
        'title': 'أذكار بعد الصلاة',
        'icon': Icons.mosque_rounded,
        'color': const Color(0xFF2E6F40),
        'data': [
          {'text': 'أستغفر الله (ثلاثاً)، اللهم أنت السلام ومنك السلام تباركت يا ذا الجلال والإكرام.', 'count': 1},
          {'text': 'سبحان الله (33 مرة)', 'count': 33},
          {'text': 'الحمد لله (33 مرة)', 'count': 33},
          {'text': 'الله أكبر (33 مرة)', 'count': 33},
        ]
      },
      {
        'title': 'أذكار السفر',
        'icon': Icons.flight_takeoff_rounded,
        'color': Colors.blueGrey,
        'data': [
          {'text': 'الله أكبر، الله أكبر، الله أكبر، سُبْحَانَ الَّذِي سَخَّرَ لَنَا هَٰذَا وَمَا كُنَّا لَهُ مُقْرِنِينَ وَإِنَّا إِلَىٰ رَبِّنَا لَمُنقَلِبُونَ.', 'count': 1},
        ]
      },
      {
        'title': 'أذكار الملبس',
        'icon': Icons.checkroom_rounded,
        'color': Colors.brown.shade400,
        'data': [
          {'text': 'الْحَمْدُ لِلَّهِ الَّذِي كَسَانِي هَذَا (الثَّوْبَ) وَرَزَقَنِيهِ مِنْ غَيْرِ حَوْلٍ مِنِّي وَلَا قُوَّةٍ.', 'count': 1},
        ]
      }
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('الأذكار اليومية الشاملة', style: TextStyle(color: Color(0xFFD4AF37), fontWeight: FontWeight.bold, fontSize: 20)),
        backgroundColor: const Color(0xFF121E18),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF16271F),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: const Color(0xFF233D30)),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              leading: Icon(categories[index]['icon'], color: categories[index]['color'], size: 28),
              title: Text(categories[index]['title'], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              trailing: const Icon(Icons.arrow_forward_ios_rounded, color: Color(0xFFD4AF37), size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AzkarDisplayScreen(title: categories[index]['title'], azkarList: categories[index]['data']),
                  ),
                );
              },
            ),
          );
        },
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
        backgroundColor: const Color(0xFF121E18),
        iconTheme: const IconThemeData(color: Color(0xFFD4AF37)),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: widget.azkarList.length,
        itemBuilder: (context, index) {
          final bool isDone = _counts[index] == 0;
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: isDone ? const Color(0xFF0F1B15) : const Color(0xFF16271F),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: const Color(0xFF233D30)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(widget.azkarList[index]['text'], textAlign: TextAlign.center, style: const TextStyle(fontSize: 19, height: 1.7)),
                  const Divider(height: 30, color: Color(0xFF233D30)),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: isDone ? Colors.grey.shade800 : const Color(0xFFD4AF37)),
                      onPressed: isDone ? null : () => setState(() => _counts[index]--),
                      child: Text(isDone ? 'تم الانتهاء ✓' : 'المتبقي للتكرار: ${_counts[index]}', style: TextStyle(fontSize: 16, color: isDone ? Colors.white38 : Colors.black, fontWeight: FontWeight.bold)),
                    ),
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

class PrayerTimesScreen extends StatefulWidget {
  const PrayerTimesScreen({super.key});

  @override
  State<PrayerTimesScreen> createState() => _PrayerTimesScreenState();
}

class _PrayerTimesScreenState extends State<PrayerTimesScreen> {
  late Timer _timer;
  String _timeString = '';
  String _countdownString = '';

  // مواقيت الصلاة الافتراضية الثابتة للحساب التنازلي الذكي
  final List<Map<String, dynamic>> prayers = [
    {'name': 'الفجر', 'hour': 4, 'minute': 15, 'timeText': '04:15 ص'},
    {'name': 'الشروق', 'hour': 5, 'minute': 55, 'timeText': '05:55 ص'},
    {'name': 'الظهر', 'hour': 12, 'minute': 5, 'timeText': '12:05 م'},
    {'name': 'العصر', 'hour': 15, 'minute': 40, 'timeText': '03:40 م'},
    {'name': 'المغرب', 'hour': 18, 'minute': 55, 'timeText': '06:55 م'},
    {'name': 'العشاء', 'hour': 20, 'minute': 25, 'timeText': '08:25 م'},
  ];

  @override
  void initState() {
    super.initState();
    _updateClock();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) => _updateClock());
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateClock() {
    final now = DateTime.now();
    
    // 1. تحديث الساعة الحالية
    String hours = now.hour.toString().padLeft(2, '0');
    String minutes = now.minute.toString().padLeft(2, '0');
    String seconds = now.second.toString().padLeft(2, '0');
    
    // 2. حساب الوقت المتبقي لأقرب صلاة قادمة (ذكياً)
    Duration minDifference = const Duration(days: 1);
    String nextPrayerName = "الفجر";

    for (var prayer in prayers) {
      var prayerTime = DateTime(now.year, now.month, now.day, prayer['hour'], prayer['minute']);
      if (prayerTime.isAfter(now)) {
        var diff = prayerTime.difference(now);
        if (diff < minDifference) {
          minDifference = diff;
          nextPrayerName = prayer['name'];
        }
      }
    }

    // تنسيق عرض الوقت المتبقي بالساعات والدقائق
    int diffHours = minDifference.inHours;
    int diffMinutes = minDifference.inMinutes.remainder(60);
    int diffSeconds = minDifference.inSeconds.remainder(60);

    setState(() {
      _timeString = "$hours:$minutes:$seconds";
      _countdownString = "متبقي $diffHours ساعة و $diffMinutes دقيقة على صلاة $nextPrayerName";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('مواقيت الصلاة الذكية', style: TextStyle(color: Color(0xFFD4AF37), fontWeight: FontWeight.bold)), backgroundColor: const Color(0xFF121E18), centerTitle: true),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(25),
            color: const Color(0xFF121E18),
            child: Column(
              children: [
                Text(_timeString, style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 2)),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(color: const Color(0xFF1E3A2F), borderRadius: BorderRadius.circular(10)),
                  child: Text(_countdownString, textAlign: TextAlign.center, style: const TextStyle(color: Color(0xFFD4AF37), fontSize: 15, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: prayers.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(color: const Color(0xFF16271F), borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    title: Text(prayers[index]['name'], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    trailing: Text(prayers[index]['timeText'], style: const TextStyle(fontSize: 16, color: Colors.white70)),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> surahs = [
      {'name': 'سورة الفاتحة', 'verses': '7 آيات'},
      {'name': 'سورة الإخلاص', 'verses': '4 آيات'},
      {'name': 'سورة الفلق', 'verses': '5 آيات'},
      {'name': 'سورة الناس', 'verses': '6 آيات'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('القرآن الكريم كامل للقراءة', style: TextStyle(color: Color(0xFFD4AF37), fontWeight: FontWeight.bold)), backgroundColor: const Color(0xFF121E18), centerTitle: true),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: surahs.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(color: const Color(0xFF16271F), borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: CircleAvatar(backgroundColor: const Color(0xFF1E3A2F), child: Text('${index+1}', style: const TextStyle(color: Color(0xFFD4AF37)))),
              title: Text(surahs[index]['name']!, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text(surahs[index]['verses']!),
              trailing: const Icon(Icons.chrome_reader_mode_rounded, color: Color(0xFFD4AF37)),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SurahView(title: surahs[index]['name']!))),
            ),
          );
        },
      ),
    );
  }
}

class SurahView extends StatelessWidget {
  final String title;
  const SurahView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    String content = "";
    if (title == "سورة الفاتحة") {
      content = "بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ ﴿١﴾ الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ ﴿٢﴾ الرَّحْمَٰنِ الرَّحِيمِ ﴿٣﴾ مَالِكِ يَوْمِ الدِّينِ ﴿٤﴾ إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ ﴿٥﴾ اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ ﴿٦﴾ صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّينَ ﴿٧﴾";
    } else if (title == "سورة الإخلاص") {
      content = "بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ قُل| هُوَ اللَّهُ أَحَدٌ ﴿١﴾ اللَّهُ الصَّمَدُ ﴿٢﴾ لَمْ يَلِدْ وَلَمْ يُولَدْ ﴿٣﴾ وَمَلْ يَكُن لَّهُ كُفُوًا أَحَدٌ ﴿٤﴾";
    } else if (title == "سورة الفلق") {
      content = "بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ قُلْ أَعُوذُ بِرَبِّ الْفَلَقِ ﴿١﴾ مِن شَرِّ مَا خَلَقَ ﴿٢﴾ وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ ﴿٣﴾ وَمِن شَرِّ النَّفَّاثَاتِ فِي الْعُقَدِ ﴿٤﴾ وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ ﴿٥﴾";
    } else if (title == "سورة الناس") {
      content = "بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ قُلْ أَعُوذُ بِرَبِّ النَّاسِ ﴿١﴾ مَلِكِ النَّاسِ ﴿٢﴾ إِلَٰهِ النَّاسِ ﴿٣﴾ مِن شَرِّ الْوَسْوَاسِ الْخَنَّاسِ ﴿٤﴾ الَّذِي يُوَسْوِسُ فِي صُدُورِ النَّاسِ ﴿٥﴾ مِنَ الْجِنَّةِ وَالنَّاسِ ﴿٦﴾";
    }

    return Scaffold(
      appBar: AppBar(title: Text(title, style: const TextStyle(color: Color(0xFFD4AF37))), backgroundColor: const Color(0xFF121E18)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(color: const Color(0xFF16271F), borderRadius: BorderRadius.circular(20)),
          child: Text(content, textAlign: TextAlign.center, style: const TextStyle(fontSize: 22, height: 2.1, color: Colors.white)),
        ),
      ),
    );
  }
}
