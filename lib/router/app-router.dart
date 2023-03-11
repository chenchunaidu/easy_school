import 'package:easy_school/components/content-viewer/activities.dart';
import 'package:easy_school/screens/chapter-content.dart';
import 'package:easy_school/screens/content-editor.dart';
import 'package:easy_school/screens/home-teacher.dart';
import 'package:easy_school/screens/teacher-class.dart';
import 'package:easy_school/services/app-service.dart';
import 'package:go_router/go_router.dart';
import '../components/layout/bottom-navigation-bar.dart';
import '../screens/login.dart';
import '../screens/otp.dart';

import 'package:easy_school/screens/homework.dart';

import 'package:easy_school/screens/profile.dart';

const publicRoutes = ["/login", "/otp"];

class AppRouter {
  late final AppService appService;
  GoRouter get router => _goRouter;

  AppRouter(this.appService);

  late final GoRouter _goRouter = GoRouter(
      refreshListenable: appService,
      initialLocation: '/login',
      routes: [
        GoRoute(
          path: '/login',
          builder: (context, state) {
            return Login();
          },
        ),
        ShellRoute(
          builder: (context, state, child) {
            return ScaffoldWithBottomNavBar(child: child);
          },
          routes: <RouteBase>[
            GoRoute(
              path: '/home',
              builder: (context, state) {
                return HomeTeacher();
              },
            ),
            GoRoute(
              path: '/profile',
              builder: (context, state) {
                return Profile();
              },
            ),
            GoRoute(
              path: '/content',
              builder: (context, state) {
                return Activities();
              },
            ),
            GoRoute(
              path: '/home/content/:id/edit',
              builder: (context, state) {
                return ContentEditor(id: state.params["id"] ?? "");
              },
            ),
            GoRoute(
              path: "/homework",
              builder: (context, state) {
                return HomeWork();
              },
            ),
            GoRoute(
              path: "/home/teacher-class",
              builder: (context, state) {
                return TeacherClassScreen();
              },
            ),
            GoRoute(
              path: "/home/chapter-content",
              builder: (context, state) {
                return ChapterContentScreen();
              },
            ),
            //ChapterContentScreen
          ],
        ),
      ],
      redirect: (context, state) async {
        final isLoggedIn = appService.loginState;
        if (isLoggedIn && publicRoutes.contains(state.subloc.toString())) {
          return "/home";
        }
        if (!isLoggedIn && !publicRoutes.contains(state.subloc.toString())) {
          return "/login";
        }

        return null;
      });
}
