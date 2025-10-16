import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_router.dart';
import 'package:flutter_task/core/widgets/custom_button.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/custom_text_field.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/custom_wrap_builder.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/class_widget.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/location_widget.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/title_with_child_widget.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/filter_title_widget.dart';
import 'package:go_router/go_router.dart';

class FilterView extends StatelessWidget {
  const FilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const FilterTitleWidget(),
              const SizedBox(height: 20),

              // الفئة
              const TitleWithChildWidget(title: "الفئة", child: ClassWidget()),
              const Divider(height: 40),

              const LocationWidget(),
              const Divider(height: 40),
              TitleWithChildWidget(
                title: "الأقساط الشهرية",
                child: Row(
                  spacing: 12,
                  children: [
                    Expanded(child: CustomTextField()),
                    Expanded(child: CustomTextField()),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              TitleWithChildWidget(
                title: "النوع",
                child: CustomWrapBuilder(
                  items: ["الكل", "تاون هاوس", "فيلا منفصلة", "توين هاوس"],
                ),
              ),
              const SizedBox(height: 20),

              const TitleWithChildWidget(
                title: "عدد الغرف",
                child: CustomWrapBuilder(
                  items: ["4 غرف", "5 غرف+", "الكل", "غرفتين", "3 غرف"],
                ),
              ),
              const SizedBox(height: 20),

              TitleWithChildWidget(
                title: "السعر",
                child: Row(
                  spacing: 12,
                  children: [
                    Expanded(child: CustomTextField(hintText: "أقل سعر")),
                    Expanded(child: CustomTextField(hintText: "أقصى سعر")),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              TitleWithChildWidget(
                title: "طريقة الدفع",
                child: CustomWrapBuilder(items: ["أي", "تقسيط", "كاش"]),
              ),
              const SizedBox(height: 20),

              const TitleWithChildWidget(
                title: "حالة العقار",
                child: CustomWrapBuilder(items: ["أي", "جاهز", "تحت الإنشاء"]),
              ),

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomButton(
                  text: "شاهد 10,000+ نتائج",
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.filterRoute);
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
