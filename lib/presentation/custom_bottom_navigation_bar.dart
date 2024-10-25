import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationBarItem {
  NavigationBarItem({this.icon, this.text});
  String? icon;
  String? text;
}

class CustomBottomNavigationBar extends StatefulWidget {
  CustomBottomNavigationBar(
      {super.key,
      this.centerItemIcon,
      this.items,
      this.centerItemText,
      this.height = 40.0,
      this.iconSize = 24.0,
      this.backgroundColor,
      this.color,
      this.initIndex,
      this.selectedColor,
      this.notchedShape,
      this.onTabSelected,
      this.iconMidOnTap,
      required this.tabController,
      this.centerItemTextColor}) {
    assert(items!.length == 2 || items!.length == 4);
  }

  final List<NavigationBarItem>? items;
  final String? centerItemText;
  final int? initIndex;
  final double height;
  final double iconSize;
  final IconData? centerItemIcon;
  final Color? backgroundColor;
  final Color? color;
  final Color? selectedColor;
  final Color? centerItemTextColor;
  final NotchedShape? notchedShape;
  final ValueChanged<int>? onTabSelected;
  final VoidCallback? iconMidOnTap;
  final TabController tabController;

  @override
  State<StatefulWidget> createState() => CustomBottomNavigationBarState();
}

class CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  final _selectedIndex = 0.obs;

  @override
  void initState() {
    super.initState();

    _selectedIndex.value = widget.tabController.index;

    widget.tabController.addListener(() {
      _selectedIndex.value = widget.tabController.index;
    });
  }

  _updateIndex(int index) {
    widget.tabController.index = index;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items!.length, (int index) {
      return _buildTabItem(
        item: widget.items![index],
        index: index,
        onPressed: _updateIndex,
      );
    });
    items.insert(items.length >> 1, _buildMiddleTabItem());
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: SizedBox(
        height: 50,
        child: BottomAppBar(
          shape: widget.notchedShape,
          color: widget.backgroundColor,
          surfaceTintColor: Colors.transparent,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: items,
          ),
        ),
      ),
    );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: GestureDetector(
        onTap: widget.iconMidOnTap,
        behavior: HitTestBehavior.translucent,
        child: SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                child: Icon(
                  widget.centerItemIcon,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabItem({
    required NavigationBarItem item,
    required int index,
    ValueChanged<int>? onPressed,
  }) {
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => onPressed!(index),
            child: Obx(() => Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      item.icon.toString(),
                      width: 25,
                      color: _selectedIndex.value == index
                          ? widget.selectedColor
                          : widget.color,
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
