// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:yolcu360_kahve/core/res/colors.gen.dart';
import 'package:yolcu360_kahve/core/res/dimens.dart';
import 'package:yolcu360_kahve/core/res/icons.dart';

class LightTheme extends AppTheme {
  @override
  ColorScheme get colorScheme => const ColorScheme.light(
      primary: AppColors.primarySwatch, outlineVariant: AppColors.grey);
}

class DarkTheme extends AppTheme {
  @override
  ColorScheme get colorScheme => const ColorScheme.dark(
      secondary: AppColors.primarySwatch,
      primary: AppColors.primarySwatch,
      outlineVariant: AppColors.grey);
}

class AppTheme {
  ColorScheme colorScheme = const ColorScheme.light(
      primary: AppColors.primarySwatch, outlineVariant: AppColors.grey);

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        scaffoldBackgroundColor: AppColors.grey,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          scrolledUnderElevation: 0,
        ),
        dividerTheme: DividerThemeData(
          space: 1,
          color: colorScheme.onSurface.withOpacity(0.1),
        ),
        cardTheme: const CardTheme(
          clipBehavior: Clip.antiAlias,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontWeight: FontWeight.w700),
        ),
        fontFamily: 'Sora',
        listTileTheme: ListTileThemeData(
          iconColor: colorScheme.onSurface.withOpacity(
            0.5,
          ),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        actionIconTheme: ActionIconThemeData(
          drawerButtonIconBuilder: (context) {
            return const Icon(AppIcons.menu);
          },
          endDrawerButtonIconBuilder: (context) {
            return const Icon(AppIcons.menu);
          },
          backButtonIconBuilder: (context) {
            return const Icon(AppIcons.chevronLeft);
          },
          closeButtonIconBuilder: (context) {
            return const Icon(AppIcons.xmark);
          },
        ),
        iconTheme: IconThemeData(
            color: colorScheme.onSurface.withOpacity(
              0.5,
            ),
            size: 18),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: AppColors.primarySwatch),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ))),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primarySwatch,
                foregroundColor: colorScheme.onPrimary,
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                ))),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: TextStyle(fontSize: 18),
            unselectedLabelStyle: TextStyle(fontSize: 18),
            selectedIconTheme: IconThemeData(size: 24),
            unselectedIconTheme: IconThemeData(size: 24),
            showSelectedLabels: false,
            showUnselectedLabels: false),
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          focusedBorder: inputBorder,
          border: inputBorder,
          filled: true,
          alignLabelWithHint: true,
          fillColor: colorScheme.onPrimary,
          enabledBorder: inputBorder,
          disabledBorder: inputBorder,
        ));
  }

  static var inputBorder = OutlineInputBorder(
    gapPadding: 4,
    borderSide: const BorderSide(color: AppColors.grey),
    borderRadius: BorderRadius.circular(8),
  );

  static var titleTextStyle = const TextStyle(
    fontSize: 18,
    color: AppColors.black,
    fontWeight: FontWeight.bold,
  );

  static var elevatedButtonStyle = ButtonStyle(
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.m),
      ),
    ),
  );

  static var customDivider = const Divider(
    color: AppColors.semiGrey,
    thickness: 3,
    height: AppDimens.m * 2,
  );

  static var bottomSheetBoxDecoration = const BoxDecoration(
    color: AppColors.grey,
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(AppDimens.l),
        topRight: Radius.circular(AppDimens.l)),
    border: Border(
      left: BorderSide(color: AppColors.semiGrey, width: 2),
      right: BorderSide(color: AppColors.semiGrey, width: 2),
      top: BorderSide(color: AppColors.semiGrey, width: 2),
    ),
  );

  static var gradientScaffoldBg = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.35, 0.35],
      colors: [AppColors.black, AppColors.grey],
    ),
  );
}
