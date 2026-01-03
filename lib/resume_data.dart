import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_cv_web/model/education_model.dart';
import 'package:my_cv_web/model/project_model.dart';
import 'model/experience_model.dart';

class ResumeData {

  static const phone = ContactItem(
    icon: Icons.phone,
    label: '84696 10044',
    value: 'tel:+918469610044',
  );

  static const email = ContactItem(
    icon: Icons.mail,
    value: 'ankur.solanki.dev@gmail.com',
    label: 'mail: ankur.solanki.dev@gmail.com',
  );

  static const linkedIn = ContactItem(
    icon: FontAwesomeIcons.linkedin,
    label: 'LinkedIn - Ankur Solanki',
    value:
    'https://www.linkedin.com/in/ankur-solanki-167a7525b/?trk=opento_sprofile_topcard',
  );

  static const downloadPdf = ContactItem(
    icon: FontAwesomeIcons.download,
    label: 'Download Resume',
    value: 'https://drive.google.com/file/d/1PRdEH7aI8gkXaeMbmMUjqqcxiKEVqch1/view?usp=sharing',
  );

  static const String aboutMeName = 'Hello, I’m Ankur Solanki.';
  static const String aboutMe1 = '- I’m an explorer at heart, comfortable stepping into the unknown—whether it’s traveling to unfamiliar places or taking on challenging projects.';
  static const String aboutMe2 = '- I enjoy learning through experience and continuously pushing myself beyond what’s familiar.';

  static List<String> arraySummary = [
    'Flutter Developer with hands-on experience building production-grade mobile applications using Dart and Flutter. Worked on API integration, state management (GetX, BLoC), local database management (SQLite), and JSON-based model handling as part of real-world projects.',
    'Experienced in developing both mobile and desktop applications, including systems that integrate with hardware devices, process decimal sensor data, and convert it for real-time use. Comfortable working across the full development cycle — from UI/UX design in Figma to implementation, testing, and debugging.',
    'Previously worked in a small team environment with shared responsibility for project delivery, where I contributed to task planning, mentored junior developers, reviewed progress, coordinated directly with clients after project initiation, tracked feedback and meeting notes, and aligned implementation until project completion in close coordination with the company owner. Known for clean code practices, practical problem-solving, and delivering scalable solutions under real-world constraints.',
  ];

  static const Map<String, List<String>> mapSkills = {
    'Core Skills': ['Flutter, Dart', 'State Management: GetX, BLoC', 'REST API Integration, JSON', 'Local Database: SQLite'],
    'Platforms': ['Mobile Applications', 'Web Applications', 'Desktop Applications', 'Hardware-Integrated Systems'],
    'Design': ['Figma (UI/UX Design)', 'Adobe Photoshop'],
    'Collaboration': ['Client Communication', 'Task Planning & Coordination', 'Mentoring Junior Developers', 'Progress Tracking & Reporting', 'Client Feedback Analysis', 'Requirement Clarification', 'Project Follow-up & Delivery Coordination'],
  };

  static List<String> arrayTools = ['Android Studio, VS Code', 'Git, GitHub', 'Postman', 'Flutter DevTools', 'SQLite', 'Figma, Adobe Photoshop', 'Google Sheets, Google Docs'];

  static const List<ExperienceModel> experiences = [
    ExperienceModel(
      role: 'Flutter Developer',
      iconName: Icons.work,
      company: 'Anantkaal',
      duration: 'Feb 2023 – Present',
      responsibilities: [
        'Developing production-grade Flutter applications for mobile and desktop platforms',
        'Working on API integration, state management (GetX, BLoC), and local databases',
        'Coordinating directly with clients, presenting progress, gathering feedback, and tracking requirements',
        'Contributing to task planning, mentoring junior developers, and collaborating with the company owner',
      ],
    ),
    ExperienceModel(
      role: 'Flutter Developer',
      iconName: Icons.school,
      company: 'Self Learning / Freelance',
      duration: 'Jan 2021 – Jan 2023',
      responsibilities: [
        'Learned Flutter deeply through hands-on projects and real use cases',
        'Built mobile and desktop applications with API integration and local data storage',
        'Worked with a small group of peers on freelance and practice projects',
        'Focused on improving architecture, UI responsiveness, and debugging skills',
      ],
    ),
    ExperienceModel(
      role: 'Android Developer',
      iconName: Icons.work,
      company: 'Tech Fusion Technologies',
      duration: 'June 2019 – Mar 2020',
      responsibilities: ['Developed Android applications using Java', 'Implemented UI screens, API integration, and basic local storage', 'Worked closely with senior developers on real client projects'],
    ),
    ExperienceModel(
      role: 'Android Developer Intern',
      iconName: Icons.school,
      company: 'Tech Fusion Technologies',
      duration: 'June 2018 – May 2019',
      responsibilities: ['Assisted in Android application development during internship', 'Learned Android fundamentals, layouts, and debugging', 'Contributed to small features and bug fixes'],
    ),
  ];

