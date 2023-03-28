import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../flutter_flow_theme.dart';
import '../../backend/backend.dart';

import '../../auth/firebase_user_provider.dart';

import '../../index.dart';
import '../../main.dart';
import '../lat_lng.dart';
import '../place.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  FortunatorsFirebaseUser? initialUser;
  FortunatorsFirebaseUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(FortunatorsFirebaseUser newUser) {
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    if (notifyOnAuthChange) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, _) =>
          appStateNotifier.loggedIn ? NavBarPage() : LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : LoginWidget(),
          routes: [
            FFRoute(
              name: 'registro',
              path: 'registro',
              builder: (context, params) => RegistroWidget(),
            ),
            FFRoute(
              name: 'completeProfile',
              path: 'completeProfile',
              builder: (context, params) => CompleteProfileWidget(),
            ),
            FFRoute(
              name: 'forgotPassword',
              path: 'forgotPassword',
              builder: (context, params) => ForgotPasswordWidget(),
            ),
            FFRoute(
              name: 'onboarding',
              path: 'onboarding',
              builder: (context, params) => OnboardingWidget(),
            ),
            FFRoute(
              name: 'createBudgetBegin',
              path: 'createBudgetBegin',
              builder: (context, params) => CreateBudgetBeginWidget(),
            ),
            FFRoute(
              name: 'MY_Card',
              path: 'mYCard',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'MY_Card')
                  : MYCardWidget(),
            ),
            FFRoute(
              name: 'MY_Budgets',
              path: 'mYBudgets',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'MY_Budgets')
                  : MYBudgetsWidget(),
            ),
            FFRoute(
              name: 'paymentDetails',
              path: 'paymentDetails',
              builder: (context, params) => PaymentDetailsWidget(
                transactionDetails: params.getParam('transactionDetails',
                    ParamType.DocumentReference, false, ['transactions']),
                userSpent: params.getParam(
                    'userSpent', ParamType.DocumentReference, false, ['users']),
              ),
            ),
            FFRoute(
              name: 'MY_profilePage',
              path: 'mYProfilePage',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'MY_profilePage')
                  : MYProfilePageWidget(
                      userProfile: params.getParam('userProfile',
                          ParamType.DocumentReference, false, ['users']),
                    ),
            ),
            FFRoute(
              name: 'budgetDetails',
              path: 'budgetDetails',
              builder: (context, params) => BudgetDetailsWidget(
                budgetDetails: params.getParam('budgetDetails',
                    ParamType.DocumentReference, false, ['budgets']),
              ),
            ),
            FFRoute(
              name: 'transferComplete',
              path: 'transferComplete',
              builder: (context, params) => TransferCompleteWidget(),
            ),
            FFRoute(
              name: 'transferFunds',
              path: 'transferFunds',
              builder: (context, params) => TransferFundsWidget(),
            ),
            FFRoute(
              name: 'requestFunds',
              path: 'requestFunds',
              builder: (context, params) => RequestFundsWidget(),
            ),
            FFRoute(
              name: 'createBudget',
              path: 'createBudget',
              builder: (context, params) => CreateBudgetWidget(),
            ),
            FFRoute(
              name: 'transaction_ADD',
              path: 'transactionADD',
              builder: (context, params) => TransactionADDWidget(),
            ),
            FFRoute(
              name: 'transaction_EDIT',
              path: 'transactionEDIT',
              builder: (context, params) => TransactionEDITWidget(
                transactionDetails: params.getParam('transactionDetails',
                    ParamType.DocumentReference, false, ['transactions']),
              ),
            ),
            FFRoute(
              name: 'editProfile',
              path: 'editProfile',
              builder: (context, params) => EditProfileWidget(
                userProfile: params.getParam('userProfile',
                    ParamType.DocumentReference, false, ['users']),
              ),
            ),
            FFRoute(
              name: 'changePassword',
              path: 'changePassword',
              builder: (context, params) => ChangePasswordWidget(),
            ),
            FFRoute(
              name: 'notificationsSettings',
              path: 'notificationsSettings',
              builder: (context, params) => NotificationsSettingsWidget(),
            ),
            FFRoute(
              name: 'privacyPolicy',
              path: 'privacyPolicy',
              builder: (context, params) => PrivacyPolicyWidget(),
            ),
            FFRoute(
              name: 'tutorial_PROFILE',
              path: 'tutorialPROFILE',
              builder: (context, params) => TutorialPROFILEWidget(),
            ),
            FFRoute(
              name: 'homePage',
              path: 'homePage',
              builder: (context, params) => HomePageWidget(),
            ),
            FFRoute(
              name: 'homePage_alt',
              path: 'homePageAlt',
              builder: (context, params) => HomePageAltWidget(),
            ),
            FFRoute(
              name: 'homePage_alt_1',
              path: 'homePageAlt1',
              builder: (context, params) => HomePageAlt1Widget(),
            ),
            FFRoute(
              name: 'budget_DELETE',
              path: 'budgetDELETE',
              builder: (context, params) => BudgetDELETEWidget(
                budgetList: params.getParam('budgetList',
                    ParamType.DocumentReference, false, ['budgets']),
              ),
            ),
            FFRoute(
              name: 'profilepage',
              path: 'profilepage',
              builder: (context, params) => ProfilepageWidget(),
            ),
            FFRoute(
              name: 'login',
              path: 'login',
              builder: (context, params) => LoginWidget(),
            ),
            FFRoute(
              name: 'welcome',
              path: 'welcome',
              builder: (context, params) => WelcomeWidget(),
            ),
            FFRoute(
              name: 'conection',
              path: 'conection',
              builder: (context, params) => ConectionWidget(),
            ),
            FFRoute(
              name: 'game',
              path: 'game',
              builder: (context, params) => GameWidget(),
            ),
            FFRoute(
              name: 'aceptopolicy',
              path: 'aceptopolicy',
              builder: (context, params) => AceptopolicyWidget(),
            ),
            FFRoute(
              name: 'table',
              path: 'table',
              requireAuth: true,
              builder: (context, params) => TableWidget(
                users: params.getParam('users', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'tarjeta',
              path: 'tarjeta',
              builder: (context, params) => TarjetaWidget(),
            ),
            FFRoute(
              name: 'politicas',
              path: 'politicas',
              builder: (context, params) => PoliticasWidget(),
            ),
            FFRoute(
              name: 'thankspay',
              path: 'thankspay',
              builder: (context, params) => ThankspayWidget(),
            ),
            FFRoute(
              name: 'paysave',
              path: 'paysave',
              builder: (context, params) => PaysaveWidget(),
            ),
            FFRoute(
              name: 'goldtable',
              path: 'goldtable',
              requireAuth: true,
              builder: (context, params) => GoldtableWidget(
                users: params.getParam('users', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'cashtable',
              path: 'cashtable',
              requireAuth: true,
              builder: (context, params) => CashtableWidget(
                users: params.getParam('users', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'choosevalue',
              path: 'choosevalue',
              requireAuth: true,
              builder: (context, params) => ChoosevalueWidget(
                users: params.getParam('users', ParamType.String),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      urlPathStrategy: UrlPathStrategy.path,
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (GoRouter.of(this).routerDelegate.matches.length <= 1) {
      go('/');
    } else {
      pop();
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState =>
      (routerDelegate.refreshListenable as AppStateNotifier);
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void setRedirectLocationIfUnset(String location) =>
      (routerDelegate.refreshListenable as AppStateNotifier)
          .updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(params)
    ..addAll(queryParams)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList, collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/login';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Center(
                    child: Image.asset(
                      'assets/images/Medical_ScheduleApp_0.0.png',
                      width: MediaQuery.of(context).size.width * 1.0,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}
