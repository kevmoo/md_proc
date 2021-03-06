import 'package:md_proc/options.dart';

import 'individual_parsers.dart';
import 'parser.dart';
import 'reference_resolver.dart';
import 'service.dart';
import 'data/test_data.dart';


void main() {
  serviceTests();

  individualParsersTests();

  // CommonMark tests
  //tests("CommonMark", specification, mdToHtmlTest(Options.strict, (t, num) => t == TestType.html && (num == 129)));
  //tests("CommonMark", specification, mdToHtmlTest(Options.strict, (t, num) => t == TestType.html && (num >= 103 && num < 144)));
  //tests("CommonMark", specification, mdToHtmlTest(Options.strict, (t, num) => t == TestType.html));
  tests("CommonMark [strict]", specification, mdToHtmlTest(Options.strict));

  // Additional tests
  //tests("Additional", additionalMarkdownToHtml, mdToHtmlTest(Options.strict, (t, num) => t == TestType.html && num == 19));
  tests("Additional [strict]", additionalMarkdownToHtml, mdToHtmlTest(Options.strict));

  // SmartPunct
  tests("SmartPunct [commonmark]", smartPunctuation, mdToHtmlTest(Options.commonmark));

  // Strikeout
  tests("Strikeout", strikeout, mdToHtmlTest(new Options(strikeout: true)));

  // Subscript
  tests("Subscript", subscript, mdToHtmlTest(new Options(subscript: true)));

  // Superscript
  tests("Superscript", superscript, mdToHtmlTest(new Options(superscript: true)));

  // Strikeout
  tests("Strikeout and subscript", strikeoutAndSubscript, mdToHtmlTest(new Options(strikeout: true, subscript: true)));

  // Markdown to markdown tests
  tests("md2md [strict]", markdownToMarkdown, mdToMdTest(Options.strict));

  // Custom resolver
  referenceResolverTests();
}
