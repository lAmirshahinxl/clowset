import 'package:clowset/styles/strings.dart';
import 'package:flutter/material.dart';

class ImageWithRadius extends StatelessWidget {
  double _height;
  double _width;
  String _src;
  double _radius;


  ImageWithRadius(this._height, this._width, this._src, this._radius);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(_radius),
      child: Image.network(MyStrings.baseUrl + _src ,
        width: (_width == 0) ? null : _width,
        height: (_height == 0) ? null : _height,
        fit: BoxFit.cover,
      ),
    );
  }
}
