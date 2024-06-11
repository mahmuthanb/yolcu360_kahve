// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:yolcu360_kahve/core/res/colors.gen.dart';
import 'package:yolcu360_kahve/core/res/dimens.dart';

class CustomBottomBar extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;
  final List<Widget> items;

  const CustomBottomBar({
    super.key,
    required this.pageIndex,
    required this.onTap,
    required this.items,
  });
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      color: Colors.transparent,
      padding: EdgeInsets.zero,
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppDimens.xl),
            topRight: Radius.circular(AppDimens.xl),
          ),
          border: Border(
            left: BorderSide(color: AppColors.darkGrey),
            right: BorderSide(color: AppColors.darkGrey),
            top: BorderSide(color: AppColors.darkGrey),
          ),
        ),
        height: 60,
        child: Row(
          children: [
            navItem(
              Icons.home,
              pageIndex == 0,
              onTap: () => onTap(0),
            ),
            navItem(
              Icons.favorite,
              pageIndex == 1,
              onTap: () => onTap(1),
            ),
            navItem(
              Icons.shopping_bag,
              pageIndex == 2,
              onTap: () => onTap(2),
            ),
            navItem(
              Icons.notifications,
              pageIndex == 3,
              onTap: () => onTap(3),
            ),
          ],
        ),
      ),
    );
  }
}

Widget navItem(IconData icon, bool selected, {Function()? onTap}) {
  return Expanded(
    child: InkWell(
      onTap: onTap,
      child: Icon(
        icon,
        size: 30,
        color: selected ? AppColors.primarySwatch : AppColors.darkGrey,
      ),
    ),
  );
}
