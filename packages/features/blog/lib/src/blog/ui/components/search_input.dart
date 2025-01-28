import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/bloc.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({super.key});

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BlogBloc, BlogState>(
      listenWhen: (previous, current) =>
          previous.filter.keyword != current.filter.keyword,
      listener: (context, state) {
        _controller.text = state.filter.keyword;
      },
      buildWhen: (previous, current) =>
          previous.filter.keyword != current.filter.keyword,
      builder: (context, state) {
        final keyword = state.filter.keyword;
        return MtpTextField(
          hintText: context.l10n.homeLabelSearchCourses,
          textInputAction: TextInputAction.done,
          maxLines: 1,
          isDense: true,
          suffixIcon: keyword.isNotEmpty
              ? InkWell(
                  child: const Icon(Icons.clear),
                  onTap: () {
                    _controller.clear();
                    context
                        .read<BlogBloc>()
                        .add(const BlogPostKeywordChanged(''));
                  },
                )
              : null,
          controller: _controller,
          prefixIcon: const Icon(Icons.search, size: 24),
          onChanged: (value) {
            context.read<BlogBloc>().add(BlogPostKeywordChanged(value));
          },
        );
      },
    );
  }
}
