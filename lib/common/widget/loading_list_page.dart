import 'package:aroundix_design/design.dart';
import 'package:flutter/material.dart';

import 'customm_shimmer.dart';

enum ShimmerWidget { listTile }

class LoadingListPage extends StatelessWidget {
  const LoadingListPage({
    Key? key,
    required this.child,
    this.itemCount,
    this.shrinkWrap = false,
    this.isSliver = false,
    this.scrollDirection = Axis.vertical,
  }) : super(key: key);
  final Widget child;
  final Axis scrollDirection;
  final int? itemCount;
  final bool isSliver;
  final bool shrinkWrap;

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      scrollDirection: scrollDirection,
      child: isSliver
          ? SliverList(
              delegate: SliverChildBuilderDelegate((context, index) => child,
                  childCount: itemCount),
            )
          : ListView.builder(
              shrinkWrap: shrinkWrap,
              padding: PEdgeInsets.listView,
              scrollDirection: scrollDirection,
              itemBuilder: (_, __) => child,
              itemCount: itemCount,
            ),
    );
  }

// SizedBox(
// width: 200.0,
// height: 100.0,
// child: Shimmer.fromColors(
// baseColor: Colors.red,
// highlightColor: Colors.yellow,
// child: Text(
// 'Shimmer',
// textAlign: TextAlign.center,
// style: TextStyle(
// fontSize: 40.0,
// fontWeight: FontWeight.bold,
// ),
// ),
// ),
// )
}

///use inside Row Rectangle and  3 Line
class ShimmerListTile extends StatelessWidget {
  const ShimmerListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 48.0.r,
            height: 48.0.r,
            color: Colors.white,
          ),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 8.0),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 8.0.h,
                  color: Colors.white,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.0),
                ),
                Container(
                  width: double.infinity,
                  height: 8.0.h,
                  color: Colors.white,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.0),
                ),
                Container(
                  width: 40.0.w,
                  height: 8.0.h,
                  color: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
