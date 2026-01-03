import 'package:flutter/material.dart';
import 'package:my_cv_web/project_dialog_box.dart';
import 'package:my_cv_web/responsive_class.dart';
import 'package:my_cv_web/resume_card.dart';
import 'package:my_cv_web/resume_data.dart';
import 'package:my_cv_web/theme/app_text_styles.dart';
import 'package:my_cv_web/theme/global_variables.dart';
import 'package:provider/provider.dart';
import 'model/project_model.dart';
import 'theme/app_colors.dart';
import 'theme/app_state.dart';
import 'profile_header.dart';

class ResumeScreen extends StatefulWidget {
  const ResumeScreen({super.key});

  @override
  State<ResumeScreen> createState() => _ResumeScreenState();
}

class _ResumeScreenState extends State<ResumeScreen> {
  bool summaryFull = false;

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppState>().isDark;
    final mainBackground = isDark ? AppColors.darkBg : AppColors.lightBg;

    return Scaffold(
      backgroundColor: mainBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Responsive.isMobile(context) ? 16 : 50,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    ProfileHeader(),
                    spaceHeight(2),
        
                    widgetSummary(isDark),
                    spaceHeight(2),
        
                    // ---------------- LAYOUT SWITCH ----------------
                    if (Responsive.isDesktop(context)) ...[
                      /// DESKTOP (two columns 3:7)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                widgetSkill(isDark),
                                spaceHeight(2),
                                widgetTools(isDark),
                              ],
                            ),
                          ),
                          spaceWidth(2),
                          Expanded(
                            flex: 7,
                            child: Column(
                              children: [
                                widgetExperience(isDark),
                                spaceHeight(2),
                                widgetEducation(isDark),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ] else if (Responsive.isTablet(context)) ...[
                      /// TABLET (two columns 4:6 – more balanced)
                      // Text('This is Tab mode ${MediaQuery.of(context).size.width}'),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Column(
                              children: [
                                widgetSkill(isDark),
                                spaceHeight(2),
                                widgetTools(isDark),
                              ],
                            ),
                          ),
                          spaceWidth(2),
                          Expanded(
                            flex: 6,
                            child: Column(
                              children: [
                                widgetExperience(isDark),
                                spaceHeight(2),
                                widgetEducation(isDark),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ] else ...[
                      /// MOBILE (single column)
                      Column(
                        children: [
                          widgetSkill(isDark),
                          spaceHeight(2),
                          widgetTools(isDark),
                          spaceHeight(2),
                          widgetExperience(isDark),
                          spaceHeight(2),
                          widgetEducation(isDark),
                        ],
                      ),
                    ],
        
                    spaceHeight(2),
        
                    /// Projects already responsive with Wrap
                    widgetProjects(isDark, ResumeData.project),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

  }

  Widget widgetSummary(bool isDark) {
    return ResumeCard(
      headLine: 'Summary',
      actionText: summaryFull ? '↑ Read Less' : '↓ Read More',
      onActionTap: () {
        setState(() {
          summaryFull = !summaryFull;
        });
      },
      child: AnimatedSize(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: summaryFull ? ResumeData.arraySummary.length : 1,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 11),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10, top: 8),
                    child: Icon(
                      Icons.circle,
                      size: 7,
                      color: isDark
                          ? AppColors.darkSubText
                          : AppColors.lightSubText,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      ResumeData.arraySummary[index],
                      style: AppText.infoText(isDark),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget widgetSkill(bool isDark) {
    return ResumeCard(
      headLine: 'Skills',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: ResumeData.mapSkills.entries.map((entry) {
          final title = entry.key;
          final items = entry.value;

          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Section title
                Text(title, style: AppText.titleSubText(isDark)),
                spaceHeight(0.8),

                // Bullet items
                ...items.map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8, right: 10),
                          child: Icon(Icons.circle, size: 7, color: isDark ? AppColors.darkSubText : AppColors.lightSubText),
                        ),
                        Expanded(child: Text(item, style: AppText.infoText(isDark))),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget widgetTools(bool isDark) {
    return ResumeCard(
      headLine: 'Tools',
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: ResumeData.arrayTools.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 11),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10, top: 8),
                  child: Icon(Icons.circle, color: isDark ? AppColors.darkSubText : AppColors.lightSubText, size: 7),
                ),
                Expanded(child: Text(ResumeData.arrayTools[index], style: AppText.infoText(isDark))),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget widgetExperience(bool isDark) {
    return ResumeCard(
      headLine: 'Experience',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: ResumeData.experiences.map((exp) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Timeline icon + line
                  Padding(
                    padding: const EdgeInsets.only(top: 4, right: 12),
                    child: Column(
                      children: [
                        Icon(exp.iconName, size: 20, color: isDark ? AppColors.darkAccent : AppColors.lightAccent),
                        spaceHeight(1.5),
                        Expanded(child: Container(width: 2, color: isDark ? AppColors.darkDivider : AppColors.lightDivider)),
                      ],
                    ),
                  ),

                  // Content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Text('${exp.role}  ', style: AppText.titleSubText(isDark)),
                            Text('(${exp.company})', style: AppText.infoSubText(isDark)),
                          ],
                        ),
                        Text(exp.duration, style: AppText.infoSubText(isDark)),
                        spaceHeight(1),
                        ...exp.responsibilities.map(
                          (item) => Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 6, right: 10),
                                  child: Icon(Icons.circle, size: 6, color: isDark ? AppColors.darkSubText : AppColors.lightSubText),
                                ),
                                Expanded(child: Text(item, style: AppText.infoText(isDark))),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget widgetEducation(bool isDark) {
    return ResumeCard(
      headLine: 'Education',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: ResumeData.education.map((exp) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4, right: 12),
                    child: Icon(exp.iconName, size: 20, color: isDark ? AppColors.darkAccent : AppColors.lightAccent),
                  ),

                  // Content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 10,
                          // runSpacing: 5,
                          children: [
                            Text(exp.subject, style: AppText.titleSubText(isDark)),
                            Text(exp.duration, style: AppText.infoSubText(isDark)),
                          ],
                        ),
                        Text('( ${exp.instituteName} )', style: AppText.infoSubText(isDark)),
                        // spaceHeight(1),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget widgetProjects(bool isDark, List<ProjectModel> projects) {
    return ResumeCard(
      headLine: 'Projects',
      child: LayoutBuilder(
        builder: (context, constraints) {
          const double spacing = 16.0;
          final double maxWidth = constraints.maxWidth;

          // Decide columns by width
          int columnCount;
          if (maxWidth >= 1024) {
            columnCount = 3; // Desktop
          } else if (maxWidth >= 600) {
            columnCount = 2; // Tablet
          } else {
            columnCount = 1; // Mobile
          }

          final double itemWidth =
          ((maxWidth - (spacing * (columnCount - 1))) / columnCount)
              .floorToDouble();

          return Wrap(
            spacing: spacing,
            runSpacing: spacing,
            children: projects.map((project) {
              return SizedBox(
                width: itemWidth,
                child: projectBox(
                  project: project,
                  isDark: isDark, context: context,
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }

  Widget projectBox({
    required BuildContext context,
    required ProjectModel project,
    required bool isDark,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => ProjectDialog(
            project: project,
            isDark: isDark,
          ),
        );

      },
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkCard : AppColors.lightCard,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              project.projectTitle,
              style: AppText.titleSubText(isDark),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              project.client,
              style: AppText.infoText(isDark),
            ),
            spaceHeight(0.6),
            ClipRRect(
              borderRadius: BorderRadius.circular(3),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset(
                  project.imagePaths[0],
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
