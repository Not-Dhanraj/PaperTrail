import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moon_design/moon_design.dart';
import 'package:papertrail/src/common/data/const.dart';
import 'package:papertrail/src/common/widgets/sliver_appbar.dart';
import 'package:papertrail/src/features/fav/presentation/fav_page.dart';
import 'package:papertrail/src/features/theme/application/themer.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var themer = ref.watch(themeProvider.notifier);

    return CustomScrollView(
      slivers: [
        // SliverAppBar(
        //   floating: true,
        //   pinned: true,
        //   expandedHeight: 150,
        //   flexibleSpace: FlexibleSpaceBar(
        //     title: Text("Settings & Info"),
        //     centerTitle: true,
        //   ),
        // ),
        SliverAppBarWidget(
          title: 'Settings & Info',
          punch: 'Notes. Papers. Quizzes. Sorted!',
          bpadding: 0,
          expHeight: 170,
          tintColor: Theme.of(context).scaffoldBackgroundColor,
          paddreq: false,
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle(context, "Favourites"),
                  _buildListTile(
                    context,
                    title: "Bookmarks",
                    subtitle: "Access your Bookmarks",
                    icon: MoonIcons.generic_bookmark_alternative_24_regular,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => FavoritesPage(),
                        ),
                      );
                    },
                  ),
                  _buildSectionTitle(context, "Theme"),
                  ListTile(
                    leading: Icon(MoonIcons.text_size_16_light),
                    title: Text('Theme Mode'),
                    subtitle: Text('Select Theme Mode'),
                    trailing: MoonSwitch(
                      value: Theme.of(context).brightness == Brightness.light,
                      activeThumbWidget: Icon(MoonIcons.other_sun_24_regular),
                      inactiveThumbWidget:
                          Icon(MoonIcons.other_moon_24_regular),
                      onChanged: (value) {
                        themer.switchMode(
                          Theme.of(context).brightness == Brightness.dark
                              ? ThemeMode.light
                              : ThemeMode.dark,
                        );
                      },
                    ),
                  ),
                  _buildSectionTitle(context, "Help and Feedback"),
                  _buildEmailTile(
                      context,
                      "Submit Notes or Papers",
                      "Help us add more content so others can easily find it",
                      "Sending new content to add in app"),
                  _buildEmailTile(
                      context,
                      "Contact us!",
                      "Reach out to us in case of any issues",
                      "Help regarding app"),
                  _buildSectionTitle(context, "Legal"),
                  _buildListTile(
                    context,
                    title: "Disclaimer",
                    subtitle: "See Disclaimer",
                    icon: MoonIcons.generic_info_alternative_24_regular,
                    onTap: () {
                      showMoonModal<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: MoonModal(
                              child: IntrinsicHeight(
                                child: Material(
                                  type: MaterialType.transparency,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      children: [
                                        Icon(MoonIcons.generic_about_24_regular,
                                            size: 30),
                                        Divider(),
                                        SizedBox(height: 8),
                                        Text(
                                            "All the content in the app is for personal use only! Please do not repost downloaded materials."),
                                        Center(
                                          child: MoonButton(
                                            label: Text('Okay'),
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  _buildListTile(
                    context,
                    title: "Licenses",
                    subtitle: "See Open Source Licenses",
                    icon: MoonIcons.files_code_24_regular,
                    onTap: () {
                      showLicensePage(
                        context: context,
                        applicationName: Constants().appName,
                        applicationLegalese: Constants().appDev,
                        applicationVersion: Constants().appVersion,
                        applicationIcon: Card(
                          child: SizedBox(
                            height: 120,
                            width: 120,
                            child: Image.asset(
                                fit: BoxFit.cover,
                                height: 120,
                                'assets/icon/icon.png'),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Text("Made with ❤ using Flutter!",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ]),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 20, bottom: 5),
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildListTile(BuildContext context,
      {required String title,
      required String subtitle,
      required IconData icon,
      required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Icon(MoonIcons.arrows_right_24_regular),
      onTap: onTap,
    );
  }

  Widget _buildEmailTile(
      BuildContext context, String title, String subtitle, String subject) {
    return _buildListTile(
      context,
      title: title,
      subtitle: subtitle,
      icon: MoonIcons.mail_envelope_24_regular,
      onTap: () async {
        final Email email = Email(
          body: '',
          subject: subject,
          recipients: ['paradoxstudios91@gmail.com'],
          isHTML: false,
        );
        await FlutterEmailSender.send(email);
      },
    );
  }
}
