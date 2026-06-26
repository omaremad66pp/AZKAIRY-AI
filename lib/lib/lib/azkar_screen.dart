import 'package:flutter/material.dart';

class AzkarScreen extends StatelessWidget {
  const AzkarScreen({super.key});

  // قائمة بجميع الفئات التي طلبتها في رسالتك الأولى
  final List<Map<String, dynamic>> categories = const [
    {'title': 'أذكار الصباح', 'icon': Icons.wb_sunny},
    {'title': 'أذكار المساء', 'icon': Icons.dark_mode},
    {'title': 'أذكار الصلاة (وما بعدها)', 'icon': Icons.mosque},
    {'title': 'أذكار السفر', 'icon': Icons.flight},
    {'title': 'أذكار الطعام والشراب', 'icon': Icons.restaurant},
    {'title': 'أذكار الملبس', 'icon': Icons.checkroom},
    {'title': 'أذكار الزواج والأهل', 'icon': Icons.favorite},
    {'title': 'أذكار الأطفال وتحصينهم', 'icon': Icons.child_care},
    {'title': 'أذكار المرضى والرقية', 'icon': Icons.local_hospital},
    {'title': 'أذكار الأوقات الصعبة والكرب', 'icon': Icons.warning_amber},
    {'title': 'أذكار الحج والعمرة', 'icon': Icons.explore},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('حصن المسلم الشامل'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Card(
            // اللون الأسود الهادئ للكرت
            color: const Color(0xFF1A1A1E),
            margin: const EdgeInsets.symmetric(vertical: 6),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: Icon(
                categories[index]['icon'],
                color: const Color(0xFFBB86FC), // اللون البنفسجي الذي طلبته
              ),
              title: Text(
                categories[index]['title'],
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
              onTap: () {
                // هنا سيتم لاحقاً ربط كل فئة بالأذكار الخاصة بها
              },
            ),
          );
        },
      ),
    );
  }
}
