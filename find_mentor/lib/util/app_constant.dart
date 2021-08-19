import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:find_mentor/util/app_localizations.dart';

class AppConstant {
  // Colors
  static final Color colorPrimary = Color(0xFF71BFBC); // Color(0xFFE11E3C);
  static final Color colorPageBg = Color(0xFFF8F8F8);
  static final Color colorHeading = Color(0xFF0A151F);
  static final Color colorParagraph = Color(0xFF4B5866);
  static final Color colorParagraph2 = Color(0xFF758291);
  static final Color colorVowelBg = Color(0xFFF0F0F0);
  static final Color colorUnifiedWordBg = Color(0xFFE8F0F1);
  static final Color colorUnifiedWordSearch = Color(0xFF73A5AA);
  static final Color colorUnifiedWordText = Color(0xFF2E494C);
  static final Color colorProverbsIdiomsBg = Color(0xFFF9F5F1);
  static final Color colorDrawerButton = Color(0xFFE8EAED);
  static final Color colorPullDown1 = Color(0xFFDEE3E3);
  static final Color colorBackButton = Color(0xFF48515B);
  static final Color colorAppDescription = Color(0xFF33414C);
  static final Color colorBottomSheetItemHeader = Color(0xFF183148);
  static final Color colorBottomSheetDivider = Color(0xFFEEF0F2);
  static const Color colortextBlueDark = Color(0xFF2D4379);
  static const Color colorlightBlueGrey = Color(0xFFDEE7FF);
  static const Color colortextDark = Color(0xFF0D253C);
  static const Color colorSkyBlue = Color(0xFF71B4FB);
  static final Color colorDarkBlue = Color(0xFF0047CC);
  static const Color colorLightBlue = Color(0xFF7FBCFB);
  static const Color colorExtraLightBlue = Color(0xFFD9EEFF);
  static const Color colorOrange = Color(0xFFFA8C73);
  static const Color colorLightOrange = Color(0xFFFF7643); // Color(0xFFFA9881);
  static const Color colorSubTitleTextColor = Color(0xFFB9BFCD);
  static const Color colorGrey = Color(0xFFB8BFCE);
  static const Color colorGreyIcon = Color(0xFFE2E6EB);
  static const Color colorGreyLight = Color(0xffEEEFF1);
  static final Color colorDarkGrey = Color(0xFF7B8BB2);
  static const Color colorPurple = Color(0xFF8873F4);
  static const Color colorPurpleLight = Color(0xFF9489F4);
  static const Color colorPurpleExtraLight = Color(0xFFB1A5F6);
  static const Color colorIconColor = Color(0xFFCBD0DB);
  static const Color colorGreen = Color(0xFF4CD1BC);
  static const Color colorLightGreen = Color(0xFF5ED6C3);
  static const Color colorRed = Color(0xFFFC5565);
  static const Color jobTextLink = Color(0xFF525A63);
  static const Color colorLink = Color(0xFF007BFF);
  static const Color colorGitHub = Color(0xFF222123);
  static const Color colorTwitter = Color(0xFF65AFF6);
  static const Color colorLinkedin = Color(0xFF007AB9);
  static const Color colorBoth = Color(0xFFFFC400);
  static const Color colorMentor = Color(0xFF17AA90);
  static const Color colorMentee = Color(0xFF206694);

