import 'package:flutter/material.dart';
import 'package:shared_preference_example/product/colors/project_colors.dart';
import 'package:shared_preference_example/product/language/language_items.dart';

class NawDrawer extends StatelessWidget {
  const NawDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: ProjectColors.blueColor,
            ),
            child: Text(LanguageItems.appBarName.languageItemsString(),
                style: const TextStyle(color: ProjectColors.whiteColor)),
          ),
          ListTile(
            title: Text(LanguageItems.demo.languageItemsString()),
            trailing: const Icon(Icons.wifi_password),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(LanguageItems.demo.languageItemsString()),
            trailing: const Icon(Icons.access_time_filled_outlined),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(LanguageItems.demo.languageItemsString()),
            trailing: const Icon(Icons.bluetooth_connected_sharp),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
