import 'package:flutter/material.dart';
import 'package:flutter_application_1/state_management/bloc_provider.dart';
import 'package:flutter_application_1/state_management/events.dart';
import 'package:flutter_application_1/state_management/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget profileBanner(BuildContext context) {
  return Align(
    alignment: Alignment.center,
    child: Column(
      // spacing: 5,
      children: [
        Padding(
          padding: EdgeInsetsGeometry.symmetric(vertical: 5, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            spacing: 20,
            children: [
              Text(
                'Profile',
                style: TextStyle(color: Colors.white.withAlpha(150)),
              ),
              Text(
                'Career',
                style: TextStyle(color: Colors.white.withAlpha(150)),
              ),
              Text(
                'Contact',
                style: TextStyle(color: Colors.white.withAlpha(150)),
              ),
            ],
          ),
        ),

        SizedBox(height: 20),

        CircleAvatar(
          backgroundColor: Colors.grey.shade300,
          minRadius: 50,
          child: Icon(Icons.person, size: 40, color: Colors.white),
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
            Text('Chennai', style: TextStyle(color: Colors.white)),
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
                        color: const Color.fromARGB(255, 179, 45, 36),
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
  );
}
