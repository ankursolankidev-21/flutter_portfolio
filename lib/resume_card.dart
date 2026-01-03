import 'package:flutter/material.dart';
import 'package:my_cv_web/theme/app_colors.dart';
import 'package:my_cv_web/theme/app_state.dart';
import 'package:my_cv_web/theme/app_text_styles.dart';
import 'package:my_cv_web/theme/global_variables.dart';
import 'package:provider/provider.dart';

class ResumeCard extends StatelessWidget {
  final String headLine;
  final Widget child;

  // 👇 optional action
  final String? actionText;
  final VoidCallback? onActionTap;

  const ResumeCard({super.key, required this.headLine, required this.child, this.actionText, this.onActionTap});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppState>().isDark;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : AppColors.lightCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: isDark ? AppColors.darkBorder : AppColors.lightBorder, width: isDark ? 1 : 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Text(headLine, style: AppText.titleText(isDark)),
          spaceHeight(0.6),
          Divider(color: isDark ? AppColors.darkDivider : AppColors.lightDivider),

          // Main content
          child,

          // 👇 Optional action (bottom-right)
          if (actionText != null && onActionTap != null) ...[
            spaceHeight(1),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: onActionTap,
                borderRadius: BorderRadius.circular(6),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  child: Text(actionText!, style: AppText.accentText(isDark)),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
