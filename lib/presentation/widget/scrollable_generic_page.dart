import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/widget/global_appbar.dart';
import 'package:ecommerce_web/presentation/widget/global_footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScrollableGenericPage extends StatelessWidget {
  final Widget child;
  final Widget? overlay;
  final EdgeInsetsGeometry? padding;
  final AppBar? appBar;
  const ScrollableGenericPage(
      {super.key,
      required this.child,
      this.overlay,
      this.padding = const EdgeInsets.only(
        left: 50,
        right: 50,
      ),
      this.appBar});

  ScrollableGenericPage.withSideMenu(
      {super.key,
      required Widget child,
      required Widget sideMenu,
      required int sideMenuFlex,
      required int contentFlex,
      required bool showSideMenu,
      this.padding = const EdgeInsets.only(
        left: 50,
        right: 50,
      ),
      this.appBar})
      : child = Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: showSideMenu ? sideMenuFlex : 0,
                child: const SizedBox.shrink(),
              ),
              Expanded(
                flex: contentFlex,
                child: child,
              )
            ]),
        overlay = sideMenu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar ??
          GlobalAppBar(
            context: context,
          ),
      body: LayoutBuilder(
        builder: (context, constraint) {
          return Stack(
            children: [
              SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraint.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: padding ?? const EdgeInsets.only(),
                          child: Container(
                            color: AppColors.lightGrey,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 30),
                                    child: child),
                              ],
                            ),
                          ),
                        ),
                        const Spacer(),
                        const GlobalFooter()
                      ],
                    ),
                  ),
                ),
              ),
              overlay ?? const SizedBox.shrink()
            ],
          );
        },
      ),
    );
  }
}
