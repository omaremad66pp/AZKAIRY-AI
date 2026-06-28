import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const AzkariAIApp());
}

class AzkariAIApp extends StatefulWidget {
  const AzkariAIApp({Key? key}) : super(key: key);

  @override
  State<AzkariAIApp> createState() => _AzkariAIAppState();
}

class _AzkariAIAppState extends State<AzkariAIApp> {
  final ThemeMode _themeMode = ThemeMode.dark;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'أذكاري AI',
      themeMode: _themeMode,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFF5F6FA),
        primaryColor: const Color(0xFF4A37A0),
        cardColor: Colors.white,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0B0D16),
        primaryColor: const Color(0xFF6C5DD3),
        cardColor: const Color(0xFF141724),
      ),
      home: const DailyWirdSplashScreen(),
    );
  }
}

class DailyWirdSplashScreen extends StatelessWidget {
  const DailyWirdSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0B0D16), Color(0xFF1C1B35)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.auto_awesome, size: 80, color: Colors.amber),
                const SizedBox(height: 20),
                const Text(
                  '✨ وردك اليومي المبارك ✨',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.amber),
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.amber.withOpacity(0.3)),
                  ),
                  child: const Text(
                    '📌 آية اليوم:\n"وَاصْبِرْ لِحُكْمِ رَبِّكَ فَإِنَّكَ بِأَعْيُنِنَا ۖ وَسَبِّحْ بِحَمْدِ رَبِّكَ حِينَ تَقُومُ"\n\n💡 ذكر اليوم:\nأستغفر الله العظيم وأتوب إليه (100 مرة)',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, height: 1.6, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6C5DD3),
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    shape: BorderRadius.circular(30),
                  ),
                  icon: const Icon(Icons.mosque, color: Colors.white),
                  label: const Text('دخول أذكاري AI', style: TextStyle(fontSize: 18, color: Colors.white)),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const MainLayoutScreen()),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({Key? key}) : super(key: key);

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  int _currentIndex = 4;

  final List<Widget> _tabs = [
    const SettingsTab(),
    const AISmartTab(),
    const QuranTab(),
    const AzkarTab(),
    const PrayerTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF111322),
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white54,
        selectedFontSize: 12,
        unselectedFontSize: 11,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'الإعدادات'),
          BottomNavigationBarItem(icon: Icon(Icons.psychology), label: 'أذكاري AI'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'القرآن'),
          BottomNavigationBarItem(icon: Icon(Icons.brightness_7), label: 'الأذكار'),
          BottomNavigationBarItem(icon: Icon(Icons.access_time_filled), label: 'الصلاة'),
        ],
      ),
    );
  }
}

class PrayerTab extends StatefulWidget {
  const PrayerTab({Key? key}) : super(key: key);
  @override
  State<PrayerTab> createState() => _PrayerTabState();
}

class _PrayerTabState extends State<PrayerTab> {
  double _compassAngle = 0.4;
  int _scorePoints = 150;
  final Map<String, bool> _trackedPrayers = {
    "الفجر": true, "الظهر": false, "العصر": false, "المغرب": false, "العشاء": false
  };