  // Gradient
  static final Shader primaryTextGradientColor = LinearGradient(
    colors: <Color>[Color(0xFF216383), Color(0xFF71BFBC)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  static final primaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF216383), Color(0xFF71BFBC)],
  );

  // Fonts
  static const double fontSizeCaption = 12;
  static const double fontSizeBody2 = 14;
  static const double fontSizeBody = 16;
  static const double fontSizeTitle = 22;
  static const double fontSizeHeadline = 24;
  static const double fontSizeDisplay = 32;
  static const double fontSizeIdiomCardTitle = 18;
  static const double fontSizeIdiomCardContent = 12;

  // Strings
  static final String appVersion = "v.1.0";
  static final String appName = 'Find Mentor';
  static final String appDescription = 'Change Your Career';
  static final String appLongDescription = '';
  static final String appLongRichDescription = "How To Be A 🌟GREAT🌟 Mentee?";
  static final String phoneNumber = 'We Don\'t Know Yet';
  static final String eposta = 'yunus192alpu@gmail.com';

  static final String jobsText = AppLocalizations.getString('Jobs');
  static final String eventsText = AppLocalizations.getString('Events');
  static final String mentorshipsText = AppLocalizations.getString('Mentorships');
  static final String mentorsText = AppLocalizations.getString('Mentors');
  static final String menteesText = AppLocalizations.getString('Mentees');
  static final String sendText = AppLocalizations.getString('Send');
  static final String requirementsText = AppLocalizations.getString('Requirements');
  static final String speakersText = AppLocalizations.getString('Speakers');
  static final String cancelText = AppLocalizations.getString('Cancel');
  static final String socialText = AppLocalizations.getString("Social");
  static final String getConnectedText = AppLocalizations.getString("Get Connected");
  static final String feedbackText = AppLocalizations.getString('Feedback'); // Contribution & Suggestions
  static final String joinUsText = AppLocalizations.getString('Join Us');
  static final String joinUsNowText = AppLocalizations.getString('Join Us Now');
  static final String followUsText = AppLocalizations.getString('Follow Us');
  static final String contactUsText = AppLocalizations.getString("Contact Us");
  static final String howItWorksText = AppLocalizations.getString("How It Works?");
  static final String searchText = AppLocalizations.getString('Search in network');
  static final String searchHistoryText = AppLocalizations.getString('Search History');
  static final String searchMentorText = AppLocalizations.getString('Search in mentors by name...');
  static final String searchMenteeText = AppLocalizations.getString('Search in mentees by name...');
  static final String searchJobText = AppLocalizations.getString('Job title, keywords, or company');
  static final String searchEventText = AppLocalizations.getString('Search for the event you want to join');
  static final String contactDetailsText = AppLocalizations.getString('Contact Details');
  static final String websiteBtnText = AppLocalizations.getString('Find Mentor Network');
  static final String contributionsText = AppLocalizations.getString('Feel free to contribute!');
  static final String suggestionsDetails = 'Every night & every deploy, the spreadsheet will be parsed by GitHub actions, then generate this beauty.\n\n\nIf you have any queries or issues for which you need your assistance: Feel free to mail us.';
  static final String jobsPageGuide = 'This community, driven/developed by a fellow community. As you can see, this project is the mentorship project. Developed by mentees.\nYou can list your job listing below for 30 days.';
  static final String eventsPageGuide = 'You can find all the events organized by';

  // Links
  static final String websiteLink = 'https://findmentor.network/';
  static final String discordLink = 'https://discord.gg/EDwkj6Z7W2';
  static final String twitterLink = 'https://twitter.com/findmentorapp';
  static final String apiEventsURL = 'assets/lottie/events.json';
  static final String apiJobsURL = 'https://findmentor.network/jobs.json';
  static final String apiPersonsURL = 'https://findmentor.network/persons.json';
  static final String githubLink = 'https://github.com/findmentor-network/find-mentor';
  static final String googleFormLink = 'https://github.com/findmentor-network/find-mentor';
  static final String linkedinLink = 'https://www.linkedin.com/company/find-mentor-network';
  static final String youtubeLink = 'https://www.youtube.com/channel/UCx7Q-6Qqrf9TU5gY-i9xovA';
  static final String addJobLink = 'https://docs.google.com/forms/d/e/1FAIpQLSehaOyJDsY_mKOPNYtwrgLv3ynbLUBDsIUFJqyTnNfW16ijPA/viewform';

  // Splash Screen
  static final String splashAnimatedText1 = AppLocalizations.getString('Find & Match');
  static final String splashAnimatedText2 = AppLocalizations.getString('Meet, Ask, Listen, Learn');
  static final String splashAnimatedText3 = AppLocalizations.getString('Change Your Career');

  // Error Messages
  static final String callErrorText = AppLocalizations.getString('Call failed');
  static final String mailErrorText = AppLocalizations.getString('E-Mail not delivered');
  static final String websiteErrorText = AppLocalizations.getString('Could not open website!');

  // Pages
  static final String pageSplash = "/";
  static final String pageHome = "/home";

  // Assets
  static final String svgJoin = "assets/icons/Join.svg";
  static final String svgGitHub = "assets/icons/Github.svg";
  static final String svgDiscord = "assets/icons/Discord.svg";
  static final String svgYoutube = "assets/icons/Youtube.svg";
  static final String svgTwitter = "assets/icons/Twitter1.svg";
  static final String svgLinkedin = "assets/icons/Linkedin.svg";
  static final String pngBackgroundImage = "assets/images/bg.png";
  static final String svgBackgroundImage = "assets/images/bg.svg";
  static final String svgLogo = "assets/images/find_mentor_logo.svg";
  static final String svgMessage1 = "assets/icons/icon_message1.svg";
  static final String svgMessage2 = "assets/icons/icon_message2.svg";
  static final String svgMessage3 = "assets/icons/icon_message3.svg";
  static final String svgMessage4 = "assets/icons/icon_message4.svg";
  static final String pngUserImage = "assets/images/user2.png";
  static final String pngCompanyImage = "assets/images/company2.png";
  static final String svgMentorGitHub = "assets/icons/Github2.svg";
  static final String svgMentorTwitter = "assets/icons/Twitter2.svg";
  static final String svgMentorLinkedin = "assets/icons/Linkedin3.svg";
  static final String svgMenteeGitHub = "assets/icons/Github3.svg";
  static final String svgMenteeTwitter = "assets/icons/Twitter3.svg";
  static final String svgMenteeLinkedin = "assets/icons/Linkedin4.svg";

  // Global Variables
  static int mentorCount = 0;
  static int menteesCount = 0;
  static int jobsCount = 0;
  static int eventsCount = 0;
}
