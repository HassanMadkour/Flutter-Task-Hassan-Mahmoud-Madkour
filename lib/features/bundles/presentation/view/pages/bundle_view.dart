import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_fonts.dart';
import 'package:flutter_task/features/bundles/presentation/view/widgets/bundle_card.dart';

class BundleView extends StatefulWidget {
  const BundleView({super.key});

  @override
  State<BundleView> createState() => BundleViewState();
}

class BundleViewState extends State<BundleView> {
  int selectedIndex = 1; // الباقة المحددة (مثلاً 1 = أكسترا)

  final List<Map<String, dynamic>> plans = [
    {
      "name": "أساسية",
      "price": "3000",
      "features": ["صلاحية الإعلان 30 يوم"],
    },
    {
      "name": "أكسترا",
      "price": "3000",
      "features": [
        "صلاحية الإعلان 30 يوم",
        "رفع الإعلان كل 3 أيام",
        "تثبيت في مواقع صحي (خلال الـ 48 ساعة القادمة)",
      ],
      "highlight": "الأفضل قيمة مقابل سعر",
      "views": 7,
    },
    {
      "name": "بلس",
      "price": "3000",
      "features": [
        "صلاحية الإعلان 30 يوم",
        "رفع الإعلان كل 2 يوم",
        "ظهور في محافظات مصر",
        "إعلان مميز",
        "تثبيت في مواقع صحي (خلال الـ 48 ساعة القادمة)",
      ],
      "highlight": "الأكثر مبيعاً",
      "views": 18,
    },
    {
      "name": "سوبر",
      "price": "3000",
      "features": [
        "صلاحية الإعلان 30 يوم",
        "رفع الإعلان كل 2 يوم",
        "ظهور في محافظات مصر",
        "إعلان مميز",
        "تثبيت في مواقع صحي (خلال الـ 48 ساعة القادمة)",
      ],
      "views": 24,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                spacing: 12,
                children: [
                  Icon(Icons.arrow_back_ios_outlined, size: 12),
                  Text(
                    "أختر الباقات اللى تناسبك",
                    style: AppFontStyle.tajawalMedium24,
                  ),
                ],
              ),
              Text(
                "أختار من باقات التمييز بل أسفل اللى تناسب أحتياجاتك",
                style: AppFontStyle.tajawalRegular14,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: plans.length,
                  itemBuilder: (context, index) {
                    final plan = plans[index];
                    final isSelected = selectedIndex == index;
                    return GestureDetector(
                      onTap: () => setState(() => selectedIndex = index),
                      child: BundleCard(isSelected: isSelected, plan: plan),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
