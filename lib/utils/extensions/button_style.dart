import 'package:flutter/material.dart';

extension ButtonStyleExtension on ButtonStyle {
  ButtonStyle size({
    double? height,
    double? width,
  }) {
    return copyWith(minimumSize: MaterialStateProperty.all(Size(width ?? 64, height ?? 52)));
  }

  ButtonStyle get infinity => copyWith(minimumSize: MaterialStateProperty.all(const Size(double.infinity, 48)));
  ButtonStyle insets({
    EdgeInsetsGeometry? padding,
  }) {
    return copyWith(padding: MaterialStateProperty.all(padding));
  }

  ButtonStyle basic(BuildContext context) => ButtonStyle(
        textStyle: MaterialStateProperty.all<TextStyle>(
          Theme.of(context).textTheme.bodyLarge!,
        ),
        // backgroundColor: MaterialStateProperty.all<Color>(
        //   Theme.of(context).colorScheme.primary,
        // ),
        // foregroundColor: MaterialStateProperty.all<Color>(
        //   Theme.of(context).colorScheme.onPrimary,
        // ),
      );

  ButtonStyle accent(BuildContext context) => ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.0),
            side: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
        side: MaterialStateProperty.all(BorderSide(
          color: Theme.of(context).colorScheme.onErrorContainer,
        )),
        textStyle: MaterialStateProperty.all<TextStyle>(
          Theme.of(context).textTheme.bodyLarge!,
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          Theme.of(context).colorScheme.secondary,
        ),
        foregroundColor: MaterialStateProperty.all<Color>(
          Theme.of(context).colorScheme.onSecondary,
        ),
      );

  ButtonStyle warning(BuildContext context) => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Theme.of(context).colorScheme.onError,
        ),
        foregroundColor: MaterialStateProperty.all<Color>(
          Theme.of(context).colorScheme.error,
        ),
      );

  ButtonStyle success(BuildContext context) => ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(const BeveledRectangleBorder()),
        textStyle: MaterialStateProperty.all<TextStyle>(
          Theme.of(context).textTheme.displaySmall!,
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          Theme.of(context).colorScheme.onInverseSurface,
        ),
        foregroundColor: MaterialStateProperty.all<Color>(
          Theme.of(context).colorScheme.inverseSurface,
        ),
      );

  ButtonStyle disabled(BuildContext context) => ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(const OvalBorder()),
        backgroundColor: MaterialStateProperty.all<Color>(
          Theme.of(context).colorScheme.surface,
        ),
        foregroundColor: MaterialStateProperty.all<Color>(
          Theme.of(context).colorScheme.onSurface,
        ),
      );
}