  static const List<EducationModel> education = [
    EducationModel(subject: 'B.E. Computer Engineering', iconName: Icons.stadium_rounded, instituteName: 'G.I.D.C. Engineering Collage - Abrama', duration: '2015-2019'),
    EducationModel(subject: '12 Science', iconName: Icons.local_convenience_store_sharp, instituteName: 'G.N. Pandiya - Sachin', duration: '2013-2015'),
    EducationModel(subject: '10 SSC', iconName: Icons.school_outlined, instituteName: 'L.D. Highschool - Sachin', duration: '2013-2015'),
  ];

  static const List<ProjectModel> project = [
    ProjectModel(
      projectTitle: "Data Logger Software by Encardio Rite",
      client: "Encardio Rite",
      projectType: "Industrial Software • Hardware–Software Integration • Desktop Application",
      domain: "Structural Monitoring • Sensor Data Acquisition • Industrial Instrumentation",
      projectSummary:
          "Developed a full-scale industrial software solution to communicate with and manage proprietary Data Logger hardware. The system supports real-time and offline sensor data acquisition, synchronization, processing, reporting, and secure licensing for deployments ranging from single sensors to large multi-sensor networks (up to 186 sensors per logger).",
      keyChallenge: [
        "Reliable two-way communication with proprietary hardware",
        "Handling multiple sensor types with different response times",
        "Time synchronization between software and hardware devices",
        "Filtering and validation to prevent noisy or incorrect data",
        "Supporting online (SIM-based) and offline data workflows",
        "Secure licensing and controlled hardware usage",
      ],
      responsibilities: [
        "Built hardware–software communication layer for decoding decimal-formatted raw data",
        "Implemented time synchronization between PC software and data logger",
        "Designed dynamic sensor configuration modules",
        "Managed asynchronous sensor responses for accurate data mapping",
        "Implemented data logging, formatting, and processing pipelines",
        "Generated structured PDF reports from processed sensor data",
        "Developed workflows for downloading and formatting historical logs",
        "Integrated SIM-based data upload to server",
        "Built separate license key encryption utility",
        "Implemented secure key validation and license enforcement (1–186 sensors)",
      ],
      keyFeatures: ["Multi-sensor data acquisition and management", "Offline and online (SIM-based) data handling", "Time-accurate sensor logging", "Automated PDF report generation", "Secure licensing and encryption system", "Scalable architecture for industrial deployments"],
      impact: ["Enabled reliable management of complex sensor networks", "Reduced manual data handling and reporting errors", "Delivered a production-ready industrial software solution", "Supported large-scale monitoring projects with high sensor counts"],
      imagePaths: [
        "assets/images/encardio/Encardio_Dashboard_Screen.jpg",
        "assets/images/encardio/Encardio_GPS_Setting.png",
        "assets/images/encardio/Encardio_Sensor_Reading.png",
        "assets/images/encardio/Encardio_Sensor_Setting.jpg",
        "assets/images/encardio/Encardio_Sensor_Table.jpg",
        "assets/images/encardio/Encardio_Database_Flow.png",
      ],
    ), //Encardio Rites
    ProjectModel(
      projectTitle: "Thermal Conductivity Measurement Software (Toshniwal Bomb)",
      client: "Toshniwal Instruments",
      projectType:
      "Industrial Software • Hardware–Software Communication • Scientific Measurement System",
      domain:
      "Thermal Analysis • Material Testing • Laboratory Instrumentation",
      projectSummary:
      "Developed industrial software to control and communicate with Toshniwal’s thermal conductivity measurement device. The system automates thermal experiments on material samples, captures temperature data at fixed intervals, applies scientific formulas, manages multiple practical runs per project, and generates finalized PDF reports for laboratory and industrial use.",
      keyChallenge: [
        "Reliable command-based communication with proprietary hardware",
        "Managing time-bound experiments (10-minute cycles)",
        "Accurate temperature sampling and logging",
        "Handling conditional experiment termination",
        "Implementing scientific averaging across multiple practical runs",
        "Structuring data for repeatable lab projects and reports",
      ],
      responsibilities: [
        "Built command-based communication layer to control device operations",
        "Triggered thermal spark inside capsules via software commands",
        "Implemented real-time temperature data capture every 20 seconds",
        "Updated live temperature graph during experiments",
        "Designed 10-minute experiment logic with 1-minute sampling",
        "Implemented conditional auto-stop when temperature decreases",
        "Handled forced completion after full experiment duration",
        "Supported up to 5 practical runs per project",
        "Stored individual practical data separately",
        "Calculated average results across all practical runs",
        "Applied scientific thermal formulas provided by client",
        "Generated structured PDF reports with graphs and tables",
        "Added device configuration and calibration settings",
        "Enabled multi-project handling with isolated data storage",
      ],
      keyFeatures: [
        "Hardware-triggered thermal experiments",
        "Real-time temperature graphing",
        "Interval-based data logging",
        "Conditional process control",
        "Multi-practical averaging logic",
        "Project-wise and practical-wise data storage",
        "Automated PDF report generation",
        "Device settings and calibration management",
      ],
      impact: [
        "Replaced manual thermal testing workflows",
        "Improved accuracy and repeatability of experiments",
        "Enabled laboratories to manage multiple projects efficiently",
        "Delivered a production-grade scientific measurement system",
      ],
      imagePaths: [
        "assets/images/toshniwal/Toshniwal_Dashboard_Screen.jpg",
        "assets/images/toshniwal/Toshniwal_Graph_Generation.jpg",
        "assets/images/toshniwal/Toshniwal_Practical_Screen.jpg",
        "assets/images/toshniwal/Toshniwal_Report_Screen.jpg",
        "assets/images/toshniwal/Toshniwal_Setting_Screen.jpg",
      ],
    ), //Toshniwal Bomb
    ProjectModel(
      projectTitle: "Personal Resume & Portfolio Web Application",
      client: "Self / Personal Project",
      projectType:
      "Web Application • Personal Branding • UI/UX + Frontend Engineering",
      domain:
      "Developer Portfolio • Resume Automation • Web UI Systems",
      projectSummary:
      "Designed and developed a fully responsive resume and portfolio web application to showcase professional experience, industrial projects, and technical skills. The platform uses a modular architecture, clean UI system, and scalable content structure, enabling rapid updates without redesigning layouts.",
      keyChallenge: [
        "Traditional resumes fail to explain complex industrial projects",
        "PDF resumes are static, non-interactive, and limited",
        "Need for a structured platform to present hardware–software projects clearly",
        "Balancing professional design with performance and simplicity",
      ],
      responsibilities: [
        "Designed modular resume sections for experience, projects, skills, and education",
        "Implemented project detail popups for deep project explanations",
        "Built fully responsive layouts for desktop, tablet, and mobile",
        "Created reusable UI components (cards, sections, buttons)",
        "Implemented centralized theme and color system",
        "Ensured clean typography hierarchy for readability",
        "Structured scalable project data using models and JSON-like structures",
        "Optimized UI performance with minimal animations",
        "Maintained clear separation between layout, data, and styling",
        "Ensured SEO-friendly structure for better discoverability",
      ],
      keyFeatures: [
        "Interactive project showcase with detailed popups",
        "Modular and reusable UI components",
        "Light-themed professional design",
        "Fully responsive and performance-optimized layout",
        "Scalable and maintainable content architecture",
      ],
      impact: [
        "Clearly communicates industrial-scale projects to non-technical recruiters",
        "Allows deep project explanation without cluttering the main resume",
        "Acts as a single source of truth for resume, portfolio, and case studies",
        "Strengthens personal brand as a serious software engineer",
      ],
      imagePaths: [
        "assets/images/cvweb/Cv_Web_Desktop.jpg",
        "assets/images/cvweb/Cv_Web_Mobile_DarkMode.jpg",
        "assets/images/cvweb/Cv_Web_Mobile_LigjtMode.jpg",
        "assets/images/cvweb/Cv_Web_Project.jpg",
        "assets/images/cvweb/Cv_Web_Project_Dialogbox.jpg",
        "assets/images/cvweb/Cv_Web_Tab.jpg",
      ],
    ), //Resume Web
    ProjectModel(
      projectTitle: "OnOn – Competitive Social Gaming Mobile App",
      client: "Client Project - Mobile App",
      projectType: "Mobile Application • Social Gaming • Match & Event Management",
      domain: "Casual & Club-based Games • Social Competition • Player Rankings",

      projectSummary:
      "OnOn is a mobile application designed to enable players to compete in real-world games hosted at registered clubs. The app allows two players to challenge each other, log match results, track performance history, and build competitive profiles. It also supports club-organized events and tournaments, enabling structured competition and community engagement through a single mobile platform.",

      keyChallenge: [
        "Designing a reliable match logging system between two players",
        "Associating match results with physical club locations",
        "Maintaining accurate leaderboards across players, friends, and clubs",
        "Implementing phone number–based friend discovery and challenges",
        "Supporting tournament and event participation workflows",
        "Balancing social interaction with fair competition tracking",
      ],

      responsibilities: [
        "Designed end-to-end mobile app flow for player-versus-player challenges",
        "Implemented player profile system with match history, scores, and win/loss tracking",
        "Built match recording logic capturing opponent, score, winner, and club location",
        "Implemented phone number–based friend discovery and challenge system",
        "Developed leaderboard logic for global players, friends, and clubs",
        "Designed club modules showing available games, rankings, and hosted events",
        "Implemented tournament listing and player participation workflows",
        "Built pre-scheduled match challenge feature within the mobile app",
        "Designed dashboard views highlighting top players, clubs, and recent matches",
      ],

      keyFeatures: [
        "Player challenge and score logging system",
        "Mobile player profiles with performance statistics",
        "Club-based match tracking and rankings",
        "Friend discovery and challenges via phone number",
        "Global, club-level, and friend-level leaderboards",
        "Club-hosted events and tournament participation",
        "Pre-scheduled match challenges",
        "Competitive dashboards and rankings",
      ],

      impact: [
        "Digitized real-world competitive gameplay into a mobile experience",
        "Improved player engagement through rankings, challenges, and events",
        "Enabled clubs to manage and promote competitions digitally",
        "Provided players with long-term performance visibility and history",
        "Created a scalable foundation for community-driven competitive gaming",
      ],

      imagePaths: [
        "assets/images/onon/OnOn_Club_Ranking.jpg",
        "assets/images/onon/OnOn_Club_Search.jpg",
        "assets/images/onon/OnOn_Home_Screen.jpg",
        "assets/images/onon/OnOn_Leaderboard.jpg",
        "assets/images/onon/OnOn_Match_Record.jpg",
        "assets/images/onon/OnOn_Profile_Screen.jpg",
      ],
    ), //OnON App
    ProjectModel(
      projectTitle: "IPWORK – Device Data Analysis & Visualization Tool",
      client: "Internal / Client Project",
      projectType: "Data Analysis Application • Visualization • Device Data Processing",
      domain: "Machine Data Analysis • Time-Series Processing • Technical Observation",

      projectSummary:
      "IPWORK is a data analysis and visualization application designed to process raw output files generated by industrial or electronic devices. The application allows users to import device-generated files containing time–value data (single or multi-column), parse and structure the data, visualize it as graphs, and perform mathematical operations to analyze, correct, and compare datasets for accurate observation and interpretation.",

      keyChallenge: [
        "Handling device-generated files with varying formats and column structures",
        "Parsing time-series data accurately from raw machine output files",
        "Supporting both single-column and multi-column time–value datasets",
        "Ensuring correct alignment of time and value data across graphs",
        "Providing mathematical operations without distorting original data integrity",
        "Visualizing multiple datasets clearly on a single screen",
      ],

      responsibilities: [
        "Designed file import and parsing logic for device-generated data files",
        "Implemented dynamic column detection and separation of time–value data",
        "Built time-series data processing pipelines for structured logging",
        "Developed interactive graph visualization for parsed datasets",
        "Implemented mathematical operations (add, subtract, multiply, divide) on graph values",
        "Built comparison logic to combine two datasets and generate a third result graph",
        "Implemented multi-graph visualization on a single screen for observation",
        "Ensured numerical accuracy and consistency during data transformations",
        "Designed workflows focused on observation, comparison, and error correction",
      ],

      keyFeatures: [
        "Import and parsing of machine-generated data files",
        "Support for single and multi-column time–value datasets",
        "Time-series graph visualization",
        "Mathematical operations on graph values for error correction",
        "Dataset-to-dataset operations producing derived graphs",
        "Multi-graph display for comparative analysis",
        "Structured logging and observation-focused UI",
      ],

      impact: [
        "Simplified analysis of raw machine output data",
        "Reduced manual calculation and data correction effort",
        "Improved accuracy in interpreting device-generated measurements",
        "Enabled faster comparison and validation of multiple datasets",
        "Provided a reliable tool for technical observation and analysis workflows",
      ],

      imagePaths: [
        "assets/images/ipwork/IPWORK_Dashboard_Screen.jpg",
        "assets/images/ipwork/IPWORK_Opration_Screen.jpg",
        "assets/images/ipwork/IPWORK_Multi_Graph_Operation.jpg",
        "assets/images/ipwork/IPWORK_Connection.jpg",
      ],
    ),  //IpWork
  ];
}
class ContactItem {
  final IconData icon;
  final String label;
  final String value;

  const ContactItem({
    required this.icon,
    required this.label,
    required this.value,
  });
}
