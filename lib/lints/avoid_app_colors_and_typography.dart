import 'package:analyzer/error/error.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

class AvoidDirectColorTypographyUsage extends DartLintRule {
  const AvoidDirectColorTypographyUsage() : super(code: _code);

  static const _code = LintCode(
    name: 'avoid_direct_color_typography_usage',
    problemMessage:
        'Direct usage of AppColors/AppTypography is discouraged. Use Theme.of(context) and the app\'s Material theme to access colors and text styles instead.',
    errorSeverity: ErrorSeverity.WARNING,
  );

  @override
  void run(
      CustomLintResolver resolver,
      ErrorReporter reporter,
      CustomLintContext context,
      ) {

    if(resolver.path.contains("theme")) return;

    context.registry.addSimpleIdentifier((node) {
      final element = node.staticElement;

      // Check if the identifier references a class
      if (element == null) return;


      // Get the class name
      final className = element.enclosingElement?.name;

      // Check if it's AppColors or Typography
      if (className == 'AppColors' || className == 'AppTypography') {
        reporter.reportErrorForNode(_code, node);
      }
    });
  }
}

