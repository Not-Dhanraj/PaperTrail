import 'package:flutter/material.dart';

class SliverAppBarWidget extends StatelessWidget {
  final String title;
  final String punch;
  final int expHeight;
  final bool paddreq;
  const SliverAppBarWidget(
      {super.key,
      required this.title,
      required this.punch,
      this.expHeight = 210,
      this.paddreq = true});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
      expandedHeight: expHeight.toDouble(),
      floating: false,
      pinned: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          double percentage = (constraints.maxHeight - kToolbarHeight) /
              (expHeight - kToolbarHeight);
          bool isCollapsed = percentage < 0.4; // Adjust threshold

          return FlexibleSpaceBar(
            titlePadding: EdgeInsets.only(
              left: paddreq && isCollapsed
                  ? 56
                  : 16, // Shift right when collapsed
              bottom: 14,
            ),
            title: isCollapsed
                ? Text(
                    title,
                  )
                : null, // Hide title when expanded
            background: Padding(
              padding: EdgeInsets.only(left: 16, bottom: 20),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: AnimatedOpacity(
                  opacity: percentage.clamp(0.0, 1.0),
                  duration: Duration(milliseconds: 200),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(punch, style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
