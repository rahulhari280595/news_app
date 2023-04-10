import 'package:flutter/material.dart';
import 'package:news_app/app/ui/theme/app_colors.dart';

class CustomNavigationBar extends StatefulWidget {
  final ValueChanged<int>? selectedValue;
  final List<BottomNavigationBarItem>? items;

  const CustomNavigationBar({
    Key? key,
    this.selectedValue,
    this.items,
  }) : super(key: key);

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.navigationBarIconColor,
      elevation: 0,
      iconSize: 30.0,
      selectedFontSize: 20.0,
      unselectedFontSize: 16.0,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      selectedIconTheme: const IconThemeData(
        color: AppColors.primaryColor,
      ),
      unselectedIconTheme: const IconThemeData(
        color: AppColors.navigationBarIconColor,
      ),
      backgroundColor: AppColors.navigationBarColor,
      items: widget.items!,
      currentIndex: _currentIndex,
      onTap: (value) {
        setState(() {
          _currentIndex = value;
        });
        widget.selectedValue!(value);
      },
    );
  }
}
