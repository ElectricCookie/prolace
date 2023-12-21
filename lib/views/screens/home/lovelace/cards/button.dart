import 'package:flutter/material.dart';
import 'package:home_portal/views/colors.dart';

class CardButton extends StatelessWidget {
  final Icon? icon;
  final String? label;

  final VoidCallback? onTap;

  const CardButton({
    Key? key,
    this.icon,
    this.label,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cardColor(context),
        border: Border.all(color: borderColor(context)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          height: 42,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                if (icon != null)
                  IconTheme(
                    data: IconThemeData(size: 24, color: textColor(context)),
                    child: icon!,
                  ),
                if (label != null)
                  Expanded(
                      child: Text(
                    label!,
                    style: Theme.of(context).textTheme.labelLarge,
                    textAlign: TextAlign.center,
                  )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
