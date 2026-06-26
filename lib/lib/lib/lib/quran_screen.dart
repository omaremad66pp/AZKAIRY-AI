import 'package:flutter/material.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('القرآن الكريم كاملاً'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: 114, // عدد سور القرآن الكريم كاملاً
        itemBuilder: (context, index) {
          return Card(
            color: const Color(0xFF1A1A1E),
            margin: const EdgeInsets.symmetric(vertical: 6),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: const Color(0xFF9D4EDD), // الدائرة بنفسجي غامق
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              title: Text(
                _getSurahName(index), // استدعاء اسم السورة بناءً على الرقم
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                'عدد الآيات: ${_getAyahCount(index)} | ${_getSurahType(index)}',
                style: const TextStyle(color: Colors.grey, fontSize: 13),
              ),
              trailing: const Icon(Icons.menu_book, color: Color(0xFFE0AAFF)),
              onTap: () {
                // هنا سيتم لاحقاً فتح السورة لقراءة الآيات
              },
            ),
          );
        },
      ),
    );
  }

  // دالة تجريبية لأسماء السور (تظهر اسم السورة مرقمة لتوضيح الهيكل)
  String _getSurahName(int index) {
    List<String> sampleNames = ['الفاتحة', 'البقرة', 'آل عمران', 'النساء', 'المائدة'];
    if (index < sampleNames.length) return sampleNames[index];
    return 'سورة رقم ${index + 1}';
  }

  int _getAyahCount(int index) {
    if (index == 0) return 7;
    if (index == 1) return 286;
    return 100; // قيمة افتراضية لباقي السور مؤقتاً
  }

  String _getSurahType(int index) {
    return index == 1 || index == 2 || index == 3 ? 'مدنية' : 'مكية';
  }
}
