import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/screens/characters/bloc/characters_bloc.dart';
import 'package:rick_and_morty/screens/characters/widgets/character_list_widget.dart';
import 'package:rick_and_morty/widgets/pagination_widget.dart';
import 'package:rick_and_morty/widgets/pull_refresh_widget.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  final ScrollController _scrollController = ScrollController();
  late Completer<void> _refreshCompleter;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocConsumer<CharactersBloc, CharactersState>(
          listener: (_, state) {
            if (!state.isPaginationLoading) {
              _refreshCompleter.complete();
              _refreshCompleter = Completer();
            }
          },
          builder: (_, state) {
            return PullRefreshWidget(
              onRefresh: () async {
                context.read<CharactersBloc>().add(CharactersRefresh());
                return _refreshCompleter.future;
              },
              scrollController: _scrollController
                ..addListener(() {
                  if (_scrollController.offset == _scrollController.position.maxScrollExtent &&
                      !state.isPaginationLoading) {
                    context.read<CharactersBloc>().add(CharactersGetCharacters());
                  }
                }),
              child: PaginationWidget(
                child: CharacterListWidget(
                  characters: state.characters,
                ),
                isPaginationLoading: state.isPaginationLoading,
              ),
            );
          },
        ),
      ),
    );
  }
}
