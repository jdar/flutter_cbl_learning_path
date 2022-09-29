import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cbl_learning_path/features/drawer/drawer.dart';
import 'package:flutter_cbl_learning_path/features/project/bloc/project_list_event.dart';
import 'package:flutter_cbl_learning_path/features/project/views/project_list_widget.dart';
import 'package:flutter_cbl_learning_path/features/router/route.dart';

import '../bloc/project_list_bloc.dart';
import '../data/project_repository.dart';

class ProjectListScreen extends StatelessWidget {
  const ProjectListScreen({super.key, required this.routerService});

  final AppRouterService routerService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
      ),
      drawer: const MenuDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(2),
        child: BlocProvider(
          create: (context) {
            return ProjectListBloc(
              repository: RepositoryProvider.of<ProjectRepository>(context))
                ..add(const ProjectListInitializeEvent());
          },
          child: ProjectListWidget(routerService: routerService)
        )
      ),floatingActionButton:
    FloatingActionButton(
      onPressed: () {
          routerService.routeTo(const ScreenRoute(routeToScreen: RouteToScreen.projectEditor));
        },
      child: const Icon(Icons.add)
      ),
    );
  }
}
