import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:formletics/common/router/router.gr.dart';

bool isCurrentScreen(BuildContext context) {
  return ModalRoute.of(context).isCurrent;
}

String getCurrentScreen(BuildContext context) {
  return ModalRoute.of(context).settings.name;
}

void navigateToLogin(
  BuildContext context, {
  Object routeArgs,
}) {
  navigateToRoute(
    context,
    Routes.loginScreen,
    routeArgs: routeArgs,
  );
}

void navigateToRoute(
  BuildContext context,
  String routeName, {
  Object routeArgs,
}) {
  if (getCurrentScreen(context) == routeName) {
    return;
  }

  if (routeArgs != null) {
    ExtendedNavigator.root.push(routeName, arguments: routeArgs);
    return;
  }

  ExtendedNavigator.root.push(routeName);
}

void navigateToHome(
  BuildContext context, {
  Object routeArgs,
}) {
  navigateToRouteAndRemoveUntil(context, Routes.homeScreen,
      routeArgs: routeArgs);
}

void navigateToRouteAndReplace(
  BuildContext context,
  String routeName, {
  Object routeArgs,
}) {
  if (routeArgs != null) {
    ExtendedNavigator.root.popAndPush(routeName, arguments: routeArgs);

    return;
  }
  ExtendedNavigator.root.popAndPush(routeName);
}

void navigateToRouteAndRemoveUntil(
  BuildContext context,
  String routeName, {
  Object routeArgs,
}) {
  if (routeArgs != null) {
    ExtendedNavigator.root
        .pushAndRemoveUntil(routeName, (route) => false, arguments: routeArgs);
    return;
  }

  ExtendedNavigator.root.pushAndRemoveUntil(routeName, (route) => false);
}

void popCurrentRoute(BuildContext context) {
  ExtendedNavigator.root.pop();
}

void canPopCurrentRoute(BuildContext context) {
  ExtendedNavigator.root.canPop();
}
