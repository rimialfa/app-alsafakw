import 'package:app/components/project_stats.dart';
import 'package:app/constants.dart';
import 'package:app/providers/cart_provider.dart';
import 'package:app/screens/details/project_detail_screen.dart';
import 'package:app/screens/home/components/hotel_app_theme.dart';
import 'package:app/services/models.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class ProjectListView extends StatelessWidget {
  const ProjectListView(
      {Key? key,
      required this.project,
      this.animationController,
      this.animation})
      : super(key: key);

  final Project project;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation!.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  Navigator.pushNamed(context, ProjectDetailScreen.routeName,
                      arguments: ProductDetailsArguments(project: project));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        offset: const Offset(4, 4),
                        blurRadius: 16,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                    child: Column(
                      children: [
                        ProjectCardThumbnail(project: project),
                        ProjectCardBody(project: project),
                        ProjectCardActions(project: project)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class ProjectCardThumbnail extends StatelessWidget {
  const ProjectCardThumbnail({required this.project, super.key});
  final Project project;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 2,
          child: Hero(
            tag: project.id,
            child: Image.network(project.image, fit: BoxFit.cover),
          ),
        ),
        Positioned(
          top: 152,
          child: Container(
            padding: const EdgeInsets.all(5),
            color: kPrimaryColor800,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                const Icon(
                  FontAwesomeIcons.locationDot,
                  size: 12,
                  color: Colors.white,
                ),
                const Gap(4),
                Text(
                  project.country,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ProjectCardBody extends StatelessWidget {
  const ProjectCardBody({required this.project, super.key});
  final Project project;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
      child: Column(
        children: [
          Row(
            children: [
              Text(project.name,
                  style: const TextStyle(
                    fontSize: 16,
                  )),
            ],
          ),
          const Gap(12),
          ProjectStats(project: project),
          const Gap(12),
        ],
      ),
    );
  }
}

class ProjectCardActions extends StatelessWidget {
  const ProjectCardActions({super.key, required this.project});
  final Project project;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: kPrimaryColor,
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Donate now',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Container(
            color: Colors.white.withOpacity(0.5),
            width: 1,
            margin: const EdgeInsets.symmetric(vertical: 8),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                context.read<CartProvider>().addItem(project, 1, 1);
              },
              child: const Text(
                'Add to cart',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
