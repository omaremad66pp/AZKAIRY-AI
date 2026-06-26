import 'package:flutter/material.dart';

void main() {
  runApp(const AzkariApp());
}

class AzkariApp extends StatelessWidget {
  const AzkariApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'أذكاري والذكاء الاصطناعي',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Cairo', // يمكنك تغيير الخط لاحقاً
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;
  String _currentZikr = "سبحان الله وبحمده";

  final List<String> _azkar = [
    "سبحان الله وبحمده",
    "أستغفر الله وأتوب إليه",
    "لا إله إلا الله وحده لا شريك له",
    "اللهم صلِّ وسلم على نبينا محمد",
    "الحمد لله رب العالمين"
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  void _changeZikr(String zikr) {
    setState(() {
      _currentZikr = zikr;
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تطبيق أذكاري AI', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.teal.shade50, Colors.white],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // بطاقة الذكر الحالي
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                widget: Text(
                  _currentZikr,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal),
                  textAlign: Center,
                ),
              ),
            ),
            const SizedBox(height: 40),
            
            // دائرة العداد (السبحة)
            GestureDetector(
              onTap: _incrementCounter,
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(color: Colors.teal.withOpacity(0.4), blurRadius: 10, offset: const Offset(0, 5))
                  ],
                ),
                child: Center(
                  child: Text(
                    '$_counter',
                    style: const TextStyle(fontSize: 48, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            // زر إعادة التصفير
            TextButton.icon(
              onPressed: _resetCounter,
              icon: const Icon(Icons.refresh, color: Colors.red),
              label: const Text('تصفير العداد', style: TextStyle(color: Colors.red, fontSize: 16)),
            ),
            const SizedBox(height: 40),
            
            // قائمة اختيار الأذكار الأخرى
            const Text('اختر ذكراً آخر:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _azkar.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      title: Text(_azkar[index], textAlign: TextAlign.right),
                      trailing: const Icon(Icons.arrow_back_ios, size: 16, color: Colors.teal),
                      onTap: () => _changeZikr(_azkar[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
