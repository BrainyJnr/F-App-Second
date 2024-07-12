import 'package:flutter/material.dart';
import 'package:f/utilis/constants/colors.dart';

class fSettingsMenuTile extends StatelessWidget {
  const fSettingsMenuTile({super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.onTap


  });

  final IconData icon;
  final String title,subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon,size: 28,color: fColors.primary,),
      title: Text(title,style: Theme.of(context).textTheme.labelLarge,),
      subtitle: Text(subtitle,style: Theme.of(context).textTheme.labelSmall,),
      trailing: trailing,
      onTap: onTap,


    );
  }
}
