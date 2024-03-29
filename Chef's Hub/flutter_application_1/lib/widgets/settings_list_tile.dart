
import 'package:flutter/material.dart';

class SettingsListTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SettingsListTile({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
    );
  }
}
