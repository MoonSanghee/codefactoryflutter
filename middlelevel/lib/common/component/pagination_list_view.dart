import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:middlelevel/common/model/cursor_pagination_model.dart';
import 'package:middlelevel/common/model/model_with_id.dart';
import 'package:middlelevel/common/provider/pagination_provider.dart';
import 'package:middlelevel/common/utils/pagination_utils.dart';

typedef PaginationWidgetBuilder<T extends IModelWithId> = Widget Function(
    BuildContext context, int index, T model);

class PaginationListView<T extends IModelWithId>
    extends ConsumerStatefulWidget {
  final StateNotifierProvider<PaginationProvider, CursorPaginationBase>
      provider;

  final PaginationWidgetBuilder<T> itemBuilder;

  const PaginationListView({
    super.key,
    required this.provider,
    required this.itemBuilder,
  });

  @override
  ConsumerState<PaginationListView> createState() =>
      _PaginationListViewState<T>();
}

class _PaginationListViewState<T extends IModelWithId>
    extends ConsumerState<PaginationListView> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();

    controller.addListener(listener);
  }

  void listener() {
    PaginationUtils.paginate(
      controller: controller,
      provider: ref.read(widget.provider.notifier),
    );
  }

  @override
  void dispose() {
    controller.removeListener(listener);
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(widget.provider);

    // 완전 처음 로딩일 때
    if (state is CursorPaginationLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    // 에러
    if (state is CursorPaginationsError) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            state.message,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(widget.provider.notifier).paginate(forceRefetch: true);
            },
            child: const Text(
              '다시시도',
            ),
          ),
        ],
      );
    }

    // CursorPagination
    // CursorPaginationFetchingMore
    // CursorPaginationRefetching

    final cp = state as CursorPagination<T>;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.separated(
        controller: controller,
        itemCount: cp.data.length + 1,
        itemBuilder: (_, index) {
          if (index == cp.data.length) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Center(
                child: cp is CursorPaginationFetchingMore
                    ? const CircularProgressIndicator()
                    : const Text('마지막 데이터입니다.ㅜ'),
              ),
            );
          }

          final pItem = cp.data[index];

          return widget.itemBuilder(
            context,
            index,
            pItem,
          );
        },
        separatorBuilder: (_, index) {
          return const SizedBox(height: 16.0);
        },
      ),
    );
  }
}
