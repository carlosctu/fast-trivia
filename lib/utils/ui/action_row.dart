import 'package:flutter/material.dart';

class ActionRow extends StatelessWidget {
  final Text title;
  final Text subtitle;
  final VoidCallback onPressed;
  final Widget? rightContent;
  const ActionRow({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onPressed,
    this.rightContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      splashFactory: NoSplash.splashFactory,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultTextStyle(
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    child: title,
                  ),
                  const SizedBox(height: 8),
                  DefaultTextStyle(
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                    child: subtitle,
                  ),
                ],
              ),
            ),
            if (rightContent != null)
              Flexible(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: rightContent!,
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey[800],
                size: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
