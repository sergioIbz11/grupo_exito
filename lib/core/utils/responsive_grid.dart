const double _tabletBreakpoint = 600.0;

int gridCrossAxisCount(double screenWidth) {
  return screenWidth >= _tabletBreakpoint ? 4 : 2;
}
