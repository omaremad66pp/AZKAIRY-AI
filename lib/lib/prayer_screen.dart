import 'package:flutter/material.dart';

class PrayerScreen extends StatelessWidget {
  const PrayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('الصلاة والقبلة'), centerTitle: true, backgroundColor: Colors.transparent, elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withOpacity(0.15),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: theme.colorScheme.primary.withOpacity(0.3)),
              ),
              child: const Column(
                children: [
                  Text('التقويم الهجري: 9 محرم 1448 هـ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text('متبقي على الصلاة القادمة: 02:15:40', style: TextStyle(color: Colors.amberAccent, fontSize: 16)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildRow('الفجر', '04:30 ص', context),
            _buildRow('الظهر', '12:15 م', context),
            _buildRow('العصر', '03:45 م', context),
            _buildRow('المغرب', '06:50 م', context),
            _buildRow('العشاء', '08:20 م', context),
            const Divider(height: 40),
            const Text('بوصلة اتجاه القبلة', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.black24,
              child: Icon(Icons.navigation, size: 50, color: Color(0xFFBB86FC)),
            ),
            const Divider(height: 40),
            const Text('تقسيم الليل الشرعي', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(color: Colors.black24, borderRadius: BorderRadius.circular(15)),
              child: const Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('ثلث الليل الأول:'), Text('من 07:00 م إلَى 10:30 م')]),
                  SizedBox(height: 8),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('ثلث الليل الثاني:'), Text('من 10:30 م إلَى 02:00 ص')]),
                  SizedBox(height: 8),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('ثلث الليل الأخير:', style: TextStyle(color: Colors.greenAccent)), Text('من 02:00 ص إلَى الفجر')]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String name, String time, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(name, style: const TextStyle(fontSize: 16)), Text(time, style: const TextStyle(fontSize: 16))],
      ),
    );
  }
}