  void _showAdhanSettings(String prayerName) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF141724),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('إعدادات أذان صلاة $prayerName', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.amber)),
              const Divider(color: Colors.white24),
              ListTile(
                leading: const Icon(Icons.volume_up, color: Colors.amber),
                title: const Text('مستوى صوت الأذان'),
                trailing: SizedBox(width: 150, child: Slider(value: 0.8, onChanged: (v) {}, activeColor: Colors.amber)),
              ),
              SwitchListTile(title: const Text('تفعيل صوت التنبيه'), value: true, onChanged: (v) {}, activeColor: Colors.amber),
              SwitchListTile(title: const Text('التفعيل في الوضع الصامت'), value: true, onChanged: (v) {}, activeColor: Colors.amber),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF6C5DD3)),
                onPressed: () => Navigator.pop(context),
                child: const Text('حفظ التفضيلات', style: TextStyle(color: Colors.white)),
              )
            ],
          ),
        );
      },
    );
  }

  void _showPrayerDetails(String name, String fadl, String hadith, String azkar) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF141724),
        title: Text('فضائل صلاة $name', textAlign: TextAlign.center, style: const TextStyle(color: Colors.amber)),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('💡 فضلها:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.amber)),
              Text(fadl, textDirection: TextDirection.rtl),
              const SizedBox(height: 10),
              const Text('📜 حديث شريف:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.amber)),
              Text(hadith, textDirection: TextDirection.rtl),
              const SizedBox(height: 10),
              const Text('📿 أذكارها المنصوح بها:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.amber)),
              Text(azkar, textDirection: TextDirection.rtl),
            ],
          ),
        ),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('تم', style: TextStyle(color: Colors.amber)))],
      ),
    );
  }

  void _startSmartAlarmChallenge() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF141724),
        title: const Text('🚨 تحدي الفجر الرياضي الذكي', textAlign: TextAlign.center, style: TextStyle(color: Colors.redAccent)),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('المنبه لن يتوقف! أجب عن الأسئلة لفك القفل بنجاح:', textAlign: TextAlign.center),
            SizedBox(height: 15),
            Text('السؤال 1: ما هي أول صلاة فرضت في الإسلام؟', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('صلاة الفجر')),
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('صلاة الظهر')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('أوقات الصلاة والقبلة'), backgroundColor: const Color(0xFF111322), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 140,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(16)),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('الصلاة القادمة: العصر', style: TextStyle(fontSize: 14, color: Colors.white60)),
                        SizedBox(height: 5),
                        Text('خلال 01:24:05', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.amber)),
                        SizedBox(height: 5),
                        Text('الأحد ٢٨ يونيو ٢٠٢٦', style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onPanUpdate: (d) => setState(() => _compassAngle += d.delta.dx * 0.01),
                  child: Container(
                    width: 140, height: 140,
                    decoration: BoxDecoration(color: Theme.of(context).cardColor, shape: BoxShape.circle),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Transform.rotate(angle: _compassAngle, child: const Icon(Icons.explore, size: 90, color: Colors.amber)),
                        const Positioned(top: 10, child: Text('🕋 القبلة', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold))),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Align(alignment: Alignment.centerRight, child: Text('مواقيت الصلاة اليومية', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
            const SizedBox(height: 10),
            _buildPrayerCard('الفجر', '04:05 ص', '🌅', 'أول البركات ونور للوجه', 'من صلى الفجر في جماعة فهو في ذمة الله', 'اللهم بك أصبحنا.. آية الكرسي'),
            _buildPrayerCard('الظهر', '12:57 م', '☀️', 'نور الغداء بركة الرزق', 'إنها ساعة تفتح فيها أبواب السماء', 'الاستغفار والتسبيح 33'),
            _buildPrayerCard('العصر', '04:33 م', '⛅', 'الصلاة الوسطى المباركة', 'من ترك صلاة العصر فقد حبط عمله', 'أذكار المساء المأثورة'),
            _buildPrayerCard('المغرب', '08:00 م', '🌇', 'بداية الليل والسكينة', 'لا تزال أمتي بخير ما لم يؤخروا المغرب', 'سورة الإخلاص والمعوذتين'),
            _buildPrayerCard('العشاء', '09:34 م', '🌌', 'راحة البدن وحصن النوم', 'من صلى العشاء في جماعة فكأنما قام نصف الليل', 'الملك وسبحان الله'),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: const Color(0xFF1A1A2F), borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.amber, width: 0.5)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('🏆 نقاطك الحالية: $_scorePoints نقطة', style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
                      const Text('🔥 تتبع نظام جوائز الصلوات', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: _trackedPrayers.keys.map((pName) {
                      return Column(
                        children: [
                          Text(pName, style: const TextStyle(fontSize: 12)),
                          Checkbox(
                            value: _trackedPrayers[pName],
                            activeColor: Colors.amber,
                            onChanged: (v) => setState(() {
                              _trackedPrayers[pName] = v!;
                              _scorePoints += v ? 50 : -50;
                            }),
                          )
                        ],
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
            const SizedBox(height: 15),
            Card(
              color: Colors.redAccent.withOpacity(0.1),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: const BorderSide(color: Colors.redAccent)),
              child: ListTile(
                leading: const Icon(Icons.alarm, color: Colors.redAccent, size: 30),
                title: const Text('منبه الفجر الرياضي الذكي عالي التنبيه', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: const Text('تحديات أسئلة ثقافية دينية لإجبارك على الاستيقاظ'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: _startSmartAlarmChallenge,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrayerCard(String name, String time, String emoji, String fadl, String hadith, String azkar) {
    return Card(
      color: Theme.of(context).cardColor,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        onTap: () => _showPrayerDetails(name, fadl, hadith, azkar),
        leading: Text(emoji, style: const TextStyle(fontSize: 28)),
        title: Row(
          children: [
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
            const Spacer(),
            Text(time, style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
          ],
        ),
        subtitle: const Text('انقر لقراءة فضل الصلاة والأحاديث الخاصة بها 💡', style: TextStyle(fontSize: 11)),
        trailing: IconButton(
          icon: const Icon(Icons.volume_up, color: Colors.white38),
          onPressed: () => _showAdhanSettings(name),
        ),
      ),
    );
  }
}

class AzkarTab extends StatefulWidget {
  const AzkarTab({Key? key}) : super(key: key);
  @override
  State<AzkarTab> createState() => _AzkarTabState();
}

class _AzkarTabState extends State<AzkarTab> {
  int _tasbihCounter = 0;
  String _searchQuery = "";
  final List<Map<String, String>> _categories = [
    {"name": "أذكار الصباح", "icon": "☀️", "trans": "Morning Azkar"},
    {"name": "أذكار المساء", "icon": "🌙", "trans": "Evening Azkar"},
    {"name": "أذكار السفر", "icon": "✈️", "trans": "Travel Supplications"},
    {"name": "أذكار الطعام والشراب", "icon": "🍏", "trans": "Food & Drink"},
    {"name": "أذكار النوم والاستيقاظ", "icon": "🛌", "trans": "Sleep & Wakeup"},
    {"name": "أذكار النجاح والمرض", "icon": "🏥", "trans": "Cure & Success"},
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF111322),
          title: const TabBar(
            indicatorColor: Colors.amber,
            tabs: [Tab(text: 'جميع الأذكار'), Tab(text: 'المسبحة الإلكترونية')],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    onChanged: (v) => setState(() => _searchQuery = v),
                    textAlign: TextDirection.rtl,
                    decoration: InputDecoration(
                      hintText: '🔍 ابحث في جميع أذكار الدنيا والآخرة...',
                      filled: true,
                      fillColor: Theme.of(context).cardColor,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _categories.length,
                    itemBuilder: (context, i) {
                      if (_searchQuery.isNotEmpty && !_categories[i]["name"]!.contains(_searchQuery)) {
                        return const SizedBox();
                      }
                      return Card(
                        color: Theme.of(context).cardColor,
                        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        child: ListTile(
                          leading: Text(_categories[i]["icon"]!, style: const TextStyle(fontSize: 24)),
                          title: Text(_categories[i]["name"]!, style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text(_categories[i]["trans"]!, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                          trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.amber),
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('🎉 تم إكمال وقراءة الأذكار بنجاح بنظام "تم"!')));
                          },
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'أستغفر الله العظيم وأتوب إليه',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: () { setState(() => _tasbihCounter++); HapticFeedback.vibrate(); },
                  child: Container(
                    width: 180, height: 180,
                    decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF6C5DD3)),
                    child: Center(child: Text('$_tasbihCounter', style: const TextStyle(fontSize: 48, color: Colors.white, fontWeight: FontWeight.bold))),
                  ),
                ),
                TextButton(onPressed: () => setState(() => _tasbihCounter = 0), child: const Text('تصفير العداد'
