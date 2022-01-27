import 'package:flutter/cupertino.dart';

class AppConfig {

  double _height = 0;
  double _width = 0;
  double _heightPadding = 0;
  double _widthPadding = 0;

  AppConfig(context) {
    BuildContext _context = context;
    MediaQueryData _queryData = MediaQuery.of(_context);
    _height = _queryData.size.height / 100.0;
    _width = _queryData.size.width / 100.0;
    _heightPadding = _height - ( (_queryData.padding.top + _queryData.padding.bottom) / 100 );
    _widthPadding = _width - ( (_queryData.padding.left + _queryData.padding.right) / 100 );
  }

}