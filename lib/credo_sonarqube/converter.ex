defmodule CredoSonarqube.Converter do
    @moduledoc false
  
    # Issue type
    @code_smell :code_smell
    @bug :bug
    @vulnerability :vulnerability
  
    # Issue severity
    @minor :minor
    @major :major
  
    # Effort
    @trivial 5
    @medium 60
    @hard 480
  
    # Format: get_details(check), do: {type, severity, effort}
    def get_details(Credo.Check.Consistency.ExceptionNames), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Consistency.LineEndings), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Consistency.ParameterPatternMatching), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Consistency.SpaceAroundOperators), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Consistency.SpaceInParentheses), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Consistency.TabsOrSpaces), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Design.AliasUsage), do: {@code_smell, @minor, @trivial}
  
    # Fixme or TODO is usually a major code smell, and it is estimated to
    # take at least a day to fix
    def get_details(Credo.Check.Design.TagTODO), do: {@code_smell, @major, @hard}
    def get_details(Credo.Check.Design.TagFIXME), do: {@code_smell, @major, @hard}
    def get_details(Credo.Check.Readability.AliasOrder), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Readability.FunctionNames), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Readability.LargeNumbers), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Readability.MaxLineLength), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Readability.ModuleAttributeNames), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Readability.ModuleDoc), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Readability.ModuleNames), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Readability.ParenthesesInCondition), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Readability.ParenthesesOnZeroArityDefs), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Readability.PredicateFunctionNames), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Readability.PreferImplicitTry), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Readability.RedundantBlankLines), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Readability.Semicolons), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Readability.SpaceAfterCommas), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Readability.StringSigils), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Readability.TrailingBlankLine), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Readability.TrailingWhiteSpace), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Readability.UnnecessaryAliasExpansion), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Readability.VariableNames), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Refactor.CondStatements), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Refactor.CyclomaticComplexity), do: {@code_smell, @major, @medium}
    def get_details(Credo.Check.Refactor.FunctionArity), do: {@code_smell, @major, @medium}
    def get_details(Credo.Check.Refactor.LongQuoteBlocks), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Refactor.MapInto), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Refactor.MatchInCondition), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Refactor.NegatedConditionsInUnless), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Refactor.NegatedConditionsWithElse), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Refactor.Nesting), do: {@code_smell, @major, @medium}
    def get_details(Credo.Check.Refactor.UnlessWithElse), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Refactor.WithClauses), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Warning.BoolOperationOnSameValues), do: {@bug, @major, @trivial}
    def get_details(Credo.Check.Warning.ExpensiveEmptyEnumCheck), do: {@code_smell, @major, @trivial}
    def get_details(Credo.Check.Warning.IExPry), do: {@code_smell, @major, @trivial}
    def get_details(Credo.Check.Warning.IoInspect), do: {@code_smell, @major, @trivial}
    def get_details(Credo.Check.Warning.LazyLogging), do: {@code_smell, @major, @trivial}
    def get_details(Credo.Check.Warning.MixEnv), do: {@code_smell, @major, @trivial}
    def get_details(Credo.Check.Warning.OperationOnSameValues), do: {@bug, @major, @trivial}
    def get_details(Credo.Check.Warning.OperationWithConstantResult), do: {@bug, @major, @trivial}
    def get_details(Credo.Check.Warning.RaiseInsideRescue), do: {@code_smell, @major, @trivial}
    def get_details(Credo.Check.Warning.UnusedEnumOperation), do: {@bug, @major, @trivial}
    def get_details(Credo.Check.Warning.UnusedFileOperation), do: {@bug, @major, @trivial}
    def get_details(Credo.Check.Warning.UnusedKeywordOperation), do: {@bug, @major, @trivial}
    def get_details(Credo.Check.Warning.UnusedListOperation), do: {@bug, @major, @trivial}
    def get_details(Credo.Check.Warning.UnusedPathOperation), do: {@bug, @major, @trivial}
    def get_details(Credo.Check.Warning.UnusedRegexOperation), do: {@bug, @major, @trivial}
    def get_details(Credo.Check.Warning.UnusedStringOperation), do: {@bug, @major, @trivial}
    def get_details(Credo.Check.Warning.UnusedTupleOperation), do: {@bug, @major, @trivial}
    def get_details(Credo.Check.Warning.UnsafeExec), do: {@vulnerability, @major, @medium}
  
    # Controversial checks
  
    def get_details(Credo.Check.Readability.StrictModuleLayout), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Consistency.MultiAliasImportRequireUse), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Consistency.UnusedVariableNames), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Design.DuplicatedCode), do: {@code_smell, @major, @medium}
    def get_details(Credo.Check.Readability.AliasAs), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Readability.MultiAlias), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Readability.Specs), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Readability.SinglePipe), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Readability.WithCustomTaggedTuple), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Refactor.ABCSize), do: {@code_smell, @major, @medium}
    def get_details(Credo.Check.Refactor.AppendSingleItem), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Refactor.DoubleBooleanNegation), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Refactor.ModuleDependencies), do: {@code_smell, @major, @hard}
    def get_details(Credo.Check.Refactor.NegatedIsNil), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Refactor.PipeChainStart), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Refactor.VariableRebinding), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Warning.MapGetUnsafePass), do: {@code_smell, @minor, @trivial}
    def get_details(Credo.Check.Warning.UnsafeToAtom), do: {@vulnerability, @major, @medium}
    def get_details(Credo.Check.Warning.LeakyEnvironment), do: {@vulnerability, @minor, @trivial}
  end