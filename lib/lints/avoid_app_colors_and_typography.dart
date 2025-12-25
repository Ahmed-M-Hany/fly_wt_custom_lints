import 'package:analyzer/dart/ast/ast.dart';
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

      // Check if it's AppColors or AppTypography
      if (className == 'AppColors' || className == 'AppTypography') {
        // Quick check: only traverse if the parent chain looks promising
        if (_isDefaultParameterValue(node)) {
          return; // Ignore usage in default parameter values
        }

        reporter.reportErrorForNode(_code, node);
      }
    });
  }

  /// Checks if the node is used as a default value in a parameter
  /// This is optimized to stop early and only check relevant parent nodes
  bool _isDefaultParameterValue(SimpleIdentifier node) {
    AstNode? current = node.parent;
    int depth = 0;
    const maxDepth = 10; // Reasonable limit for default parameter expressions

    // Traverse up but with early exits and depth limit
    while (current != null && depth < maxDepth) {
      // Early exit: if we hit a function/method body or other statement context,
      // we're definitely not in a parameter default value
      if (current is FunctionBody ||
          current is Block ||
          current is ExpressionStatement) {
        return false;
      }

      // Check if we're in a default formal parameter
      if (current is DefaultFormalParameter) {
        return true;
      }

      // Early exit: if we've passed the formal parameter list entirely
      if (current is FunctionDeclaration ||
          current is ConstructorDeclaration ||
          current is MethodDeclaration) {
        return false;
      }

      current = current.parent;
      depth++;
    }

    return false;
  }
}