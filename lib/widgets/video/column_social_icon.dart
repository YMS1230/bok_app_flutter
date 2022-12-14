import 'package:flutter/material.dart';

Widget getAlbum(albumImg) {
  return Container(
    width: 50,
    height: 50,
    decoration: const BoxDecoration(
      // shape: BoxShape.circle,
      // color: black
    ),
    child: Stack(
      children: <Widget>[
        Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(shape: BoxShape.rectangle, color: Colors.black),
        ),
        Center(
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                        albumImg),
                    fit: BoxFit.cover)),
          ),
        )
      ],
    ),
  );
}

Widget getIcons(icon, count, size) {
  return Column(
    children: <Widget>[
      Icon(icon, color: Colors.white, size: size),
      const SizedBox(
        height: 5,
      ),
      Text(
        count,
        style: const TextStyle(
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700),
      )
    ],
  );
}

Widget getProfile(img) {
  return SizedBox(
    width: 50,
    height: 60,
    child: Stack(
      children: <Widget>[
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(
                      img),
                  fit: BoxFit.cover)),
        ),
        Positioned(
            bottom: 3,
            left: 15,
            child: Container(
              width: 20,
              height: 20,
              decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
              child: const Center(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 15,
                  )),
            ))
      ],
    ),
  );
}