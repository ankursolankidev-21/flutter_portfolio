import 'package:flutter/material.dart';
import 'package:my_cv_web/theme/app_colors.dart';
import 'package:my_cv_web/theme/app_text_styles.dart';
import 'package:my_cv_web/theme/global_variables.dart';

import 'model/project_model.dart';

class ProjectDialog extends StatelessWidget {
  final ProjectModel project;
  final bool isDark;

  const ProjectDialog({super.key, required this.project, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final bgColor = isDark ? AppColors.darkCard : AppColors.lightCard;
    final borderColor = isDark ? AppColors.darkBorder : AppColors.lightBorder;

    return Dialog(
      backgroundColor: bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(color: borderColor),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800, maxHeight: 600),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ================= HEADER =================
            Container(
              decoration: const BoxDecoration(
                color: AppColors.headerBg,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(14), topRight: Radius.circular(14)),
                boxShadow: [BoxShadow(color: Color(0x80000000), offset: Offset(0, 3), blurRadius: 5, spreadRadius: 2)],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(project.projectTitle, style: AppText.titleSubText(true)),
                        Text(project.client, style: AppText.infoText(true)),
                      ],
                    ),
                  ),
                  IconButton(icon: const Icon(Icons.close), color: Colors.white, onPressed: () => Navigator.pop(context)),
                ],
              ),
            ),

            // ================= BODY =================
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (project.imagePaths.isNotEmpty) projectImageSlider(project.imagePaths),

                      spaceHeight(1.5),

                      _infoRow('Type', project.projectType, isDark),
                      _infoRow('Domain', project.domain, isDark),

                      _textSection(title: 'Project Summary', content: project.projectSummary, isDark: isDark),

                      _listSection(title: 'Key Challenges', items: project.keyChallenge, isDark: isDark),

                      _listSection(title: 'Responsibilities', items: project.responsibilities, isDark: isDark),

                      _listSection(title: 'Key Features', items: project.keyFeatures, isDark: isDark),

                      _listSection(title: 'Impact', items: project.impact, isDark: isDark),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget projectImageSlider(List<String> images) {
  if (images.isEmpty) return const SizedBox();

  return LayoutBuilder(
    builder: (context, constraints) {
      final isMobile = constraints.maxWidth < 600;
      final sliderHeight = isMobile ? 170.0 : 230.0;

      return SizedBox(
        height: sliderHeight,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemCount: images.length,
          separatorBuilder: (_, __) => const SizedBox(width: 10),
          // 🔥 exact gap
          itemBuilder: (context, index) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(images[index], height: sliderHeight - 32, fit: BoxFit.fitHeight),

                const SizedBox(height: 6),
                SizedBox(
                  width: 140, // optional text control
                  child: Text(getTitleFromPath(images[index]), maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodySmall),
                ),
              ],
            );
          },
        ),
      );
    },
  );
}

String getTitleFromPath(String path) {
  // Get file name only
  final fileName = path.split(RegExp(r'[\/\\]')).last;

  // Remove extension
  final nameWithoutExt = fileName.split('.').first;

  // Replace _ with space
  return nameWithoutExt.replaceAll('_', ' ');
}

Widget _infoRow(String label, String value, bool isDark) {
  if (value.isEmpty) return const SizedBox();

  return Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label: ', style: AppText.titleSubText(isDark)),
        Expanded(child: Text(value, style: AppText.infoText(isDark))),
      ],
    ),
  );
}

Widget _textSection({required String title, required String content, required bool isDark}) {
  if (content.isEmpty) return const SizedBox();

  return Padding(
    padding: const EdgeInsets.only(top: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppText.titleSubText(isDark)),
        spaceHeight(0.5),
        Text(content, style: AppText.infoText(isDark)),
      ],
    ),
  );
}

Widget _listSection({required String title, required List<String> items, required bool isDark}) {
  if (items.isEmpty) return const SizedBox();

  return Padding(
    padding: const EdgeInsets.only(top: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppText.titleSubText(isDark)),
        spaceHeight(0.6),
        ...items.map(
          (e) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, right: 10),
                  child: Icon(Icons.circle, size: 6, color: isDark ? AppColors.darkSubText : AppColors.lightSubText),
                ),
                Expanded(child: Text(e, style: AppText.infoText(isDark))),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
