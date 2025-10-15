import 'package:flutter/material.dart';

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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: const Text(
            "اختر الباقات اللي تناسبك",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          foregroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView.builder(
            itemCount: plans.length,
            itemBuilder: (context, index) {
              final plan = plans[index];
              final isSelected = selectedIndex == index;
              return GestureDetector(
                onTap: () => setState(() => selectedIndex = index),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected ? Colors.deepPurple : Colors.grey[300]!,
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // السعر والعنوان
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${plan['price']} ج.م",
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              plan['name'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Icon(
                              isSelected
                                  ? Icons.check_box_rounded
                                  : Icons.check_box_outline_blank,
                              color: isSelected
                                  ? Colors.deepPurple
                                  : Colors.grey,
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        if (plan['highlight'] != null)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.pink[50],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              plan['highlight'],
                              style: const TextStyle(
                                color: Colors.pink,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),

                        if (plan['views'] != null) ...[
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 14,
                                backgroundColor: Colors.green[100],
                                child: Text(
                                  "${plan['views']}",
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                "عدد المشاهدات",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ],

                        const SizedBox(height: 10),

                        // المميزات
                        ...plan['features']
                            .map<Widget>(
                              (f) => Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 3.5,
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.check_circle_outline,
                                      color: Colors.deepPurple,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 6),
                                    Expanded(
                                      child: Text(
                                        f,
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
