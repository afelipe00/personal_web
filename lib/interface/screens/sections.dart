import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/models/home_section.dart';

class HomeSections extends StatefulWidget {
  final List<String> sections;
  final ValueNotifier<HomeSection?> sectionNotifier;

  const HomeSections({
    super.key,
    required this.sections,
    required this.sectionNotifier,
  });

  @override
  State<HomeSections> createState() => _HomeSectionsState();
}

class _HomeSectionsState extends State<HomeSections> {
  final double _minItemHeight = 700;

  ScrollController _scrollController = ScrollController();

  double _calculateItemHeight({required double availableHeight}) {
    return max(availableHeight, _minItemHeight);
  }

  int get _colorCodeIndex {
    int index = widget.sections.indexWhere((nameSection) => nameSection == widget.sectionNotifier.value?.name);
    return index > -1 ? index : 0;
  }

  @override
  void initState() {
    super.initState();
    widget.sectionNotifier.addListener(() {
      final fromScroll = widget.sectionNotifier.value?.source == SelectionSource.fromScroll;
      if (_scrollController.hasClients && !fromScroll) {
        _scrollToSection();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final itemHeight = _calculateItemHeight(availableHeight: constraints.maxHeight);
        _scrollController = ScrollController(initialScrollOffset: itemHeight * _colorCodeIndex);
        return NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification is UserScrollNotification) {
              _onUserScroll(notification.metrics.pixels);
            }
            return true;
          },
          child: ListView.builder(
            controller: _scrollController,
            itemCount: widget.sections.length,
            physics: AlwaysScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              final section = widget.sections[index];
              return Container(
                height: itemHeight,
                child: _section(section, context),
              );
            },
          ),
        );
      },
    );
  }

  void _onUserScroll(double offset) {
    final itemHeight = _calculateItemHeight(availableHeight: _scrollController.position.viewportDimension);
    final trailingIndex = (offset / itemHeight).floor();
    widget.sectionNotifier.value = HomeSection(
      name: widget.sections[trailingIndex],
      source: SelectionSource.fromScroll,
    );
  }

  Widget _section(String section, BuildContext context) {
    return SectionsListView(
      sectionName: section,
      sectionNotifier: widget.sectionNotifier,
    );
  }

  void _scrollToSection() {
    final itemHeight = _calculateItemHeight(availableHeight: context.size!.height);
    final offset = _colorCodeIndex * itemHeight;
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}

class SectionsListView extends StatelessWidget {
  final ValueNotifier<HomeSection?> sectionNotifier;
  final String sectionName;

  const SectionsListView({
    super.key,
    required this.sectionName,
    required this.sectionNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        'Content in section',
      ),
    );
  }
}
