import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import 'package:space_app/Theme/bloc/theme_bloc.dart';
import 'package:space_app/pages/AIchat/UI/AIchat.dart';
import 'package:space_app/pages/ComingSoon/comingsoon.dart';
import 'package:space_app/pages/Developer/UI/developer.dart';
import 'package:space_app/pages/Helper/UI/helper.dart';
import 'package:space_app/pages/QR/UI/QrCodeGeneration.dart';
import 'package:space_app/responsive/responsive_layout.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  ThemeMode _themeMode = ThemeMode.light;
  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formattedDate = DateFormat('EEE, d MMM y').format(now);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {},
              child: Switch(
                value: context.read<ThemeBloc>().state == ThemeMode.dark,
                onChanged: (value) {
                  context.read<ThemeBloc>().add(ThemeChange(isDark: !value));
                },
                activeThumbImage: const AssetImage('assets/nightmode.jpg'),
                inactiveThumbImage: const AssetImage('assets/lightmode.png'),
                activeTrackColor: Colors.white,
                activeColor: Colors.white,
                inactiveTrackColor: Colors.white,
                inactiveThumbColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello bro,',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.scrim,
                  fontFamily: 'Goldman',
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                formattedDate,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.scrim,
                  fontFamily: 'Goldman',
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Features',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Goldman',
                      fontSize: 30,
                    ),
                  ),
                  Icon(
                    Icons.filter_alt,
                    color: Theme.of(context).colorScheme.scrim,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: ResponsiveLayout(
                  mobileBody: StaggeredGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    children: [
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 1.5,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const HomePage();
                                },
                              ),
                            );
                          },
                          child: DashboardCard(
                            icon: Icons.message,
                            bodyContent:
                                'Discuss your doubts or anything with AI',
                            headingContent: 'Chat with AI',
                            cardColor: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 1,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const Helper();
                                },
                              ),
                            );
                          },
                          child: DashboardCard(
                            icon: Icons.help,
                            bodyContent:
                                'Discribe your problem and get help from AI',
                            headingContent: 'Helper',
                            cardColor: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                        ),
                      ),
                      //Color(0xffffb2e0)
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 1.5,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const ComingSoon();
                                },
                              ),
                            );
                          },
                          child: DashboardCard(
                            icon: Icons.download,
                            bodyContent:
                                'Download any video of Youtube, Instagram in your phone directly',
                            headingContent: 'Download',
                            cardColor: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 1,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const QrCodeGenerator();
                                },
                              ),
                            );
                          },
                          child: DashboardCard(
                            icon: Icons.qr_code,
                            bodyContent:
                                'Generate Customise QR Code in once Click',
                            headingContent: 'QR Code',
                            cardColor:
                                Theme.of(context).colorScheme.primaryContainer,
                          ),
                        ),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 1.5,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const ComingSoon();
                                },
                              ),
                            );
                          },
                          child: DashboardCard(
                            icon: Icons.games,
                            bodyContent: 'Play differnt type of games here',
                            headingContent: 'Games',
                            cardColor: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 1,
                        child: InkWell(
                          onTap: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const DevloperPage();
                                },
                              ),
                            );
                          },
                          child: DashboardCard(
                            icon: Icons.person,
                            bodyContent: 'Know About the developer',
                            headingContent: 'Developer',
                            cardColor: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                        ),
                      ),
                    ],
                  ),
                  desktopBody: StaggeredGrid.count(
                    crossAxisCount: 4,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    children: [
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 0.5,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const HomePage();
                                },
                              ),
                            );
                          },
                          child: DashboardCard(
                            icon: Icons.message,
                            bodyContent:
                                'Discuss your doubts or anything with AI',
                            headingContent: 'Chat with AI',
                            cardColor: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 1,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const Helper();
                                },
                              ),
                            );
                          },
                          child: DashboardCard(
                            icon: Icons.help,
                            bodyContent:
                                'Discribe your problem and get help from AI',
                            headingContent: 'Helper',
                            cardColor: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                        ),
                      ),
                      //Color(0xffffb2e0)
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 0.5,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const ComingSoon();
                                },
                              ),
                            );
                          },
                          child: DashboardCard(
                            icon: Icons.download,
                            bodyContent:
                                'Download any video of Youtube, Instagram in your phone directly',
                            headingContent: 'Download',
                            cardColor: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 1,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const QrCodeGenerator();
                                },
                              ),
                            );
                          },
                          child: DashboardCard(
                            icon: Icons.qr_code,
                            bodyContent:
                                'Generate Customise QR Code in once Click',
                            headingContent: 'QR Code',
                            cardColor:
                                Theme.of(context).colorScheme.primaryContainer,
                          ),
                        ),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 0.5,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const ComingSoon();
                                },
                              ),
                            );
                          },
                          child: DashboardCard(
                            icon: Icons.games,
                            bodyContent: 'Play differnt type of games here',
                            headingContent: 'Games',
                            cardColor: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 0.5,
                        child: InkWell(
                          onTap: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const DevloperPage();
                                },
                              ),
                            );
                          },
                          child: DashboardCard(
                            icon: Icons.person,
                            bodyContent: 'Know About the developer',
                            headingContent: 'Developer',
                            cardColor: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                        ),
                      ),
                    ],
                  ),
                  tabletBody: StaggeredGrid.count(
                    crossAxisCount: 3,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    children: [
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 1,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const HomePage();
                                },
                              ),
                            );
                          },
                          child: DashboardCard(
                            icon: Icons.message,
                            bodyContent:
                                'Discuss your doubts or anything with AI',
                            headingContent: 'Chat with AI',
                            cardColor: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 1,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const Helper();
                                },
                              ),
                            );
                          },
                          child: DashboardCard(
                            icon: Icons.help,
                            bodyContent:
                                'Discribe your problem and get help from AI',
                            headingContent: 'Helper',
                            cardColor: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                        ),
                      ),
                      //Color(0xffffb2e0)
                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 1,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const ComingSoon();
                                },
                              ),
                            );
                          },
                          child: DashboardCard(
                            icon: Icons.download,
                            bodyContent:
                                'Download any video of Youtube, Instagram in your phone directly',
                            headingContent: 'Download',
                            cardColor: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 1,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const QrCodeGenerator();
                                },
                              ),
                            );
                          },
                          child: DashboardCard(
                            icon: Icons.qr_code,
                            bodyContent:
                                'Generate Customise QR Code in once Click',
                            headingContent: 'QR Code',
                            cardColor:
                                Theme.of(context).colorScheme.primaryContainer,
                          ),
                        ),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 1,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const ComingSoon();
                                },
                              ),
                            );
                          },
                          child: DashboardCard(
                            icon: Icons.games,
                            bodyContent: 'Play differnt type of games here',
                            headingContent: 'Games',
                            cardColor: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 1,
                        child: InkWell(
                          onTap: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const DevloperPage();
                                },
                              ),
                            );
                          },
                          child: DashboardCard(
                            icon: Icons.person,
                            bodyContent: 'Know About the developer',
                            headingContent: 'Developer',
                            cardColor: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    required this.icon,
    required this.headingContent,
    required this.bodyContent,
    required this.cardColor,
    super.key,
  });
  final IconData icon;
  final String headingContent;
  final String bodyContent;
  final Color cardColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.40,
      width: MediaQuery.of(context).size.width * 0.40,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.black,
            size: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              headingContent,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Goldman',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              bodyContent,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
