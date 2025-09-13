import 'package:flutter/material.dart';
import 'package:flutter_application_1/state_management/bloc_provider.dart';
import 'package:flutter_application_1/state_management/events.dart';
import 'package:flutter_application_1/state_management/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: UshapeClipper(),
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                          const Color.fromARGB(255, 89, 69, 108).withAlpha(150),
                          BlendMode.srcOver,
                        ),
                        image: AssetImage("assets/images/bridge.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.center,
                  child: Column(
                    // spacing: 5,
                    children: [
                      Padding(
                        padding: EdgeInsetsGeometry.symmetric(
                          vertical: 5,
                          horizontal: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          spacing: 20,
                          children: [
                            Text(
                              'Profile',
                              style: TextStyle(
                                color: Colors.white.withAlpha(150),
                              ),
                            ),
                            Text(
                              'Career',
                              style: TextStyle(
                                color: Colors.white.withAlpha(150),
                              ),
                            ),
                            Text(
                              'Contact',
                              style: TextStyle(
                                color: Colors.white.withAlpha(150),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 20),

                      CircleAvatar(
                        backgroundColor: Colors.grey.shade300,
                        minRadius: 50,
                        child: Icon(
                          Icons.person,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),

                      SizedBox(height: 5),
                      Text(
                        'Priyadarsini K',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),

                      Text(
                        'Mobile Application Developer',
                        style: TextStyle(color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 15,
                            color: const Color.fromARGB(255, 185, 7, 36),
                          ),
                          Text(
                            'Chennai',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      BlocBuilder<PortFolioBloc, PortFolioStates>(
                        builder: (context, state) {
                          final isLikeTapped = state.isLiked ?? false;
                          return CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.grey.shade100,
                            child: IconButton(
                              onPressed: () {
                                context.read<PortFolioBloc>().add(TapLike());
                              },

                              icon: isLikeTapped
                                  ? Icon(
                                      Icons.favorite,
                                      size: 20,
                                      color: const Color.fromARGB(
                                        255,
                                        179,
                                        45,
                                        36,
                                      ),
                                    )
                                  : Icon(
                                      Icons.favorite_border,

                                      size: 20,
                                      color: Colors.grey.shade900,
                                    ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 30),
            BlocBuilder<PortFolioBloc, PortFolioStates>(
              builder: (context, state) {
                bool isTapped = state.isTappedAbout ?? false;

                return InkWell(
                  onTap: () {
                    context.read<PortFolioBloc>().add(TapAbout());
                  },
                  child: Card(
                    elevation: 30,
                    margin: EdgeInsets.all(10),
                    color: Colors.white.withAlpha(200),
                    child: Padding(
                      padding: EdgeInsetsGeometry.symmetric(
                        vertical: 15,
                        horizontal: 24,
                      ),
                      child: Column(
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            overflow: isTapped
                                ? TextOverflow.visible
                                : TextOverflow.ellipsis,
                            maxLines: isTapped ? null : 2,
                            // style: TextStyle(fontSize: 24),
                            "I am a Flutter Developer with 3+ years of experience building "
                            "cross-platform mobile applications. hghjgkjb ijiiiiiiiiiiiiii    hhkhkkk hjkkkkkkkkkkkjk bdnbfhjd kdjfksd idoter orirower oeiqwoir djshjd",
                          ),
                          if (isTapped) ...[
                            SizedBox(height: 5),
                            Text(
                              textAlign: TextAlign.center,
                              'I’ve contributed to large-scale apps '
                              "like SBI YONO and Tata Neu, specializing in Flutter, Dart, MobX, Riverpod, "
                              "and REST APIs. I focus on creating seamless, user-friendly, and high-performance "
                              "digital experiences.",
                            ),
                          ],
                          SizedBox(height: 15),

                          BlocBuilder<PortFolioBloc, PortFolioStates>(
                            builder: (context, state) {
                              if (state.isLoadingResume == false &&
                                  state.resumeDownload == false) {
                                return getDownloadButton(
                                  context: context,
                                  icon: Icons.download,
                                  text: 'Download Resume',
                                  // bloc: bloc,
                                );
                              } else if (state.isLoadingResume == true) {
                                //change this to downloading with animation
                                return CircularProgressIndicator();
                              } else if (state.resumeDownload == true) {
                                return getDownloadButton(
                                  context: context,
                                  icon: state.resumeDownload == true
                                      ? Icons.download_done
                                      : Icons.download,
                                  text: state.resumeDownload == true
                                      ? 'Downloaded'
                                      : 'Download Resume',
                                  // bloc: bloc,
                                );
                              }
                              return SizedBox();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget getDownloadButton({
  required BuildContext context,
  required IconData icon,
  required String text,
  // required PortFolioBloc bloc,
}) {
  return BlocBuilder<PortFolioBloc, PortFolioStates>(
    builder: (context, state) {
      return OutlinedButton(
        style: OutlinedButton.styleFrom(
          elevation: 30,
          backgroundColor: state.resumeDownload == true
              ? const Color.fromARGB(255, 89, 69, 108).withAlpha(150)
              : Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(3),
            side: BorderSide(color: Colors.green),
          ),
        ),
        onPressed: () {
          if (text == 'Download Resume') {
            context.read<PortFolioBloc>().add(LoadData());
          }
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              // isDownloadedResume
              //     ? Icons.download_done
              //     : Icons.download,
              size: 15,
              color: Colors.white,
            ),
            SizedBox(width: 5),
            Text(
              text,
              // isDownloadedResume
              //     ? 'Downloaded'
              //     : 'Download Resume',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      );
    },
  );
}

class UshapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    //current point (can be moveTo)
    path.lineTo(0, size.height * 0.8);
    //left u curve
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height,
      size.width * 0.5,
      size.height,
    );

    //left u curve
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height,
      size.width,
      size.height * 0.8,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
