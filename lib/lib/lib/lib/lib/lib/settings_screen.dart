import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final Function(bool) onThemeChanged;
  const SettingsScreen({super.key, required this.onThemeChanged});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isDarkMode = true;
  bool _smartAlarm = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('الإعدادات والذكاء الاصطناعي'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // خيار التحكم في المظهر (فاتح / داكن)
          Card(
            color: const Color(0xFF1A1A1E),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: SwitchListTile(
              title: const Text('المظهر الداكن (أسود وبنفسجي)'),
              subtitle: Text(
                _isDarkMode ? 'الوضع الحالي: داكن هادئ' : 'الوضع الحالي: فاتح',
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
              activeColor: theme.colorScheme.secondary,
              value: _isDarkMode,
              onChanged: (value) {
                setState(() {
                  _isDarkMode = value;
                  widget.onThemeChanged(value);
                });
              },
            ),
          ),
          const SizedBox(height: 10),

          // خيار المنبه الذكي لصلاة الفجر
          Card(
            color: const Color(0xFF1A1A1E),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: SwitchListTile(
              title: const Text('المنبه الذكي لصلاة الفجر'),
              subtitle: const Text(
                'لن يتوقف الرنين حتى يستشعر التطبيق حركتك وقيامك من السرير بالكامل لضمان الاستيقاظ.',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              activeColor: theme.colorScheme.secondary,
              value: _smartAlarm,
              onChanged: (value) {
                setState(() {
                  _smartAlarm = value;
                });
              },
            ),
          ),
          
          const Divider(height: 40, color: Colors.grey),

          // واجهة المساعد الذكي الإسلامي AI
          const Row(
            children: [
              Icon(Icons.auto_awesome, color: Color(0xFFBB86FC)),
              SizedBox(width: 8),
              Text('المساعد الإسلامي الذكي AI ✨', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 12),
          
          Container(
            height: 200,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A1E),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: theme.colorScheme.primary.withOpacity(0.4)),
            ),
            child: Column(
              children: [
                const Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      'مرحباً بك في أذكاري AI! أنا مساعدك الذكي المبني لخدمتك. يمكنك سؤالي عن تفسير الآيات، شرح الأذكار، أو السيرة النبوية المشرفة...',
                      style: TextStyle(color: Colors.grey, fontSize: 14, height: 1.4),
                    ),
                  ),
                ),
                const Divider(color: Colors.grey),
                Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        style: TextStyle(fontSize: 14),
                        decoration: InputDecoration(
                          hintText: 'اسأل مساعدك الشرعي هنا...',
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send, color: Color(0xFFBB86FC)),
                      onPressed: () {
                        // هنا يتم ربط النص بـ API الذكاء الاصطناعي مستقبلاً
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
