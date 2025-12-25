import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'lints/avoid_app_colors_and_typography.dart';

PluginBase createPlugin() => _CustomLintPlugin();

class _CustomLintPlugin extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
    const AvoidDirectColorTypographyUsage(),
    //add more custom lints here as you please

  ];
}