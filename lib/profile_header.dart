import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_cv_web/resume_data.dart';
import 'package:provider/provider.dart';

import 'theme/app_colors.dart';
import 'theme/app_state.dart';
import 'theme/app_text_styles.dart';
import 'theme/global_variables.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final isDark = context.watch<AppState>().isDark;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 700;

        return Stack(
          children: [
            SizedBox(
              // 👈 FORCE FULL WIDTH
              width: double.infinity,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(color: AppColors.headerBg, borderRadius: BorderRadius.circular(18)),
                child: isMobile ? _mobileHeader(context, isDark) : _desktopHeader(context, isDark),
              ),
            ),

            Positioned(
              right: 8,
              top: 8,
              child: IconButton(
                onPressed: appState.toggleTheme,
                icon: Icon(appState.isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined, color: AppColors.headerSubText),
              ),
            ),
          ],
        );
      },
    );
  }

  // ================= DESKTOP =================
  Widget _desktopHeader(BuildContext context, bool isDark) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const WidgetProfilePhoto(radius: 80),
        spaceWidth(4),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Ankur Solanki', style: AppText.headerName()),
              spaceHeight(0.4),
              Text('Flutter Developer', style: AppText.headerSubHeading()),
              spaceHeight(3),
              Wrap(
                spacing: 16,
                runSpacing: 8,
                children: [
                  HyperLink(
                    text: ResumeData.phone.label,
                    iconName: ResumeData.phone.icon,
                    onTap: () => showContactChoiceDialog(context, phoneNumber: ResumeData.phone.value, isDark: isDark),
                  ),
                  HyperLink(text: ResumeData.email.label, iconName: ResumeData.email.icon, onTap: () => openEmailWeb(ResumeData.email.value)),
                  HyperLink(text: ResumeData.linkedIn.label, iconName: ResumeData.linkedIn.icon, onTap: () => openLink(ResumeData.linkedIn.value)),
                  HyperLink(text: ResumeData.downloadPdf.label, iconName: ResumeData.downloadPdf.icon, onTap: () => openLink(ResumeData.downloadPdf.value)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ================= MOBILE =================
  Widget _mobileHeader(BuildContext context, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch, // 👈 KEY FIX
      children: [
        Center(child: const WidgetProfilePhoto(radius: 70),),
        spaceHeight(1),
        Center(child: Text('Ankur Solanki', style: AppText.headerName())),
        Center(child: Text('Flutter Developer', style: AppText.headerSubHeading())),
        spaceHeight(1),

        // Contact items now stretch full width
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Wrap(
              spacing: 15,
              runSpacing: 7,
              alignment: WrapAlignment.spaceBetween,
              children: [
                HyperLink(text: ResumeData.email.label, iconName: ResumeData.email.icon, onTap: () => openEmailWeb(ResumeData.email.value)),
                HyperLink(
                  text: ResumeData.phone.label,
                  iconName: ResumeData.phone.icon,
                  onTap: () => showContactChoiceDialog(context, phoneNumber: ResumeData.phone.value, isDark: isDark),
                ),
              ],
            ),
            spaceHeight(0.7),
            Wrap(
              spacing: 15,
              runSpacing: 7,
              alignment: WrapAlignment.spaceBetween,
              children: [
                HyperLink(text: ResumeData.linkedIn.label, iconName: ResumeData.linkedIn.icon, onTap: () => openLink(ResumeData.linkedIn.value)),
                HyperLink(text: ResumeData.downloadPdf.label, iconName: ResumeData.downloadPdf.icon, onTap: () => openLink(ResumeData.downloadPdf.value)),
              ],
            ),
          ],
        ),
      ],
    );
  }

  // Future<void> openPhone(String number) async {
  //   final uri = Uri(scheme: 'tel', path: number);
  //   await launchUrl(uri, mode: LaunchMode.externalApplication);
  // }

  Future<void> openPhone(String number) async {
    final uri = Uri(scheme: 'tel', path: number);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  Future<void> openWhatsApp(String number) async {
    // WhatsApp chat link (works on mobile & web)
    final uri = Uri.parse('https://wa.me/$number');
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  void showContactChoiceDialog(BuildContext context, {required String phoneNumber, required bool isDark}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: isDark ? AppColors.darkCard : AppColors.lightCard,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: BorderSide(color: isDark ? AppColors.darkBorder : AppColors.lightBorder),
          ),
          title: Text('Contact via', style: AppText.titleText(isDark)),
          content: Text('How would you like to contact?', style: AppText.infoText(isDark)),
          actionsPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          actions: [
            TextButton.icon(
              icon: Icon(Icons.call, color: isDark ? AppColors.darkSubText : AppColors.lightSubText),
              label: Text('Call Now', style: AppText.infoText(isDark)),
              onPressed: () {
                Navigator.pop(context);
                openPhone(phoneNumber);
              },
            ),
            TextButton.icon(
              icon: Icon(
                FontAwesomeIcons.whatsapp,
                color: Colors.green, // WhatsApp vibe
              ),
              label: Text('WhatsApp', style: AppText.infoText(isDark)),
              onPressed: () {
                Navigator.pop(context);
                openWhatsApp(phoneNumber);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> openEmail(String email) async {
    final uri = Uri(scheme: 'mailto', path: email);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  Future<void> openEmailWeb(String email) async {
    final Uri gmailUri = Uri.parse('https://mail.google.com/mail/?view=cm&to=$email');

    await launchUrl(
      gmailUri,
      webOnlyWindowName: '_blank', // 👈 NEW TAB / NEW SCREEN
    );
  }

  Future<void> openLink(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

class HyperLink extends StatefulWidget {
  final String text;
  final IconData iconName;
  final VoidCallback onTap;

  const HyperLink({super.key, required this.text, required this.iconName, required this.onTap});

  @override
  State<HyperLink> createState() => _HyperLinkState();
}

class _HyperLinkState extends State<HyperLink> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      child: InkWell(
        onTap: widget.onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(widget.iconName, size: 18, color: isHovering ? Colors.blue : AppColors.headerSubText),
            spaceWidth(1),
            Text(
              widget.text,
              style: AppText.headerText().copyWith(color: isHovering ? Colors.blue : AppColors.headerSubText, decoration: isHovering ? TextDecoration.underline : TextDecoration.none),
            ),
          ],
        ),
      ),
    );
  }
}

class WidgetProfilePhoto extends StatelessWidget {
  final double radius;

  const WidgetProfilePhoto({
    super.key,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(radius),
      onTap: () => _showProfileDialog(context),
      child: CircleAvatar(
        radius: radius,
        backgroundImage:
        const AssetImage('assets/images/profile_photo.png'),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
void _showProfileDialog(BuildContext context) {
  final bool isDark = Theme.of(context).brightness == Brightness.dark;
  showDialog(
    context: context,
    builder: (_) {
      return Dialog(
        backgroundColor:
        isDark ? AppColors.darkCard : AppColors.lightCard,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: 240,
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(7), // subtle curve
                child: Image.asset(
                  'assets/images/profile_photo.png',
                  width: 240,
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ),
              spaceHeight(1),
              Text(
                ResumeData.aboutMeName,
                style: AppText.infoText(isDark).copyWith(fontSize: 20,fontWeight: FontWeight.w600),
              ),
              spaceHeight(0.5),
              Text(
                ResumeData.aboutMe1,
                style: AppText.infoText(isDark).copyWith(fontSize: 13),
              ),
              spaceHeight(0.4),
              Text(
                ResumeData.aboutMe2,
                style: AppText.infoText(isDark).copyWith(fontSize: 13),
              ),
              spaceHeight(0.5),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ],
          ),
        ),
      );
    },
  );
}
