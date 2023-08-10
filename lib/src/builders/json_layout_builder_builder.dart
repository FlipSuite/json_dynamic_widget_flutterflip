import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_layout_builder_builder.g.dart';

/// Builder that can build an [LayoutBuilder] widget.
@jsonWidget
abstract class _JsonLayoutBuilderBuilder extends JsonWidgetBuilder {
  const _JsonLayoutBuilderBuilder();

  @JsonArgDecoder('builder')
  Widget Function(BuildContext context, BoxConstraints constraints)
      _decodeBuilder({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
    required JsonLayoutBuilderBuilderModel model,
    required dynamic value,
  }) =>
          (
            BuildContext context,
            BoxConstraints constraints,
          ) {
            final id = data.id;

            data.registry.setValue(
              '$id.maxHeight',
              constraints.maxHeight,
              originator: '$id.maxHeight',
            );
            data.registry.setValue(
              '$id.maxWidth',
              constraints.maxWidth,
              originator: '$id.maxWidth',
            );
            data.registry.setValue(
              '$id.minHeight',
              constraints.minHeight,
              originator: '$id.minHeight',
            );
            data.registry.setValue(
              '$id.minWidth',
              constraints.minWidth,
              originator: '$id.minWidth',
            );

            return model.child?.build(
                  childBuilder: childBuilder,
                  context: context,
                  registry: data.registry,
                ) ??
                const SizedBox();
          };

  @override
  _LayoutBuilder buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class _LayoutBuilder extends StatelessWidget {
  const _LayoutBuilder({
    required this.builder,
    this.child,
  });

  final Widget Function(BuildContext context, BoxConstraints constraints)
      builder;
  final JsonWidgetData? child;

  @override
  Widget build(BuildContext context) => LayoutBuilder(builder: builder);
}
