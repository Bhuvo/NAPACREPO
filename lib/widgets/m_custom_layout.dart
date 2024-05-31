import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foode/presentation/theme/theme.dart';
import 'package:foode/presentation/widgets/m_back_button.dart';
import 'package:foode/presentation/widgets/space.dart';
import 'package:foode/utils/navigator_utils.dart';
import 'package:sliver_tools/sliver_tools.dart';

class MCustomLayout extends StatelessWidget {

  final Widget? title, collapsedTitle, flexibleSpace, floatingActionButton;
  final double expandedHeight;
  final CollapseMode collapseMode;
  final bool curvedBottom, pinned;
  final Color? appBar;
  //final FloatingActionButtonLocation? floatingActionButtonLocation;
  final List<Widget> Function(BuildContext, bool)? headerSliverBuilder;
  final Color? backgroundColor;
  final ScrollController? scrollController;
  const MCustomLayout(
      {Key? key,
        this.curvedBottom = true,
        this.pinned = true,
        this.appBar,
        this.collapseMode = CollapseMode.pin,
        this.scrollController,
      this.title,
        this.backgroundColor,
      this.collapsedTitle,
      this.flexibleSpace,
      //this.floatingActionButtonLocation,
      this.floatingActionButton,
      this.expandedHeight = 200.0,
      this.headerSliverBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      reverse: false,
      controller: scrollController,
      slivers: [
        MultiSliver(children: [
          SliverAppBar(
            expandedHeight: expandedHeight,
            floating: false,
            pinned: pinned,
            stretch: true,
            title: title,
            // title: AnimatedSwitcher(
            //   duration: const Duration(milliseconds: 300),
            //   //child: innerBoxIsScrolled ? title : expandedTitle,
            //   child:  expandedTitle,
            // ),
            titleSpacing: 0,
            collapsedHeight: 64,
            leading: LayoutBuilder(
              builder: (_, __) {
                if(context.canPop()) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        child: MBackButton(size: 42, invert: true)),
                  );
                }
                return const Space(0);
              }
            ),
            leadingWidth: 74,
            shape: MTheme.bottomCurve,

            automaticallyImplyLeading: false,
            flexibleSpace: LayoutBuilder(
              builder: (context, c) {
                double top = c.biggest.height;
                double max =  expandedHeight;
                double val = top - MediaQuery.of(context).padding.top ;

                final e = (val/max) ;
                final o = (1 - e).clamp(0, 1).toDouble();
                final g = 1 - o;
                return FlexibleSpaceBar(
                  background: flexibleSpace,
                  collapseMode: collapseMode,
                  title: AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                      opacity: top > 150 ? 0:  o,
                      child: collapsedTitle),
                  expandedTitleScale: 1,

                );
              }
            ),
          ),
          ...?headerSliverBuilder?.call(context, false)
        ])
      ],
      //floatHeaderSlivers: true,
      //physics: const BouncingScrollPhysics(),
      // headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
      //   return ;
      // },
      // body: body,
    );
    // return Scaffold(
    //   backgroundColor: backgroundColor,
    //   floatingActionButton: floatingActionButton,
    //   floatingActionButtonLocation: floatingActionButtonLocation,
    //   body: ,
    // );
  }
}

class BottomCurved extends StatelessWidget {
  final Widget? child;

  const BottomCurved({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(24),
        bottomRight: Radius.circular(24),
      ),
      child: child,
    );
  }
}

class PersistentHeader extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  PersistentHeader({required this.child, this.height = 56});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
