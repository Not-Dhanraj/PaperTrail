import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moon_design/moon_design.dart';
import 'package:proj_app/src/features/theme/application/themer.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var themer = ref.watch(themeProvider.notifier);

    return SingleChildScrollView(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.only(top: 30, left: 15, bottom: 5),
              child: Text(
                "Settings",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 40)),
          Card(
            child: SizedBox(
              height: 120,
              width: 120,
              child: Image.network(
                  fit: BoxFit.cover,
                  height: 120,
                  'https://images.pexels.com/photos/30729229/pexels-photo-30729229/free-photo-of-beautiful-pink-and-white-rose-with-dew.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
          ),
          Text(
            'Account Name',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text('AccountEmail@mail.com'),
          Padding(
            padding: EdgeInsets.all(8),
          ),
          ListTile(
            leading: Icon(MoonIcons.text_size_16_light),
            title: Text('Theme Mode'),
            subtitle: Text('Select Theme Mode'),
            trailing: MoonSwitch(
              value: Theme.of(context).brightness == Brightness.light,
              activeThumbWidget: Icon(MoonIcons.other_sun_24_regular),
              inactiveThumbWidget: Icon(MoonIcons.other_moon_24_regular),
              onChanged: (value) {
                if (Theme.of(context).brightness == Brightness.dark) {
                  themer.switchMode(ThemeMode.light);
                } else {
                  themer.switchMode(ThemeMode.dark);
                }
              },
            ),
          ),
          ListTile(
            leading: Icon(MoonIcons.text_size_16_light),
            title: Text('Submit Notes or Papers'),
            subtitle:
                Text('Help us add more contet so others can easily find it'),
            trailing: Icon(MoonIcons.arrows_boost_24_regular),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(MoonIcons.text_size_16_light),
            title: Text('Contact us!'),
            subtitle: Text('Reach out to use in case of any issues'),
            trailing: Icon(MoonIcons.arrows_boost_24_regular),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(MoonIcons.text_size_16_light),
            title: Text('Terms of Service'),
            subtitle: Text('Read Terms of Service'),
            trailing: Icon(MoonIcons.arrows_boost_24_regular),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(MoonIcons.text_size_16_light),
            title: Text('Licenses'),
            subtitle: Text('Read licenses'),
            trailing: Icon(MoonIcons.arrows_boost_24_regular),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(MoonIcons.text_size_16_light),
            title: Text('About Us'),
            subtitle: Text('Know more about us'),
            trailing: Icon(MoonIcons.arrows_boost_24_regular),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(MoonIcons.text_size_16_light),
            title: Text('App Version'),
            subtitle: Text('v0.1-alpha'),
            onTap: () {},
          ),
          Divider(),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Made with ❤ using Flutter!",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.secondary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
