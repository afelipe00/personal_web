import 'package:equatable/equatable.dart';

class HomeSection extends Equatable {
  final String name;
  final SelectionSource source;

  const HomeSection({required this.name, required this.source});

  @override
  List<Object?> get props => [name, source];
}

enum SelectionSource { fromScroll, fromButtonClick, fromBrowserAddressBar }
