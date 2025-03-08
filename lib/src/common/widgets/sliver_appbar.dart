import 'package:flutter/material.dart';

class SliverAppBarWidget extends StatelessWidget {
  final String title;
  final String punch;
  final int expHeight;
  final Color tintColor;
  final bool paddreq;
  final int bpadding;
  final int bTpadding;
  final PreferredSizeWidget? bottomwid;
  const SliverAppBarWidget(
      {super.key,
      required this.title,
      required this.punch,
      required this.tintColor,
      this.expHeight = 210,
      this.bpadding = 20,
      this.paddreq = true,
      this.bTpadding = 21,
      this.bottomwid});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 70,
      bottom: bottomwid,
      surfaceTintColor: tintColor,
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
              bottom: bTpadding.toDouble(),
            ),
            title: isCollapsed
                ? Text(
                    title,
                  )
                : null, // Hide title when expanded
            background: Padding(
              padding: EdgeInsets.only(left: 16, bottom: bpadding.toDouble()),
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
