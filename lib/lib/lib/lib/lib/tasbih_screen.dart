import 'package:flutter/material.dart';

class TasbihScreen extends StatefulWidget {
  const TasbihScreen({super.key});

  @override
  State<TasbihScreen> createState() => _TasbihScreenState();
}

class _TasbihScreenState extends State<TasbihScreen> {
  int _counter = 0;
  String _currentZikr = "سبحان الله";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('المسبحة الإلكترونية'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // قائمة اختيار الذكر بتصميم متناسق مع الثيم الداكن
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1E),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: theme.colorScheme.primary.withOpacity(0.5)),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _currentZikr,
                  dropdownColor: const Color(0xFF1A1A1E),
                  style: const TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'Cairo'),
                  items: <String>['سبحان الله', 'الحمد لله', 'الله أكبر', 'لا إله إلا الله', 'أستغفر الله'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _currentZikr = newValue!;
                      _counter = 0; // إعادة تصغير العداد عند تغيير الذكر
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 50),

            // زر التسبيح الدائري الكبير باللون البنفسجي
            GestureDetector(
              onTap: () {
                setState(() {
                  _counter++;
                });
              },
              child: Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF1A1A1E),
                  border: Border.all(color: theme.colorScheme.primary, width: 5),
                  boxShadow: [
                    BoxShadow(
                      color: theme.colorScheme.primary.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 2,
                    )
                  ],
                ),
                child: Center(
                  child: Text(
                    '$_counter',
                    style: const TextStyle(fontSize: 54, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),

            // زر إعادة الضبط (الصفر)
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1A1A1E),
                side: const BorderSide(color: Colors.redAccent, width: 1),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: () {
                setState(() {
                  _counter = 0;
                });
              },
              icon: const Icon(Icons.refresh, color: Colors.redAccent),
              label: const Text('إعادة ضبط العداد', style: TextStyle(color: Colors.redAccent, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
