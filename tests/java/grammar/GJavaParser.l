
Options in effect for GJavaParser.g:

    ACTION-BLOCK=("JavaParser.rs","/.","./")

    AST-DIRECTORY=""  AST-TYPE="Ast"  NOATTRIBUTES  NOAUTOMATIC-AST  BACKTRACK
    BYTE  CONFLICTS  DAT-DIRECTORY=""  DAT-FILE="JavaParserdcl.data"  
    DCL-FILE="JavaParserdcl.rs"  NODEBUG  DEF-FILE="JavaParserdef.rs"  
    DIRECTORY-PREFIX=""  NOEDIT  ERROR-MAPS  ESCAPE='$'  
    EXPORT-TERMINALS=("JavaParserexp.rs","","")  EXTENDS-PARSETABLE  FACTORY=""
    FILE-PREFIX="JavaParser"  NOFIRST  NOFOLLOW  NOGLR  NOGOTO-DEFAULT  
    GRM-FILE="GJavaParser.g"  IMP-FILE="JavaParserimp.rs"  
    IMPORT-TERMINALS="GJavaLexer.gi"  
    INCLUDE-DIRECTORY="/Users/kuafu/workspace/lpg-project/LPG2/lpg2/../lpg-generator-templates-2.1.00/include/rust"
    LALR=1  LEGACY  NOLIST  MARGIN=4  MAX-CASES=1024  NAMES=OPTIMIZED  NT-CHECK
    OR_MARKER='|'  OUT-DIRECTORY=""  PACKAGE="java"  PARENT-SAVED  
    PARSETABLE-INTERFACES="ParseTable"  PREFIX="TK_"  PRIORITY  
    PROGRAMMING_LANGUAGE=RUST  PRS-FILE="JavaParserprs.rs"  NOQUIET  READ-REDUCE
    REMAP-TERMINALS  RULE_CLASSNAMES=SEQUENTIAL  SCOPES  NOSERIALIZE  
    NOSHIFT-DEFAULT  NOSINGLE-PRODUCTIONS  NOSOFT-KEYWORDS  NOSTATES  SUFFIX=""
    SYM-FILE="JavaParsersym.rs"  TAB-FILE="GJavaParser.t"  TABLE  
    TEMPLATE="/Users/kuafu/workspace/lpg-project/LPG2/lpg2/../lpg-generator-templates-2.1.00/templates/rust/btParserTemplateF.gi"
    TRACE=CONFLICTS  VARIABLES  NOVERBOSE  VISITOR=PREORDER  
    VISITOR-TYPE="Visitor"  WARNINGS  NOXREF  



Strongly-connected components in ranks:

    ArrayType
    ReferenceType
    Type

    ArrayAccess
    MethodInvocation
    ClassInstanceCreationExpression
    PrimaryNoNewArray
    Primary
    FieldAccess

    PostDecrementExpression
    PostfixExpression
    PostIncrementExpression



RANK RULE
==== ====
1    232   NormalAnnotation ::= AT TypeName LPAREN ElementValuePairsopt RPAREN
2    243   MarkerAnnotation ::= AT TypeName
3    244   SingleElementAnnotation ::= AT TypeName LPAREN ElementValue RPAREN
4    229   Annotation ::= NormalAnnotation
5    230   Annotation ::= MarkerAnnotation
6    231   Annotation ::= SingleElementAnnotation
7    227   Annotations ::= Annotation
8    228   Annotations ::= Annotations Annotation
9    523   Annotationsopt ::= Annotations
10   522   Annotationsopt ::=
11   60    PackageDeclaration ::= Annotationsopt package PackageName SEMICOLON
12   529   PackageDeclarationopt ::= PackageDeclaration
13   528   PackageDeclarationopt ::=
14   65    SingleTypeImportDeclaration ::= import TypeName SEMICOLON
15   66    TypeImportOnDemandDeclaration ::= import PackageOrTypeName DOT MULTIPLY SEMICOLON
16   67    SingleStaticImportDeclaration ::= import static TypeName DOT identifier SEMICOLON
17   68    StaticImportOnDemandDeclaration ::= import static TypeName DOT MULTIPLY SEMICOLON
18   61    ImportDeclaration ::= SingleTypeImportDeclaration
19   62    ImportDeclaration ::= TypeImportOnDemandDeclaration
20   63    ImportDeclaration ::= SingleStaticImportDeclaration
21   64    ImportDeclaration ::= StaticImportOnDemandDeclaration
22   56    ImportDeclarations ::= ImportDeclaration
23   57    ImportDeclarations ::= ImportDeclarations ImportDeclaration
24   527   ImportDeclarationsopt ::= ImportDeclarations
25   526   ImportDeclarationsopt ::=
26   77    ClassModifier ::= Annotation
27   78    ClassModifier ::= public
28   79    ClassModifier ::= protected
29   80    ClassModifier ::= private
30   81    ClassModifier ::= abstract
31   82    ClassModifier ::= static
32   83    ClassModifier ::= final
33   84    ClassModifier ::= strictfp
34   75    ClassModifiers ::= ClassModifier
35   76    ClassModifiers ::= ClassModifiers ClassModifier
36   521   ClassModifiersopt ::= ClassModifiers
37   520   ClassModifiersopt ::=
38   74    NormalClassDeclaration ::= ClassModifiersopt class identifier TypeParametersopt Superopt Interfacesopt ClassBody
39   173   EnumDeclaration ::= ClassModifiersopt enum identifier Interfacesopt EnumBody
40   72    ClassDeclaration ::= NormalClassDeclaration
41   73    ClassDeclaration ::= EnumDeclaration
42   185   InterfaceModifier ::= Annotation
43   186   InterfaceModifier ::= public
44   187   InterfaceModifier ::= protected
45   188   InterfaceModifier ::= private
46   189   InterfaceModifier ::= abstract
47   190   InterfaceModifier ::= static
48   191   InterfaceModifier ::= strictfp
49   183   InterfaceModifiers ::= InterfaceModifier
50   184   InterfaceModifiers ::= InterfaceModifiers InterfaceModifier
51   483   InterfaceModifiersopt ::= InterfaceModifiers
52   482   InterfaceModifiersopt ::=
53   182   NormalInterfaceDeclaration ::= InterfaceModifiersopt interface identifier TypeParametersopt ExtendsInterfacesopt InterfaceBody
54   215   AnnotationTypeDeclaration ::= InterfaceModifiersopt AT interface identifier AnnotationTypeBody
55   180   InterfaceDeclaration ::= NormalInterfaceDeclaration
56   181   InterfaceDeclaration ::= AnnotationTypeDeclaration
57   69    TypeDeclaration ::= ClassDeclaration
58   70    TypeDeclaration ::= InterfaceDeclaration
59   71    TypeDeclaration ::= SEMICOLON
60   58    TypeDeclarations ::= TypeDeclaration
61   59    TypeDeclarations ::= TypeDeclarations TypeDeclaration
62   525   TypeDeclarationsopt ::= TypeDeclarations
63   524   TypeDeclarationsopt ::=
64   55    CompilationUnit ::= PackageDeclarationopt ImportDeclarationsopt TypeDeclarationsopt
65   0     $accept ::= CompilationUnit
66   491   Commaopt ::= COMMA
67   490   Commaopt ::=
68   503   Ellipsisopt ::= ELLIPSIS
69   502   Ellipsisopt ::=
70   1     identifier ::= IDENTIFIER
71   136   VariableModifier ::= final
72   137   VariableModifier ::= Annotations
73   134   VariableModifiers ::= VariableModifier
74   135   VariableModifiers ::= VariableModifiers VariableModifier
75   463   VariableModifiersopt ::= VariableModifiers
76   462   VariableModifiersopt ::=
77   14    IntegralType ::= byte
78   15    IntegralType ::= short
79   16    IntegralType ::= int
80   17    IntegralType ::= long
81   18    IntegralType ::= char
82   19    FloatingPointType ::= float
83   20    FloatingPointType ::= double
84   12    NumericType ::= IntegralType
85   13    NumericType ::= FloatingPointType
86   10    PrimitiveType ::= NumericType
87   11    PrimitiveType ::= boolean
88   27    TypeName ::= identifier
89   28    TypeName ::= TypeName DOT identifier
90   25    ClassType ::= TypeName TypeArgumentsopt
91   24    ClassOrInterfaceType ::= ClassType
92   30    TypeVariable ::= identifier
93   31    ArrayType ::= Type LBRACKET RBRACKET
94   21    ReferenceType ::= ClassOrInterfaceType
95   22    ReferenceType ::= TypeVariable
96   23    ReferenceType ::= ArrayType
97   8     Type ::= PrimitiveType
98   9     Type ::= ReferenceType
99   255   LocalVariableDeclaration ::= VariableModifiersopt Type VariableDeclarators
100  254   LocalVariableDeclarationStatement ::= LocalVariableDeclaration SEMICOLON
101  248   Block ::= LBRACE BlockStatementsopt RBRACE
102  282   EmptyStatement ::= SEMICOLON
103  53    AmbiguousName ::= identifier
104  54    AmbiguousName ::= AmbiguousName DOT identifier
105  47    ExpressionName ::= identifier
106  48    ExpressionName ::= AmbiguousName DOT identifier
107  350   BooleanLiteral ::= true
108  351   BooleanLiteral ::= false
109  342   Literal ::= IntegerLiteral
110  343   Literal ::= LongLiteral
111  344   Literal ::= FloatingPointLiteral
112  345   Literal ::= DoubleLiteral
113  346   Literal ::= BooleanLiteral
114  347   Literal ::= CharacterLiteral
115  348   Literal ::= StringLiteral
116  349   Literal ::= null
117  29    ClassName ::= TypeName
118  49    MethodName ::= identifier
119  50    MethodName ::= AmbiguousName DOT identifier
120  356   ArrayCreationExpression ::= new PrimitiveType DimExprs Dimsopt
121  357   ArrayCreationExpression ::= new ClassOrInterfaceType DimExprs Dimsopt
122  358   ArrayCreationExpression ::= new PrimitiveType Dims ArrayInitializer
123  359   ArrayCreationExpression ::= new ClassOrInterfaceType Dims ArrayInitializer
124  373   ArrayAccess ::= ExpressionName LBRACKET Expression RBRACKET
125  374   ArrayAccess ::= PrimaryNoNewArray LBRACKET Expression RBRACKET
126  368   MethodInvocation ::= MethodName LPAREN ArgumentListopt RPAREN
127  369   MethodInvocation ::= Primary DOT TypeArgumentsopt identifier LPAREN ArgumentListopt RPAREN
128  370   MethodInvocation ::= super DOT TypeArgumentsopt identifier LPAREN ArgumentListopt RPAREN
129  371   MethodInvocation ::= ClassName DOT super DOT TypeArgumentsopt identifier LPAREN ArgumentListopt RPAREN
130  372   MethodInvocation ::= TypeName DOT TypeArguments identifier LPAREN ArgumentListopt RPAREN
131  352   ClassInstanceCreationExpression ::= new TypeArgumentsopt ClassOrInterfaceType TypeArgumentsopt LPAREN ArgumentListopt RPAREN ClassBodyopt
132  353   ClassInstanceCreationExpression ::= Primary DOT new TypeArgumentsopt identifier TypeArgumentsopt LPAREN ArgumentListopt RPAREN ClassBodyopt
133  332   PrimaryNoNewArray ::= Literal
134  333   PrimaryNoNewArray ::= Type DOT class
135  334   PrimaryNoNewArray ::= void DOT class
136  335   PrimaryNoNewArray ::= this
137  336   PrimaryNoNewArray ::= ClassName DOT this
138  337   PrimaryNoNewArray ::= LPAREN Expression RPAREN
139  338   PrimaryNoNewArray ::= ClassInstanceCreationExpression
140  339   PrimaryNoNewArray ::= FieldAccess
141  340   PrimaryNoNewArray ::= MethodInvocation
142  341   PrimaryNoNewArray ::= ArrayAccess
143  330   Primary ::= PrimaryNoNewArray
144  331   Primary ::= ArrayCreationExpression
145  365   FieldAccess ::= Primary DOT identifier
146  366   FieldAccess ::= super DOT identifier
147  367   FieldAccess ::= ClassName DOT super DOT identifier
148  429   LeftHandSide ::= ExpressionName
149  430   LeftHandSide ::= FieldAccess
150  431   LeftHandSide ::= ArrayAccess
151  428   Assignment ::= LeftHandSide AssignmentOperator AssignmentExpression
152  386   PreIncrementExpression ::= PLUS_PLUS UnaryExpression
153  387   PreDecrementExpression ::= MINUS_MINUS UnaryExpression
154  380   PostDecrementExpression ::= PostfixExpression MINUS_MINUS
155  375   PostfixExpression ::= Primary
156  376   PostfixExpression ::= ExpressionName
157  377   PostfixExpression ::= PostIncrementExpression
158  378   PostfixExpression ::= PostDecrementExpression
159  379   PostIncrementExpression ::= PostfixExpression PLUS_PLUS
160  286   StatementExpression ::= Assignment
161  287   StatementExpression ::= PreIncrementExpression
162  288   StatementExpression ::= PreDecrementExpression
163  289   StatementExpression ::= PostIncrementExpression
164  290   StatementExpression ::= PostDecrementExpression
165  291   StatementExpression ::= MethodInvocation
166  292   StatementExpression ::= ClassInstanceCreationExpression
167  285   ExpressionStatement ::= StatementExpression SEMICOLON
168  293   AssertStatement ::= assert Expression SEMICOLON
169  294   AssertStatement ::= assert Expression COLON Expression SEMICOLON
170  295   SwitchStatement ::= switch LPAREN Expression RPAREN SwitchBlock
171  308   DoStatement ::= do Statement while LPAREN Expression RPAREN SEMICOLON
172  319   BreakStatement ::= break identifieropt SEMICOLON
173  320   ContinueStatement ::= continue identifieropt SEMICOLON
174  321   ReturnStatement ::= return Expressionopt SEMICOLON
175  323   SynchronizedStatement ::= synchronized LPAREN Expression RPAREN Block
176  322   ThrowStatement ::= throw Expression SEMICOLON
177  324   TryStatement ::= try Block Catches
178  325   TryStatement ::= try Block Catchesopt Finally
179  262   StatementWithoutTrailingSubstatement ::= Block
180  263   StatementWithoutTrailingSubstatement ::= EmptyStatement
181  264   StatementWithoutTrailingSubstatement ::= ExpressionStatement
182  265   StatementWithoutTrailingSubstatement ::= AssertStatement
183  266   StatementWithoutTrailingSubstatement ::= SwitchStatement
184  267   StatementWithoutTrailingSubstatement ::= DoStatement
185  268   StatementWithoutTrailingSubstatement ::= BreakStatement
186  269   StatementWithoutTrailingSubstatement ::= ContinueStatement
187  270   StatementWithoutTrailingSubstatement ::= ReturnStatement
188  271   StatementWithoutTrailingSubstatement ::= SynchronizedStatement
189  272   StatementWithoutTrailingSubstatement ::= ThrowStatement
190  273   StatementWithoutTrailingSubstatement ::= TryStatement
191  283   LabeledStatement ::= identifier COLON Statement
192  279   IfThenStatement ::= if LPAREN Expression RPAREN Statement
193  280   IfThenElseStatement ::= if LPAREN Expression RPAREN StatementNoShortIf else Statement
194  306   WhileStatement ::= while LPAREN Expression RPAREN Statement
195  311   BasicForStatement ::= for LPAREN ForInitopt SEMICOLON Expressionopt SEMICOLON ForUpdateopt RPAREN Statement
196  318   EnhancedForStatement ::= for LPAREN FormalParameter COLON Expression RPAREN Statement
197  309   ForStatement ::= BasicForStatement
198  310   ForStatement ::= EnhancedForStatement
199  256   Statement ::= StatementWithoutTrailingSubstatement
200  257   Statement ::= LabeledStatement
201  258   Statement ::= IfThenStatement
202  259   Statement ::= IfThenElseStatement
203  260   Statement ::= WhileStatement
204  261   Statement ::= ForStatement
205  251   BlockStatement ::= LocalVariableDeclarationStatement
206  252   BlockStatement ::= ClassDeclaration
207  253   BlockStatement ::= Statement
208  249   BlockStatements ::= BlockStatement
209  250   BlockStatements ::= BlockStatements BlockStatement
210  497   BlockStatementsopt ::= BlockStatements
211  496   BlockStatementsopt ::=
212  3     LPGUserAction ::= BeginAction BlockStatementsopt EndAction
213  4     LPGUserAction ::= BeginJava BlockStatementsopt EndJava
214  5     LPGUserAction ::= NoAction
215  6     LPGUserAction ::= NullAction
216  7     LPGUserAction ::= BadAction
217  2     LPGUserAction ::= BlockStatementsopt
218  37    TypeArguments ::= LESS ActualTypeArgumentList GREATER
219  537   TypeArgumentsopt ::= TypeArguments
220  536   TypeArgumentsopt ::=
221  26    InterfaceType ::= TypeName TypeArgumentsopt
222  32    TypeParameter ::= TypeVariable TypeBoundopt
223  33    TypeBound ::= extends ClassOrInterfaceType AdditionalBoundListopt
224  535   TypeBoundopt ::= TypeBound
225  534   TypeBoundopt ::=
226  36    AdditionalBound ::= AND InterfaceType
227  34    AdditionalBoundList ::= AdditionalBound
228  35    AdditionalBoundList ::= AdditionalBoundList AdditionalBound
229  533   AdditionalBoundListopt ::= AdditionalBoundList
230  532   AdditionalBoundListopt ::=
231  42    Wildcard ::= QUESTION WildcardBoundsOpt
232  40    ActualTypeArgument ::= ReferenceType
233  41    ActualTypeArgument ::= Wildcard
234  38    ActualTypeArgumentList ::= ActualTypeArgument
235  39    ActualTypeArgumentList ::= ActualTypeArgumentList COMMA ActualTypeArgument
236  43    WildcardBounds ::= extends ReferenceType
237  44    WildcardBounds ::= super ReferenceType
238  531   WildcardBoundsOpt ::= WildcardBounds
239  530   WildcardBoundsOpt ::=
240  45    PackageName ::= identifier
241  46    PackageName ::= PackageName DOT identifier
242  51    PackageOrTypeName ::= identifier
243  52    PackageOrTypeName ::= PackageOrTypeName DOT identifier
244  85    TypeParameters ::= LESS TypeParameterList GREATER
245  519   TypeParametersopt ::= TypeParameters
246  518   TypeParametersopt ::=
247  88    Super ::= extends ClassType
248  517   Superopt ::= Super
249  516   Superopt ::=
250  89    Interfaces ::= implements InterfaceTypeList
251  515   Interfacesopt ::= Interfaces
252  514   Interfacesopt ::=
253  92    ClassBody ::= LBRACE ClassBodyDeclarationsopt RBRACE
254  86    TypeParameterList ::= TypeParameter
255  87    TypeParameterList ::= TypeParameterList COMMA TypeParameter
256  90    InterfaceTypeList ::= InterfaceType
257  91    InterfaceTypeList ::= InterfaceTypeList COMMA InterfaceType
258  115   FieldModifier ::= Annotation
259  116   FieldModifier ::= public
260  117   FieldModifier ::= protected
261  118   FieldModifier ::= private
262  119   FieldModifier ::= static
263  120   FieldModifier ::= final
264  121   FieldModifier ::= transient
265  122   FieldModifier ::= volatile
266  113   FieldModifiers ::= FieldModifier
267  114   FieldModifiers ::= FieldModifiers FieldModifier
268  511   FieldModifiersopt ::= FieldModifiers
269  510   FieldModifiersopt ::=
270  104   FieldDeclaration ::= FieldModifiersopt Type VariableDeclarators SEMICOLON
271  141   MethodModifier ::= Annotations
272  142   MethodModifier ::= public
273  143   MethodModifier ::= protected
274  144   MethodModifier ::= private
275  145   MethodModifier ::= abstract
276  146   MethodModifier ::= static
277  147   MethodModifier ::= final
278  148   MethodModifier ::= synchronized
279  149   MethodModifier ::= native
280  150   MethodModifier ::= strictfp
281  139   MethodModifiers ::= MethodModifier
282  140   MethodModifiers ::= MethodModifiers MethodModifier
283  509   MethodModifiersopt ::= MethodModifiers
284  508   MethodModifiersopt ::=
285  125   ResultType ::= Type
286  126   ResultType ::= void
287  124   MethodHeader ::= MethodModifiersopt TypeParametersopt ResultType MethodDeclarator Throwsopt
288  123   MethodDeclaration ::= MethodHeader MethodBody
289  99    ClassMemberDeclaration ::= FieldDeclaration
290  100   ClassMemberDeclaration ::= MethodDeclaration
291  101   ClassMemberDeclaration ::= ClassDeclaration
292  102   ClassMemberDeclaration ::= InterfaceDeclaration
293  103   ClassMemberDeclaration ::= SEMICOLON
294  158   InstanceInitializer ::= Block
295  159   StaticInitializer ::= static Block
296  165   ConstructorModifier ::= Annotations
297  166   ConstructorModifier ::= public
298  167   ConstructorModifier ::= protected
299  168   ConstructorModifier ::= private
300  163   ConstructorModifiers ::= ConstructorModifier
301  164   ConstructorModifiers ::= ConstructorModifiers ConstructorModifier
302  501   ConstructorModifiersopt ::= ConstructorModifiers
303  500   ConstructorModifiersopt ::=
304  162   SimpleTypeName ::= identifier
305  161   ConstructorDeclarator ::= TypeParametersopt SimpleTypeName LPAREN FormalParameterListopt RPAREN
306  160   ConstructorDeclaration ::= ConstructorModifiersopt ConstructorDeclarator Throwsopt ConstructorBody
307  95    ClassBodyDeclaration ::= ClassMemberDeclaration
308  96    ClassBodyDeclaration ::= InstanceInitializer
309  97    ClassBodyDeclaration ::= StaticInitializer
310  98    ClassBodyDeclaration ::= ConstructorDeclaration
311  93    ClassBodyDeclarations ::= ClassBodyDeclaration
312  94    ClassBodyDeclarations ::= ClassBodyDeclarations ClassBodyDeclaration
313  513   ClassBodyDeclarationsopt ::= ClassBodyDeclarations
314  512   ClassBodyDeclarationsopt ::=
315  109   VariableDeclaratorId ::= identifier
316  110   VariableDeclaratorId ::= VariableDeclaratorId LBRACKET RBRACKET
317  107   VariableDeclarator ::= VariableDeclaratorId
318  108   VariableDeclarator ::= VariableDeclaratorId EQUAL VariableInitializer
319  105   VariableDeclarators ::= VariableDeclarator
320  106   VariableDeclarators ::= VariableDeclarators COMMA VariableDeclarator
321  392   CastExpression ::= LPAREN PrimitiveType Dimsopt RPAREN UnaryExpression
322  393   CastExpression ::= LPAREN ReferenceType RPAREN UnaryExpressionNotPlusMinus
323  388   UnaryExpressionNotPlusMinus ::= PostfixExpression
324  389   UnaryExpressionNotPlusMinus ::= TWIDDLE UnaryExpression
325  390   UnaryExpressionNotPlusMinus ::= NOT UnaryExpression
326  391   UnaryExpressionNotPlusMinus ::= CastExpression
327  381   UnaryExpression ::= PreIncrementExpression
328  382   UnaryExpression ::= PreDecrementExpression
329  383   UnaryExpression ::= PLUS UnaryExpression
330  384   UnaryExpression ::= MINUS UnaryExpression
331  385   UnaryExpression ::= UnaryExpressionNotPlusMinus
332  394   MultiplicativeExpression ::= UnaryExpression
333  395   MultiplicativeExpression ::= MultiplicativeExpression MULTIPLY UnaryExpression
334  396   MultiplicativeExpression ::= MultiplicativeExpression DIVIDE UnaryExpression
335  397   MultiplicativeExpression ::= MultiplicativeExpression REMAINDER UnaryExpression
336  398   AdditiveExpression ::= MultiplicativeExpression
337  399   AdditiveExpression ::= AdditiveExpression PLUS MultiplicativeExpression
338  400   AdditiveExpression ::= AdditiveExpression MINUS MultiplicativeExpression
339  401   ShiftExpression ::= AdditiveExpression
340  402   ShiftExpression ::= ShiftExpression LEFT_SHIFT AdditiveExpression
341  403   ShiftExpression ::= ShiftExpression GREATER GREATER AdditiveExpression
342  404   ShiftExpression ::= ShiftExpression GREATER GREATER GREATER AdditiveExpression
343  405   RelationalExpression ::= ShiftExpression
344  406   RelationalExpression ::= RelationalExpression LESS ShiftExpression
345  407   RelationalExpression ::= RelationalExpression GREATER ShiftExpression
346  408   RelationalExpression ::= RelationalExpression LESS_EQUAL ShiftExpression
347  409   RelationalExpression ::= RelationalExpression GREATER EQUAL ShiftExpression
348  410   RelationalExpression ::= RelationalExpression instanceof ReferenceType
349  411   EqualityExpression ::= RelationalExpression
350  412   EqualityExpression ::= EqualityExpression EQUAL_EQUAL RelationalExpression
351  413   EqualityExpression ::= EqualityExpression NOT_EQUAL RelationalExpression
352  414   AndExpression ::= EqualityExpression
353  415   AndExpression ::= AndExpression AND EqualityExpression
354  416   ExclusiveOrExpression ::= AndExpression
355  417   ExclusiveOrExpression ::= ExclusiveOrExpression XOR AndExpression
356  418   InclusiveOrExpression ::= ExclusiveOrExpression
357  419   InclusiveOrExpression ::= InclusiveOrExpression OR ExclusiveOrExpression
358  420   ConditionalAndExpression ::= InclusiveOrExpression
359  421   ConditionalAndExpression ::= ConditionalAndExpression AND_AND InclusiveOrExpression
360  422   ConditionalOrExpression ::= ConditionalAndExpression
361  423   ConditionalOrExpression ::= ConditionalOrExpression OR_OR ConditionalAndExpression
362  424   ConditionalExpression ::= ConditionalOrExpression
363  425   ConditionalExpression ::= ConditionalOrExpression QUESTION Expression COLON ConditionalExpression
364  426   AssignmentExpression ::= ConditionalExpression
365  427   AssignmentExpression ::= Assignment
366  444   Expression ::= AssignmentExpression
367  245   ArrayInitializer ::= LBRACE VariableInitializersopt Commaopt RBRACE
368  111   VariableInitializer ::= Expression
369  112   VariableInitializer ::= ArrayInitializer
370  156   MethodBody ::= Block
371  157   MethodBody ::= SEMICOLON
372  127   MethodDeclarator ::= identifier LPAREN FormalParameterListopt RPAREN
373  128   MethodDeclarator ::= MethodDeclarator LBRACKET RBRACKET
374  151   Throws ::= throws ExceptionTypeList
375  507   Throwsopt ::= Throws
376  506   Throwsopt ::=
377  138   LastFormalParameter ::= VariableModifiersopt Type Ellipsisopt VariableDeclaratorId
378  133   FormalParameter ::= VariableModifiersopt Type VariableDeclaratorId
379  131   FormalParameters ::= FormalParameter
380  132   FormalParameters ::= FormalParameters COMMA FormalParameter
381  129   FormalParameterList ::= LastFormalParameter
382  130   FormalParameterList ::= FormalParameters COMMA LastFormalParameter
383  505   FormalParameterListopt ::= FormalParameterList
384  504   FormalParameterListopt ::=
385  154   ExceptionType ::= ClassType
386  155   ExceptionType ::= TypeVariable
387  152   ExceptionTypeList ::= ExceptionType
388  153   ExceptionTypeList ::= ExceptionTypeList COMMA ExceptionType
389  169   ConstructorBody ::= LBRACE ExplicitConstructorInvocationopt BlockStatementsopt RBRACE
390  170   ExplicitConstructorInvocation ::= TypeArgumentsopt this LPAREN ArgumentListopt RPAREN SEMICOLON
391  171   ExplicitConstructorInvocation ::= TypeArgumentsopt super LPAREN ArgumentListopt RPAREN SEMICOLON
392  172   ExplicitConstructorInvocation ::= Primary DOT TypeArgumentsopt super LPAREN ArgumentListopt RPAREN SEMICOLON
393  499   ExplicitConstructorInvocationopt ::= ExplicitConstructorInvocation
394  498   ExplicitConstructorInvocationopt ::=
395  354   ArgumentList ::= Expression
396  355   ArgumentList ::= ArgumentList COMMA Expression
397  495   ArgumentListopt ::= ArgumentList
398  494   ArgumentListopt ::=
399  174   EnumBody ::= LBRACE EnumConstantsopt Commaopt EnumBodyDeclarationsopt RBRACE
400  177   EnumConstant ::= Annotationsopt identifier Argumentsopt ClassBodyopt
401  305   EnumConstant ::= identifier
402  175   EnumConstants ::= EnumConstant
403  176   EnumConstants ::= EnumConstants COMMA EnumConstant
404  493   EnumConstantsopt ::= EnumConstants
405  492   EnumConstantsopt ::=
406  179   EnumBodyDeclarations ::= SEMICOLON ClassBodyDeclarationsopt
407  489   EnumBodyDeclarationsopt ::= EnumBodyDeclarations
408  488   EnumBodyDeclarationsopt ::=
409  178   Arguments ::= LPAREN ArgumentListopt RPAREN
410  487   Argumentsopt ::= Arguments
411  486   Argumentsopt ::=
412  485   ClassBodyopt ::= ClassBody
413  484   ClassBodyopt ::=
414  192   ExtendsInterfaces ::= extends InterfaceType
415  193   ExtendsInterfaces ::= ExtendsInterfaces COMMA InterfaceType
416  481   ExtendsInterfacesopt ::= ExtendsInterfaces
417  480   ExtendsInterfacesopt ::=
418  194   InterfaceBody ::= LBRACE InterfaceMemberDeclarationsopt RBRACE
419  205   ConstantModifier ::= Annotation
420  206   ConstantModifier ::= public
421  207   ConstantModifier ::= static
422  208   ConstantModifier ::= final
423  203   ConstantModifiers ::= ConstantModifier
424  204   ConstantModifiers ::= ConstantModifiers ConstantModifier
425  477   ConstantModifiersopt ::= ConstantModifiers
426  476   ConstantModifiersopt ::=
427  202   ConstantDeclaration ::= ConstantModifiersopt Type VariableDeclarators
428  212   AbstractMethodModifier ::= Annotations
429  213   AbstractMethodModifier ::= public
430  214   AbstractMethodModifier ::= abstract
431  210   AbstractMethodModifiers ::= AbstractMethodModifier
432  211   AbstractMethodModifiers ::= AbstractMethodModifiers AbstractMethodModifier
433  475   AbstractMethodModifiersopt ::= AbstractMethodModifiers
434  474   AbstractMethodModifiersopt ::=
435  209   AbstractMethodDeclaration ::= AbstractMethodModifiersopt TypeParametersopt ResultType MethodDeclarator Throwsopt SEMICOLON
436  197   InterfaceMemberDeclaration ::= ConstantDeclaration
437  198   InterfaceMemberDeclaration ::= AbstractMethodDeclaration
438  199   InterfaceMemberDeclaration ::= ClassDeclaration
439  200   InterfaceMemberDeclaration ::= InterfaceDeclaration
440  201   InterfaceMemberDeclaration ::= SEMICOLON
441  195   InterfaceMemberDeclarations ::= InterfaceMemberDeclaration
442  196   InterfaceMemberDeclarations ::= InterfaceMemberDeclarations InterfaceMemberDeclaration
443  479   InterfaceMemberDeclarationsopt ::= InterfaceMemberDeclarations
444  478   InterfaceMemberDeclarationsopt ::=
445  216   AnnotationTypeBody ::= LBRACE AnnotationTypeElementDeclarationsopt RBRACE
446  219   AnnotationTypeElementDeclaration ::= AbstractMethodModifiersopt Type identifier LPAREN RPAREN DefaultValueopt SEMICOLON
447  220   AnnotationTypeElementDeclaration ::= ConstantDeclaration
448  221   AnnotationTypeElementDeclaration ::= ClassDeclaration
449  222   AnnotationTypeElementDeclaration ::= InterfaceDeclaration
450  223   AnnotationTypeElementDeclaration ::= EnumDeclaration
451  224   AnnotationTypeElementDeclaration ::= AnnotationTypeDeclaration
452  225   AnnotationTypeElementDeclaration ::= SEMICOLON
453  217   AnnotationTypeElementDeclarations ::= AnnotationTypeElementDeclaration
454  218   AnnotationTypeElementDeclarations ::= AnnotationTypeElementDeclarations AnnotationTypeElementDeclaration
455  473   AnnotationTypeElementDeclarationsopt ::= AnnotationTypeElementDeclarations
456  472   AnnotationTypeElementDeclarationsopt ::=
457  226   DefaultValue ::= default ElementValue
458  471   DefaultValueopt ::= DefaultValue
459  470   DefaultValueopt ::=
460  240   ElementValueArrayInitializer ::= LBRACE ElementValuesopt Commaopt RBRACE
461  237   ElementValue ::= ConditionalExpression
462  238   ElementValue ::= Annotation
463  239   ElementValue ::= ElementValueArrayInitializer
464  236   SimpleName ::= identifier
465  235   ElementValuePair ::= SimpleName EQUAL ElementValue
466  233   ElementValuePairs ::= ElementValuePair
467  234   ElementValuePairs ::= ElementValuePairs COMMA ElementValuePair
468  469   ElementValuePairsopt ::= ElementValuePairs
469  468   ElementValuePairsopt ::=
470  241   ElementValues ::= ElementValue
471  242   ElementValues ::= ElementValues COMMA ElementValue
472  467   ElementValuesopt ::= ElementValues
473  466   ElementValuesopt ::=
474  246   VariableInitializers ::= VariableInitializer
475  247   VariableInitializers ::= VariableInitializers COMMA VariableInitializer
476  465   VariableInitializersopt ::= VariableInitializers
477  464   VariableInitializersopt ::=
478  284   LabeledStatementNoShortIf ::= identifier COLON StatementNoShortIf
479  281   IfThenElseStatementNoShortIf ::= if LPAREN Expression RPAREN StatementNoShortIf else StatementNoShortIf
480  307   WhileStatementNoShortIf ::= while LPAREN Expression RPAREN StatementNoShortIf
481  312   ForStatementNoShortIf ::= for LPAREN ForInitopt SEMICOLON Expressionopt SEMICOLON ForUpdateopt RPAREN StatementNoShortIf
482  274   StatementNoShortIf ::= StatementWithoutTrailingSubstatement
483  275   StatementNoShortIf ::= LabeledStatementNoShortIf
484  276   StatementNoShortIf ::= IfThenElseStatementNoShortIf
485  277   StatementNoShortIf ::= WhileStatementNoShortIf
486  278   StatementNoShortIf ::= ForStatementNoShortIf
487  296   SwitchBlock ::= LBRACE SwitchBlockStatementGroupsopt SwitchLabelsopt RBRACE
488  302   SwitchLabel ::= case ConstantExpression COLON
489  303   SwitchLabel ::= case EnumConstant COLON
490  304   SwitchLabel ::= default COLON
491  300   SwitchLabels ::= SwitchLabel
492  301   SwitchLabels ::= SwitchLabels SwitchLabel
493  299   SwitchBlockStatementGroup ::= SwitchLabels BlockStatements
494  297   SwitchBlockStatementGroups ::= SwitchBlockStatementGroup
495  298   SwitchBlockStatementGroups ::= SwitchBlockStatementGroups SwitchBlockStatementGroup
496  461   SwitchBlockStatementGroupsopt ::= SwitchBlockStatementGroups
497  460   SwitchBlockStatementGroupsopt ::=
498  459   SwitchLabelsopt ::= SwitchLabels
499  458   SwitchLabelsopt ::=
500  445   ConstantExpression ::= Expression
501  316   StatementExpressionList ::= StatementExpression
502  317   StatementExpressionList ::= StatementExpressionList COMMA StatementExpression
503  313   ForInit ::= StatementExpressionList
504  314   ForInit ::= LocalVariableDeclaration
505  457   ForInitopt ::= ForInit
506  456   ForInitopt ::=
507  455   Expressionopt ::= Expression
508  454   Expressionopt ::=
509  315   ForUpdate ::= StatementExpressionList
510  453   ForUpdateopt ::= ForUpdate
511  452   ForUpdateopt ::=
512  451   identifieropt ::= identifier
513  450   identifieropt ::=
514  328   CatchClause ::= catch LPAREN FormalParameter RPAREN Block
515  326   Catches ::= CatchClause
516  327   Catches ::= Catches CatchClause
517  449   Catchesopt ::= Catches
518  448   Catchesopt ::=
519  329   Finally ::= finally Block
520  362   DimExpr ::= LBRACKET Expression RBRACKET
521  360   DimExprs ::= DimExpr
522  361   DimExprs ::= DimExprs DimExpr
523  363   Dims ::= LBRACKET RBRACKET
524  364   Dims ::= Dims LBRACKET RBRACKET
525  447   Dimsopt ::= Dims
526  446   Dimsopt ::=
527  432   AssignmentOperator ::= EQUAL
528  433   AssignmentOperator ::= MULTIPLY_EQUAL
529  434   AssignmentOperator ::= DIVIDE_EQUAL
530  435   AssignmentOperator ::= REMAINDER_EQUAL
531  436   AssignmentOperator ::= PLUS_EQUAL
532  437   AssignmentOperator ::= MINUS_EQUAL
533  438   AssignmentOperator ::= LEFT_SHIFT_EQUAL
534  439   AssignmentOperator ::= GREATER GREATER EQUAL
535  440   AssignmentOperator ::= GREATER GREATER GREATER EQUAL
536  441   AssignmentOperator ::= AND_EQUAL
537  442   AssignmentOperator ::= XOR_EQUAL
538  443   AssignmentOperator ::= OR_EQUAL
GJavaParser.g:146:5:146:17:3660:3672: Informative: The terminal GREATER_EQUAL is useless.
GJavaParser.g:147:5:147:15:3698:3708: Informative: The terminal RIGHT_SHIFT is useless.
GJavaParser.g:148:5:148:21:3736:3752: Informative: The terminal RIGHT_SHIFT_EQUAL is useless.
GJavaParser.g:149:5:149:24:3776:3795: Informative: The terminal UNSIGNED_RIGHT_SHIFT is useless.
GJavaParser.g:150:5:150:30:3815:3840: Informative: The terminal UNSIGNED_RIGHT_SHIFT_EQUAL is useless.
GJavaParser.g:153:5:153:15:3899:3909: Informative: The terminal BeginAction is useless.
GJavaParser.g:154:5:154:13:3949:3957: Informative: The terminal EndAction is useless.
GJavaParser.g:155:5:155:13:3997:4005: Informative: The terminal BeginJava is useless.
GJavaParser.g:156:5:156:11:4045:4051: Informative: The terminal EndJava is useless.
GJavaParser.g:157:5:157:12:4091:4098: Informative: The terminal NoAction is useless.
GJavaParser.g:158:5:158:14:4138:4147: Informative: The terminal NullAction is useless.
GJavaParser.g:159:5:159:13:4187:4195: Informative: The terminal BadAction is useless.
GJavaKWLexer.gi:22:5:22:9:277:281: Informative: The terminal const is useless.
GJavaKWLexer.gi:35:5:35:8:410:413: Informative: The terminal goto is useless.
GJavaParser.g:189:5:189:17:4909:4921: Warning: The nonterminal LPGUserAction is useless.


 The LALR Parser Generator              2.2.03 (Jul 14 2026)


---------------------------------- CONFLICTS ----------------------------------



STATE 1 ------------------------------------------------------------------------
( )

'$accept' ::= .CompilationUnit 

CompilationUnit ::= .PackageDeclarationopt ImportDeclarationsopt 
                    TypeDeclarationsopt 
PackageDeclaration ::= .Annotationsopt package PackageName SEMICOLON 
Annotations ::= .Annotation 
Annotations ::= .Annotations Annotation 
Annotation ::= .NormalAnnotation 
Annotation ::= .MarkerAnnotation 
Annotation ::= .SingleElementAnnotation 
NormalAnnotation ::= .AT TypeName LPAREN ElementValuePairsopt RPAREN 
MarkerAnnotation ::= .AT TypeName 
SingleElementAnnotation ::= .AT TypeName LPAREN ElementValue RPAREN 
Annotationsopt ::= . (522)
Annotationsopt ::= .Annotations 
PackageDeclarationopt ::= . (528)
PackageDeclarationopt ::= .PackageDeclaration 

GJavaParser.g:1076:27:1076:36:33809:33818: Warning: Shift/reduce conflict in state 1 on "AT" with rule 528

CompilationUnit ::= .PackageDeclarationopt ImportDeclarationsopt 
                    TypeDeclarationsopt 
PackageDeclarationopt ::= . (528)




STATE 7 ------------------------------------------------------------------------
( 3 )

CompilationUnit ::= PackageDeclarationopt ImportDeclarationsopt  .
                    TypeDeclarationsopt 

TypeDeclarations ::= .TypeDeclaration 
TypeDeclarations ::= .TypeDeclarations TypeDeclaration 
TypeDeclaration ::= .ClassDeclaration 
TypeDeclaration ::= .InterfaceDeclaration 
TypeDeclaration ::= .SEMICOLON 
ClassDeclaration ::= .NormalClassDeclaration 
ClassDeclaration ::= .EnumDeclaration 
NormalClassDeclaration ::= .ClassModifiersopt class identifier 
                           TypeParametersopt Superopt Interfacesopt ClassBody 
ClassModifiers ::= .ClassModifier 
ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifier ::= .Annotation 
ClassModifier ::= .public 
ClassModifier ::= .protected 
ClassModifier ::= .private 
ClassModifier ::= .abstract 
ClassModifier ::= .static 
ClassModifier ::= .final 
ClassModifier ::= .strictfp 
EnumDeclaration ::= .ClassModifiersopt enum identifier Interfacesopt EnumBody 
InterfaceDeclaration ::= .NormalInterfaceDeclaration 
InterfaceDeclaration ::= .AnnotationTypeDeclaration 
NormalInterfaceDeclaration ::= .InterfaceModifiersopt interface identifier 
                               TypeParametersopt ExtendsInterfacesopt 
                               InterfaceBody 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifier ::= .Annotation 
InterfaceModifier ::= .public 
InterfaceModifier ::= .protected 
InterfaceModifier ::= .private 
InterfaceModifier ::= .abstract 
InterfaceModifier ::= .static 
InterfaceModifier ::= .strictfp 
AnnotationTypeDeclaration ::= .InterfaceModifiersopt AT interface identifier 
                              AnnotationTypeBody 
Annotation ::= .NormalAnnotation 
Annotation ::= .MarkerAnnotation 
Annotation ::= .SingleElementAnnotation 
NormalAnnotation ::= .AT TypeName LPAREN ElementValuePairsopt RPAREN 
MarkerAnnotation ::= .AT TypeName 
SingleElementAnnotation ::= .AT TypeName LPAREN ElementValue RPAREN 
InterfaceModifiersopt ::= . (482)
InterfaceModifiersopt ::= .InterfaceModifiers 
ClassModifiersopt ::= . (520)
ClassModifiersopt ::= .ClassModifiers 
TypeDeclarationsopt ::= . (524)
TypeDeclarationsopt ::= .TypeDeclarations 

GJavaParser.g:1007:27:1007:36:32114:32123: Warning: Shift/reduce conflict in state 7 on "AT" with rule 482

AnnotationTypeDeclaration ::= .InterfaceModifiersopt AT interface identifier 
                              AnnotationTypeBody 
InterfaceModifiersopt ::= . (482)




STATE 12 -----------------------------------------------------------------------
( 7 23 180 223 224 249 254 270 291 )

InterfaceModifiers ::= InterfaceModifiers  .InterfaceModifier 
InterfaceModifiersopt ::= InterfaceModifiers . (483)

InterfaceModifier ::= .Annotation 
InterfaceModifier ::= .public 
InterfaceModifier ::= .protected 
InterfaceModifier ::= .private 
InterfaceModifier ::= .abstract 
InterfaceModifier ::= .static 
InterfaceModifier ::= .strictfp 
Annotation ::= .NormalAnnotation 
Annotation ::= .MarkerAnnotation 
Annotation ::= .SingleElementAnnotation 
NormalAnnotation ::= .AT TypeName LPAREN ElementValuePairsopt RPAREN 
MarkerAnnotation ::= .AT TypeName 
SingleElementAnnotation ::= .AT TypeName LPAREN ElementValue RPAREN 

GJavaParser.g:1008:29:1008:48:32153:32172: Warning: Shift/reduce conflict in state 12 on "AT" with rule 483

AnnotationTypeDeclaration ::= .InterfaceModifiersopt AT interface identifier 
                              AnnotationTypeBody 
InterfaceModifiersopt ::= InterfaceModifiers . (483)




STATE 14 -----------------------------------------------------------------------
( 7 23 180 223 224 249 )

ClassModifier ::= strictfp . (84)
InterfaceModifier ::= strictfp . (191)

GJavaParser.g:333:21:333:30:8887:8896: Warning: Reduce/reduce conflict in state 14 on "strictfp" between rule 84 and rule 191 starting at line 510, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= strictfp . (84)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= strictfp . (191)

GJavaParser.g:333:21:333:30:8887:8896: Warning: Reduce/reduce conflict in state 14 on "static" between rule 84 and rule 191 starting at line 510, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= strictfp . (84)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= strictfp . (191)

GJavaParser.g:333:21:333:30:8887:8896: Warning: Reduce/reduce conflict in state 14 on "public" between rule 84 and rule 191 starting at line 510, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= strictfp . (84)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= strictfp . (191)

GJavaParser.g:333:21:333:30:8887:8896: Warning: Reduce/reduce conflict in state 14 on "protected" between rule 84 and rule 191 starting at line 510, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= strictfp . (84)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= strictfp . (191)

GJavaParser.g:333:21:333:30:8887:8896: Warning: Reduce/reduce conflict in state 14 on "private" between rule 84 and rule 191 starting at line 510, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= strictfp . (84)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= strictfp . (191)

GJavaParser.g:333:21:333:30:8887:8896: Warning: Reduce/reduce conflict in state 14 on "abstract" between rule 84 and rule 191 starting at line 510, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= strictfp . (84)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= strictfp . (191)

GJavaParser.g:333:21:333:30:8887:8896: Warning: Reduce/reduce conflict in state 14 on "AT" between rule 84 and rule 191 starting at line 510, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= strictfp . (84)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= strictfp . (191)




STATE 15 -----------------------------------------------------------------------
( 7 23 )

ClassModifier ::= static . (82)
InterfaceModifier ::= static . (190)

GJavaParser.g:331:21:331:28:8830:8837: Warning: Reduce/reduce conflict in state 15 on "strictfp" between rule 82 and rule 190 starting at line 509, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= static . (82)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= static . (190)

GJavaParser.g:331:21:331:28:8830:8837: Warning: Reduce/reduce conflict in state 15 on "static" between rule 82 and rule 190 starting at line 509, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= static . (82)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= static . (190)

GJavaParser.g:331:21:331:28:8830:8837: Warning: Reduce/reduce conflict in state 15 on "public" between rule 82 and rule 190 starting at line 509, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= static . (82)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= static . (190)

GJavaParser.g:331:21:331:28:8830:8837: Warning: Reduce/reduce conflict in state 15 on "protected" between rule 82 and rule 190 starting at line 509, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= static . (82)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= static . (190)

GJavaParser.g:331:21:331:28:8830:8837: Warning: Reduce/reduce conflict in state 15 on "private" between rule 82 and rule 190 starting at line 509, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= static . (82)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= static . (190)

GJavaParser.g:331:21:331:28:8830:8837: Warning: Reduce/reduce conflict in state 15 on "abstract" between rule 82 and rule 190 starting at line 509, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= static . (82)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= static . (190)

GJavaParser.g:331:21:331:28:8830:8837: Warning: Reduce/reduce conflict in state 15 on "AT" between rule 82 and rule 190 starting at line 509, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= static . (82)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= static . (190)




STATE 16 -----------------------------------------------------------------------
( 7 23 )

ClassModifier ::= abstract . (81)
InterfaceModifier ::= abstract . (189)

GJavaParser.g:330:21:330:30:8799:8808: Warning: Reduce/reduce conflict in state 16 on "strictfp" between rule 81 and rule 189 starting at line 508, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= abstract . (81)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= abstract . (189)

GJavaParser.g:330:21:330:30:8799:8808: Warning: Reduce/reduce conflict in state 16 on "static" between rule 81 and rule 189 starting at line 508, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= abstract . (81)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= abstract . (189)

GJavaParser.g:330:21:330:30:8799:8808: Warning: Reduce/reduce conflict in state 16 on "public" between rule 81 and rule 189 starting at line 508, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= abstract . (81)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= abstract . (189)

GJavaParser.g:330:21:330:30:8799:8808: Warning: Reduce/reduce conflict in state 16 on "protected" between rule 81 and rule 189 starting at line 508, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= abstract . (81)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= abstract . (189)

GJavaParser.g:330:21:330:30:8799:8808: Warning: Reduce/reduce conflict in state 16 on "private" between rule 81 and rule 189 starting at line 508, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= abstract . (81)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= abstract . (189)

GJavaParser.g:330:21:330:30:8799:8808: Warning: Reduce/reduce conflict in state 16 on "abstract" between rule 81 and rule 189 starting at line 508, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= abstract . (81)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= abstract . (189)

GJavaParser.g:330:21:330:30:8799:8808: Warning: Reduce/reduce conflict in state 16 on "AT" between rule 81 and rule 189 starting at line 508, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= abstract . (81)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= abstract . (189)




STATE 17 -----------------------------------------------------------------------
( 7 23 180 223 224 249 )

ClassModifier ::= private . (80)
InterfaceModifier ::= private . (188)

GJavaParser.g:329:21:329:29:8769:8777: Warning: Reduce/reduce conflict in state 17 on "strictfp" between rule 80 and rule 188 starting at line 507, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= private . (80)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= private . (188)

GJavaParser.g:329:21:329:29:8769:8777: Warning: Reduce/reduce conflict in state 17 on "static" between rule 80 and rule 188 starting at line 507, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= private . (80)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= private . (188)

GJavaParser.g:329:21:329:29:8769:8777: Warning: Reduce/reduce conflict in state 17 on "public" between rule 80 and rule 188 starting at line 507, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= private . (80)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= private . (188)

GJavaParser.g:329:21:329:29:8769:8777: Warning: Reduce/reduce conflict in state 17 on "protected" between rule 80 and rule 188 starting at line 507, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= private . (80)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= private . (188)

GJavaParser.g:329:21:329:29:8769:8777: Warning: Reduce/reduce conflict in state 17 on "private" between rule 80 and rule 188 starting at line 507, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= private . (80)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= private . (188)

GJavaParser.g:329:21:329:29:8769:8777: Warning: Reduce/reduce conflict in state 17 on "abstract" between rule 80 and rule 188 starting at line 507, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= private . (80)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= private . (188)

GJavaParser.g:329:21:329:29:8769:8777: Warning: Reduce/reduce conflict in state 17 on "AT" between rule 80 and rule 188 starting at line 507, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= private . (80)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= private . (188)




STATE 18 -----------------------------------------------------------------------
( 7 23 180 223 224 249 )

ClassModifier ::= protected . (79)
InterfaceModifier ::= protected . (187)

GJavaParser.g:328:21:328:31:8737:8747: Warning: Reduce/reduce conflict in state 18 on "strictfp" between rule 79 and rule 187 starting at line 506, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= protected . (79)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= protected . (187)

GJavaParser.g:328:21:328:31:8737:8747: Warning: Reduce/reduce conflict in state 18 on "static" between rule 79 and rule 187 starting at line 506, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= protected . (79)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= protected . (187)

GJavaParser.g:328:21:328:31:8737:8747: Warning: Reduce/reduce conflict in state 18 on "public" between rule 79 and rule 187 starting at line 506, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= protected . (79)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= protected . (187)

GJavaParser.g:328:21:328:31:8737:8747: Warning: Reduce/reduce conflict in state 18 on "protected" between rule 79 and rule 187 starting at line 506, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= protected . (79)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= protected . (187)

GJavaParser.g:328:21:328:31:8737:8747: Warning: Reduce/reduce conflict in state 18 on "private" between rule 79 and rule 187 starting at line 506, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= protected . (79)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= protected . (187)

GJavaParser.g:328:21:328:31:8737:8747: Warning: Reduce/reduce conflict in state 18 on "abstract" between rule 79 and rule 187 starting at line 506, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= protected . (79)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= protected . (187)

GJavaParser.g:328:21:328:31:8737:8747: Warning: Reduce/reduce conflict in state 18 on "AT" between rule 79 and rule 187 starting at line 506, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= protected . (79)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= protected . (187)




STATE 19 -----------------------------------------------------------------------
( 7 23 )

ClassModifier ::= public . (78)
InterfaceModifier ::= public . (186)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 19 on "strictfp" between rule 78 and rule 186 starting at line 505, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= public . (186)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 19 on "static" between rule 78 and rule 186 starting at line 505, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= public . (186)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 19 on "public" between rule 78 and rule 186 starting at line 505, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= public . (186)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 19 on "protected" between rule 78 and rule 186 starting at line 505, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= public . (186)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 19 on "private" between rule 78 and rule 186 starting at line 505, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= public . (186)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 19 on "abstract" between rule 78 and rule 186 starting at line 505, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= public . (186)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 19 on "AT" between rule 78 and rule 186 starting at line 505, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= public . (186)




STATE 20 -----------------------------------------------------------------------
( 7 23 )

ClassModifier ::= Annotation . (77)
InterfaceModifier ::= Annotation . (185)

GJavaParser.g:326:19:326:32:8673:8686: Warning: Reduce/reduce conflict in state 20 on "strictfp" between rule 77 and rule 185 starting at line 504, column 23

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= Annotation . (77)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= Annotation . (185)

GJavaParser.g:326:19:326:32:8673:8686: Warning: Reduce/reduce conflict in state 20 on "static" between rule 77 and rule 185 starting at line 504, column 23

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= Annotation . (77)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= Annotation . (185)

GJavaParser.g:326:19:326:32:8673:8686: Warning: Reduce/reduce conflict in state 20 on "public" between rule 77 and rule 185 starting at line 504, column 23

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= Annotation . (77)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= Annotation . (185)

GJavaParser.g:326:19:326:32:8673:8686: Warning: Reduce/reduce conflict in state 20 on "protected" between rule 77 and rule 185 starting at line 504, column 23

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= Annotation . (77)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= Annotation . (185)

GJavaParser.g:326:19:326:32:8673:8686: Warning: Reduce/reduce conflict in state 20 on "private" between rule 77 and rule 185 starting at line 504, column 23

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= Annotation . (77)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= Annotation . (185)

GJavaParser.g:326:19:326:32:8673:8686: Warning: Reduce/reduce conflict in state 20 on "abstract" between rule 77 and rule 185 starting at line 504, column 23

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= Annotation . (77)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= Annotation . (185)

GJavaParser.g:326:19:326:32:8673:8686: Warning: Reduce/reduce conflict in state 20 on "AT" between rule 77 and rule 185 starting at line 504, column 23

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= Annotation . (77)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= Annotation . (185)




STATE 23 -----------------------------------------------------------------------
( 7 )

TypeDeclarations ::= TypeDeclarations  .TypeDeclaration 
TypeDeclarationsopt ::= TypeDeclarations . (525)

TypeDeclaration ::= .ClassDeclaration 
TypeDeclaration ::= .InterfaceDeclaration 
TypeDeclaration ::= .SEMICOLON 
ClassDeclaration ::= .NormalClassDeclaration 
ClassDeclaration ::= .EnumDeclaration 
NormalClassDeclaration ::= .ClassModifiersopt class identifier 
                           TypeParametersopt Superopt Interfacesopt ClassBody 
ClassModifiers ::= .ClassModifier 
ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifier ::= .Annotation 
ClassModifier ::= .public 
ClassModifier ::= .protected 
ClassModifier ::= .private 
ClassModifier ::= .abstract 
ClassModifier ::= .static 
ClassModifier ::= .final 
ClassModifier ::= .strictfp 
EnumDeclaration ::= .ClassModifiersopt enum identifier Interfacesopt EnumBody 
InterfaceDeclaration ::= .NormalInterfaceDeclaration 
InterfaceDeclaration ::= .AnnotationTypeDeclaration 
NormalInterfaceDeclaration ::= .InterfaceModifiersopt interface identifier 
                               TypeParametersopt ExtendsInterfacesopt 
                               InterfaceBody 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifier ::= .Annotation 
InterfaceModifier ::= .public 
InterfaceModifier ::= .protected 
InterfaceModifier ::= .private 
InterfaceModifier ::= .abstract 
InterfaceModifier ::= .static 
InterfaceModifier ::= .strictfp 
AnnotationTypeDeclaration ::= .InterfaceModifiersopt AT interface identifier 
                              AnnotationTypeBody 
Annotation ::= .NormalAnnotation 
Annotation ::= .MarkerAnnotation 
Annotation ::= .SingleElementAnnotation 
NormalAnnotation ::= .AT TypeName LPAREN ElementValuePairsopt RPAREN 
MarkerAnnotation ::= .AT TypeName 
SingleElementAnnotation ::= .AT TypeName LPAREN ElementValue RPAREN 
InterfaceModifiersopt ::= . (482)
InterfaceModifiersopt ::= .InterfaceModifiers 
ClassModifiersopt ::= . (520)
ClassModifiersopt ::= .ClassModifiers 

GJavaParser.g:1007:27:1007:36:32114:32123: Warning: Shift/reduce conflict in state 23 on "AT" with rule 482

AnnotationTypeDeclaration ::= .InterfaceModifiersopt AT interface identifier 
                              AnnotationTypeBody 
InterfaceModifiersopt ::= . (482)




STATE 27 -----------------------------------------------------------------------
( 8 )

TypeName ::= identifier . (27)
PackageOrTypeName ::= identifier . (51)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 27 on "DOT" between rule 27 and rule 51 starting at line 281, column 23

TypeName ::= .TypeName DOT identifier 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
PackageOrTypeName ::= .PackageOrTypeName DOT identifier 
PackageOrTypeName ::= identifier . (51)




STATE 53 -----------------------------------------------------------------------
( 29 42 43 44 57 58 59 61 62 79 85 87 99 107 108 109 111 112 113 114 115 117 
  118 119 120 121 122 123 124 125 135 152 157 161 163 171 191 201 204 206 209 
  234 235 237 242 261 272 276 292 293 298 307 309 312 314 320 332 346 351 353 
  354 355 356 362 366 375 387 396 399 400 401 402 403 427 428 434 435 437 438 
  439 440 441 442 443 453 459 462 463 464 465 470 471 473 )

ClassType ::= TypeName  .TypeArgumentsopt 
TypeName ::= TypeName  .DOT identifier 
ClassName ::= TypeName . (29)
MethodInvocation ::= TypeName  .DOT TypeArguments identifier LPAREN 
                     ArgumentListopt RPAREN 

TypeArguments ::= .LESS ActualTypeArgumentList GREATER 
TypeArgumentsopt ::= . (536)
TypeArgumentsopt ::= .TypeArguments 

GJavaParser.g:1088:22:1088:31:34116:34125: Warning: Shift/reduce conflict in state 53 on "DOT" with rule 536

PrimaryNoNewArray ::= .Type DOT class 
Type ::= .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= TypeName  .TypeArgumentsopt 
TypeArgumentsopt ::= . (536)

GJavaParser.g:234:15:234:26:6037:6048: Warning: Shift/reduce conflict in state 53 on "DOT" with rule 29

PrimaryNoNewArray ::= .ClassName DOT this 
ClassName ::= TypeName . (29)




STATE 54 -----------------------------------------------------------------------
( 29 )

TypeName ::= identifier . (27)
TypeVariable ::= identifier . (30)
ExpressionName ::= identifier . (47)
MethodName ::= identifier . (49)
AmbiguousName ::= identifier . (53)
SimpleName ::= identifier . (236)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 54 on "LESS" between rule 27 and rule 47 starting at line 275, column 20

ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
RelationalExpression ::= .RelationalExpression LESS ShiftExpression 
RelationalExpression ::= .ShiftExpression 
ShiftExpression ::= .AdditiveExpression 
AdditiveExpression ::= .MultiplicativeExpression 
MultiplicativeExpression ::= .UnaryExpression 
UnaryExpression ::= .UnaryExpressionNotPlusMinus 
UnaryExpressionNotPlusMinus ::= .PostfixExpression 
PostfixExpression ::= .ExpressionName 
ExpressionName ::= identifier . (47)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 54 on "LBRACKET" between rule 27 and rule 47 starting at line 275, column 20

ArrayType ::= .Type LBRACKET RBRACKET 
Type ::= .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
ArrayAccess ::= .ExpressionName LBRACKET Expression RBRACKET 
ExpressionName ::= identifier . (47)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 54 on "LBRACKET" between rule 27 and rule 30 starting at line 236, column 18

ArrayType ::= .Type LBRACKET RBRACKET 
Type ::= .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
ArrayType ::= .Type LBRACKET RBRACKET 
Type ::= .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 54 on "DOT" between rule 27 and rule 53 starting at line 284, column 19

PrimaryNoNewArray ::= .Type DOT class 
Type ::= .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
ExpressionName ::= .AmbiguousName DOT identifier 
AmbiguousName ::= identifier . (53)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 54 on "DOT" between rule 27 and rule 30 starting at line 236, column 18

PrimaryNoNewArray ::= .Type DOT class 
Type ::= .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
PrimaryNoNewArray ::= .Type DOT class 
Type ::= .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)




STATE 55 -----------------------------------------------------------------------
( 29 42 43 44 57 58 59 61 62 79 85 87 99 107 108 109 111 112 113 114 115 117 
  118 119 120 121 122 123 124 125 135 152 157 161 163 171 191 201 204 206 209 
  234 235 237 242 261 272 276 292 293 298 307 309 312 314 320 332 346 351 353 
  354 355 356 362 366 375 387 396 399 400 401 402 403 427 428 434 435 437 438 
  439 440 441 442 443 453 459 462 463 464 465 470 471 473 )

ClassInstanceCreationExpression ::= new  .TypeArgumentsopt ClassOrInterfaceType 
                                    TypeArgumentsopt LPAREN ArgumentListopt 
                                    RPAREN ClassBodyopt 
ArrayCreationExpression ::= new  .PrimitiveType DimExprs Dimsopt 
ArrayCreationExpression ::= new  .ClassOrInterfaceType DimExprs Dimsopt 
ArrayCreationExpression ::= new  .PrimitiveType Dims ArrayInitializer 
ArrayCreationExpression ::= new  .ClassOrInterfaceType Dims ArrayInitializer 

identifier ::= .IDENTIFIER 
PrimitiveType ::= .NumericType 
PrimitiveType ::= .boolean 
NumericType ::= .IntegralType 
NumericType ::= .FloatingPointType 
IntegralType ::= .byte 
IntegralType ::= .short 
IntegralType ::= .int 
IntegralType ::= .long 
IntegralType ::= .char 
FloatingPointType ::= .float 
FloatingPointType ::= .double 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= .identifier 
TypeName ::= .TypeName DOT identifier 
TypeArguments ::= .LESS ActualTypeArgumentList GREATER 
TypeArgumentsopt ::= . (536)
TypeArgumentsopt ::= .TypeArguments 

GJavaParser.g:1088:22:1088:31:34116:34125: Warning: Shift/reduce conflict in state 55 on "IDENTIFIER" with rule 536

ClassInstanceCreationExpression ::= new  .TypeArgumentsopt ClassOrInterfaceType 
                                    TypeArgumentsopt LPAREN ArgumentListopt 
                                    RPAREN ClassBodyopt 
TypeArgumentsopt ::= . (536)




STATE 64 -----------------------------------------------------------------------
( 29 42 57 79 85 87 99 114 115 120 121 122 123 124 125 135 152 161 191 201 209 
  234 235 237 242 261 272 292 293 298 307 309 314 320 346 351 354 355 362 375 
  396 401 402 427 428 434 439 440 459 462 )

ShiftExpression ::= ShiftExpression  .LEFT_SHIFT AdditiveExpression 
ShiftExpression ::= ShiftExpression  .GREATER GREATER AdditiveExpression 
ShiftExpression ::= ShiftExpression  .GREATER GREATER GREATER 
                    AdditiveExpression 
RelationalExpression ::= ShiftExpression . (405)

GJavaParser.g:895:26:895:44:28514:28532: Warning: Shift/reduce conflict in state 64 on "GREATER" with rule 405

RelationalExpression ::= .RelationalExpression GREATER ShiftExpression 
RelationalExpression ::= ShiftExpression . (405)




STATE 67 -----------------------------------------------------------------------
( 29 42 57 79 85 87 99 120 121 122 123 124 125 135 152 161 191 201 209 234 235 
  237 242 261 272 292 293 298 307 309 314 320 346 351 354 355 362 375 396 401 
  402 427 428 434 439 440 459 462 )

RelationalExpression ::= RelationalExpression  .LESS ShiftExpression 
RelationalExpression ::= RelationalExpression  .GREATER ShiftExpression 
RelationalExpression ::= RelationalExpression  .LESS_EQUAL ShiftExpression 
RelationalExpression ::= RelationalExpression  .GREATER EQUAL ShiftExpression 
RelationalExpression ::= RelationalExpression  .instanceof ReferenceType 
EqualityExpression ::= RelationalExpression . (411)

GJavaParser.g:902:24:902:47:28912:28935: Warning: Shift/reduce conflict in state 67 on "LESS" with rule 411

InterfaceMemberDeclarations ::= .InterfaceMemberDeclarations 
                                InterfaceMemberDeclaration 
InterfaceMemberDeclarations ::= .InterfaceMemberDeclaration 
InterfaceMemberDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= RelationalExpression . (411)




STATE 82 -----------------------------------------------------------------------
( 42 43 44 57 58 59 61 62 79 85 87 99 107 108 109 111 112 113 114 115 117 118 
  119 120 121 122 123 124 125 135 152 157 161 163 171 191 201 204 206 209 234 
  235 237 242 261 272 292 293 298 307 309 314 320 346 351 354 355 356 362 366 
  375 396 401 402 403 427 428 438 439 440 443 459 462 470 )

TypeName ::= identifier . (27)
TypeVariable ::= identifier . (30)
ExpressionName ::= identifier . (47)
MethodName ::= identifier . (49)
AmbiguousName ::= identifier . (53)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 82 on "LESS" between rule 27 and rule 47 starting at line 275, column 20

ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
RelationalExpression ::= .RelationalExpression LESS ShiftExpression 
RelationalExpression ::= .ShiftExpression 
ShiftExpression ::= .AdditiveExpression 
AdditiveExpression ::= .MultiplicativeExpression 
MultiplicativeExpression ::= .UnaryExpression 
UnaryExpression ::= .UnaryExpressionNotPlusMinus 
UnaryExpressionNotPlusMinus ::= .PostfixExpression 
PostfixExpression ::= .ExpressionName 
ExpressionName ::= identifier . (47)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 82 on "LBRACKET" between rule 27 and rule 47 starting at line 275, column 20

ArrayType ::= .Type LBRACKET RBRACKET 
Type ::= .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
ArrayAccess ::= .ExpressionName LBRACKET Expression RBRACKET 
ExpressionName ::= identifier . (47)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 82 on "LBRACKET" between rule 27 and rule 30 starting at line 236, column 18

ArrayType ::= .Type LBRACKET RBRACKET 
Type ::= .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
ArrayType ::= .Type LBRACKET RBRACKET 
Type ::= .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 82 on "RPAREN" between rule 27 and rule 47 starting at line 275, column 20

CastExpression ::= LPAREN  .ReferenceType RPAREN UnaryExpressionNotPlusMinus 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
SingleElementAnnotation ::= AT TypeName LPAREN  .ElementValue RPAREN 
ElementValue ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= .InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= .ShiftExpression 
ShiftExpression ::= .AdditiveExpression 
AdditiveExpression ::= .MultiplicativeExpression 
MultiplicativeExpression ::= .UnaryExpression 
UnaryExpression ::= MINUS  .UnaryExpression 
UnaryExpression ::= .UnaryExpressionNotPlusMinus 
UnaryExpressionNotPlusMinus ::= .PostfixExpression 
PostfixExpression ::= .ExpressionName 
ExpressionName ::= identifier . (47)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 82 on "RPAREN" between rule 27 and rule 30 starting at line 236, column 18

CastExpression ::= LPAREN  .ReferenceType RPAREN UnaryExpressionNotPlusMinus 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
CastExpression ::= LPAREN  .ReferenceType RPAREN UnaryExpressionNotPlusMinus 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 82 on "DOT" between rule 27 and rule 53 starting at line 284, column 19

PrimaryNoNewArray ::= .Type DOT class 
Type ::= .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
ExpressionName ::= .AmbiguousName DOT identifier 
AmbiguousName ::= identifier . (53)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 82 on "DOT" between rule 27 and rule 30 starting at line 236, column 18

PrimaryNoNewArray ::= .Type DOT class 
Type ::= .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
PrimaryNoNewArray ::= .Type DOT class 
Type ::= .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)




STATE 83 -----------------------------------------------------------------------
( 42 )

ElementValues ::= ElementValues  .COMMA ElementValue 
ElementValuesopt ::= ElementValues . (467)

GJavaParser.g:984:24:984:38:31402:31416: Warning: Shift/reduce conflict in state 83 on "COMMA" with rule 467

ElementValueArrayInitializer ::= LBRACE  .ElementValuesopt Commaopt RBRACE 
ElementValuesopt ::= ElementValues . (467)




STATE 89 -----------------------------------------------------------------------
( 50 )

FieldAccess ::= super DOT  .identifier 
MethodInvocation ::= super DOT  .TypeArgumentsopt identifier LPAREN 
                     ArgumentListopt RPAREN 

identifier ::= .IDENTIFIER 
TypeArguments ::= .LESS ActualTypeArgumentList GREATER 
TypeArgumentsopt ::= . (536)
TypeArgumentsopt ::= .TypeArguments 

GJavaParser.g:1088:22:1088:31:34116:34125: Warning: Shift/reduce conflict in state 89 on "IDENTIFIER" with rule 536

MethodInvocation ::= super DOT  .TypeArgumentsopt identifier LPAREN 
                     ArgumentListopt RPAREN 
TypeArgumentsopt ::= . (536)




STATE 90 -----------------------------------------------------------------------
( 51 )

ClassInstanceCreationExpression ::= Primary DOT  .new TypeArgumentsopt 
                                    identifier TypeArgumentsopt LPAREN 
                                    ArgumentListopt RPAREN ClassBodyopt 
FieldAccess ::= Primary DOT  .identifier 
MethodInvocation ::= Primary DOT  .TypeArgumentsopt identifier LPAREN 
                     ArgumentListopt RPAREN 

identifier ::= .IDENTIFIER 
TypeArguments ::= .LESS ActualTypeArgumentList GREATER 
TypeArgumentsopt ::= . (536)
TypeArgumentsopt ::= .TypeArguments 

GJavaParser.g:1088:22:1088:31:34116:34125: Warning: Shift/reduce conflict in state 90 on "IDENTIFIER" with rule 536

MethodInvocation ::= Primary DOT  .TypeArgumentsopt identifier LPAREN 
                     ArgumentListopt RPAREN 
TypeArgumentsopt ::= . (536)




STATE 98 -----------------------------------------------------------------------
( 55 94 97 116 190 197 198 199 211 217 227 266 277 326 335 342 381 385 391 412 )

ClassType ::= TypeName  .TypeArgumentsopt 
TypeName ::= TypeName  .DOT identifier 

TypeArguments ::= .LESS ActualTypeArgumentList GREATER 
TypeArgumentsopt ::= . (536)
TypeArgumentsopt ::= .TypeArguments 

GJavaParser.g:1088:22:1088:31:34116:34125: Warning: Shift/reduce conflict in state 98 on "LESS" with rule 536

ClassInstanceCreationExpression ::= new TypeArgumentsopt  .ClassOrInterfaceType 
                                    TypeArgumentsopt LPAREN ArgumentListopt 
                                    RPAREN ClassBodyopt 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= TypeName  .TypeArgumentsopt 
TypeArgumentsopt ::= . (536)




STATE 102 ----------------------------------------------------------------------
( 57 )

Type ::= PrimitiveType . (8)
CastExpression ::= LPAREN PrimitiveType  .Dimsopt RPAREN UnaryExpression 

Dims ::= .LBRACKET RBRACKET 
Dims ::= .Dims LBRACKET RBRACKET 
Dimsopt ::= . (446)
Dimsopt ::= .Dims 

GJavaParser.g:199:10:199:26:5236:5252: Warning: Shift/reduce conflict in state 102 on "LBRACKET" with rule 8

ArrayType ::= .Type LBRACKET RBRACKET 
Type ::= PrimitiveType . (8)




STATE 104 ----------------------------------------------------------------------
( 57 85 87 99 124 152 161 191 201 234 235 237 242 261 272 276 292 293 298 307 
  309 312 314 320 332 346 351 353 354 355 356 375 387 396 399 400 401 402 403 
  427 428 434 435 437 438 439 440 441 442 443 453 459 462 463 464 465 470 471 
  473 )

PrimaryNoNewArray ::= ArrayAccess . (341)
LeftHandSide ::= ArrayAccess . (431)

GJavaParser.g:788:25:788:37:24228:24240: Warning: Reduce/reduce conflict in state 104 on "GREATER" between rule 341 and rule 431 starting at line 931, column 20

ShiftExpression ::= .ShiftExpression GREATER GREATER AdditiveExpression 
ShiftExpression ::= .AdditiveExpression 
AdditiveExpression ::= .MultiplicativeExpression 
MultiplicativeExpression ::= .UnaryExpression 
UnaryExpression ::= .UnaryExpressionNotPlusMinus 
UnaryExpressionNotPlusMinus ::= .PostfixExpression 
PostfixExpression ::= .Primary 
Primary ::= .PrimaryNoNewArray 
PrimaryNoNewArray ::= ArrayAccess . (341)
------------------------------------------------------------------------------
Assignment ::= .LeftHandSide AssignmentOperator AssignmentExpression 
LeftHandSide ::= ArrayAccess . (431)




STATE 105 ----------------------------------------------------------------------
( 57 85 87 99 124 152 161 191 201 234 235 237 242 261 272 276 292 293 298 307 
  309 312 314 320 332 346 351 353 354 355 356 375 387 396 399 400 401 402 403 
  427 428 434 435 437 438 439 440 441 442 443 453 459 462 463 464 465 470 471 
  473 )

PrimaryNoNewArray ::= FieldAccess . (339)
LeftHandSide ::= FieldAccess . (430)

GJavaParser.g:786:25:786:37:24147:24159: Warning: Reduce/reduce conflict in state 105 on "GREATER" between rule 339 and rule 430 starting at line 930, column 20

ShiftExpression ::= .ShiftExpression GREATER GREATER AdditiveExpression 
ShiftExpression ::= .AdditiveExpression 
AdditiveExpression ::= .MultiplicativeExpression 
MultiplicativeExpression ::= .UnaryExpression 
UnaryExpression ::= .UnaryExpressionNotPlusMinus 
UnaryExpressionNotPlusMinus ::= .PostfixExpression 
PostfixExpression ::= .Primary 
Primary ::= .PrimaryNoNewArray 
PrimaryNoNewArray ::= FieldAccess . (339)
------------------------------------------------------------------------------
Assignment ::= .LeftHandSide AssignmentOperator AssignmentExpression 
LeftHandSide ::= FieldAccess . (430)




STATE 106 ----------------------------------------------------------------------
( 57 85 87 99 124 152 161 191 201 234 235 237 242 261 272 276 292 293 298 307 
  309 312 314 320 332 346 351 353 354 355 356 375 387 396 399 400 401 402 403 
  427 428 434 435 437 438 439 440 441 442 443 453 459 462 463 464 465 470 471 
  473 )

ArrayAccess ::= ExpressionName  .LBRACKET Expression RBRACKET 
PostfixExpression ::= ExpressionName . (376)
LeftHandSide ::= ExpressionName . (429)

GJavaParser.g:855:25:855:40:26820:26835: Warning: Reduce/reduce conflict in state 106 on "GREATER" between rule 376 and rule 429 starting at line 929, column 18

ShiftExpression ::= .ShiftExpression GREATER GREATER AdditiveExpression 
ShiftExpression ::= .AdditiveExpression 
AdditiveExpression ::= .MultiplicativeExpression 
MultiplicativeExpression ::= .UnaryExpression 
UnaryExpression ::= .UnaryExpressionNotPlusMinus 
UnaryExpressionNotPlusMinus ::= .PostfixExpression 
PostfixExpression ::= ExpressionName . (376)
------------------------------------------------------------------------------
Assignment ::= .LeftHandSide AssignmentOperator AssignmentExpression 
LeftHandSide ::= ExpressionName . (429)




STATE 147 ----------------------------------------------------------------------
( 94 116 197 198 199 211 217 266 277 326 335 342 381 385 391 412 )

TypeName ::= identifier . (27)
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 147 on "IDENTIFIER" between rule 27 and rule 30 starting at line 236, column 18

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 147 on "void" between rule 27 and rule 30 starting at line 236, column 18

InterfaceMemberDeclarations ::= .InterfaceMemberDeclarations 
                                InterfaceMemberDeclaration 
InterfaceMemberDeclarations ::= .InterfaceMemberDeclaration 
InterfaceMemberDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
InterfaceMemberDeclarations ::= .InterfaceMemberDeclarations 
                                InterfaceMemberDeclaration 
InterfaceMemberDeclarations ::= .InterfaceMemberDeclaration 
InterfaceMemberDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 147 on "strictfp" between rule 27 and rule 30 starting at line 236, column 18

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 147 on "static" between rule 27 and rule 30 starting at line 236, column 18

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 147 on "short" between rule 27 and rule 30 starting at line 236, column 18

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 147 on "public" between rule 27 and rule 30 starting at line 236, column 18

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 147 on "protected" between rule 27 and rule 30 starting at line 236, column 18

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 147 on "private" between rule 27 and rule 30 starting at line 236, column 18

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 147 on "long" between rule 27 and rule 30 starting at line 236, column 18

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 147 on "interface" between rule 27 and rule 30 starting at line 236, column 18

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 147 on "int" between rule 27 and rule 30 starting at line 236, column 18

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 147 on "instanceof" between rule 27 and rule 30 starting at line 236, column 18

RelationalExpression ::= .RelationalExpression instanceof ReferenceType 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
RelationalExpression ::= .RelationalExpression instanceof ReferenceType 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 147 on "float" between rule 27 and rule 30 starting at line 236, column 18

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 147 on "final" between rule 27 and rule 30 starting at line 236, column 18

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 147 on "enum" between rule 27 and rule 30 starting at line 236, column 18

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 147 on "double" between rule 27 and rule 30 starting at line 236, column 18

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 147 on "class" between rule 27 and rule 30 starting at line 236, column 18

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 147 on "char" between rule 27 and rule 30 starting at line 236, column 18

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 147 on "byte" between rule 27 and rule 30 starting at line 236, column 18

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 147 on "boolean" between rule 27 and rule 30 starting at line 236, column 18

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 147 on "abstract" between rule 27 and rule 30 starting at line 236, column 18

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 147 on "ELLIPSIS" between rule 27 and rule 30 starting at line 236, column 18

LastFormalParameter ::= VariableModifiersopt  .Type Ellipsisopt 
                        VariableDeclaratorId 
Type ::= .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
LastFormalParameter ::= VariableModifiersopt  .Type Ellipsisopt 
                        VariableDeclaratorId 
Type ::= .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 147 on "GREATER" between rule 27 and rule 30 starting at line 236, column 18

TypeArguments ::= LESS  .ActualTypeArgumentList GREATER 
ActualTypeArgumentList ::= .ActualTypeArgument 
ActualTypeArgument ::= .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
TypeArguments ::= LESS  .ActualTypeArgumentList GREATER 
ActualTypeArgumentList ::= .ActualTypeArgument 
ActualTypeArgument ::= .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 147 on "EQUAL_EQUAL" between rule 27 and rule 30 starting at line 236, column 18

EqualityExpression ::= .EqualityExpression EQUAL_EQUAL RelationalExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
EqualityExpression ::= .EqualityExpression EQUAL_EQUAL RelationalExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 147 on "LESS_EQUAL" between rule 27 and rule 30 starting at line 236, column 18

RelationalExpression ::= .RelationalExpression LESS_EQUAL ShiftExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
RelationalExpression ::= .RelationalExpression LESS_EQUAL ShiftExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 147 on "LESS" between rule 27 and rule 30 starting at line 236, column 18

ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
RelationalExpression ::= .RelationalExpression LESS ShiftExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 147 on "RBRACE" between rule 27 and rule 30 starting at line 236, column 18

ElementValueArrayInitializer ::= LBRACE  .ElementValuesopt Commaopt RBRACE 
ElementValuesopt ::= .ElementValues 
ElementValues ::= .ElementValue 
ElementValue ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= .InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
ElementValueArrayInitializer ::= LBRACE  .ElementValuesopt Commaopt RBRACE 
ElementValuesopt ::= .ElementValues 
ElementValues ::= .ElementValue 
ElementValue ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= .InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 147 on "OR_OR" between rule 27 and rule 30 starting at line 236, column 18

ConditionalOrExpression ::= .ConditionalOrExpression OR_OR 
                            ConditionalAndExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= .InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
ConditionalOrExpression ::= .ConditionalOrExpression OR_OR 
                            ConditionalAndExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= .InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 147 on "LBRACE" between rule 27 and rule 30 starting at line 236, column 18

ConstructorDeclaration ::= ConstructorModifiersopt ConstructorDeclarator  .
                           Throwsopt ConstructorBody 
Throwsopt ::= .Throws 
Throws ::= throws  .ExceptionTypeList 
ExceptionTypeList ::= .ExceptionType 
ExceptionType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
ConstructorDeclaration ::= ConstructorModifiersopt ConstructorDeclarator  .
                           Throwsopt ConstructorBody 
Throwsopt ::= .Throws 
Throws ::= throws  .ExceptionTypeList 
ExceptionTypeList ::= .ExceptionType 
ExceptionType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 147 on "XOR" between rule 27 and rule 30 starting at line 236, column 18

ExclusiveOrExpression ::= .ExclusiveOrExpression XOR AndExpression 
ExclusiveOrExpression ::= .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
ExclusiveOrExpression ::= .ExclusiveOrExpression XOR AndExpression 
ExclusiveOrExpression ::= .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 147 on "RBRACKET" between rule 27 and rule 30 starting at line 236, column 18

ArrayAccess ::= ExpressionName LBRACKET  .Expression RBRACKET 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= .InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
ArrayAccess ::= ExpressionName LBRACKET  .Expression RBRACKET 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= .InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 147 on "LBRACKET" between rule 27 and rule 30 starting at line 236, column 18

ArrayType ::= .Type LBRACKET RBRACKET 
Type ::= .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
ArrayType ::= .Type LBRACKET RBRACKET 
Type ::= .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 147 on "AT" between rule 27 and rule 30 starting at line 236, column 18

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 147 on "QUESTION" between rule 27 and rule 30 starting at line 236, column 18

ConditionalExpression ::= .ConditionalOrExpression QUESTION Expression COLON 
                          ConditionalExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= .InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
ConditionalExpression ::= .ConditionalOrExpression QUESTION Expression COLON 
                          ConditionalExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= .InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 147 on "SEMICOLON" between rule 27 and rule 30 starting at line 236, column 18

ExpressionStatement ::= .StatementExpression SEMICOLON 
StatementExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
ExpressionStatement ::= .StatementExpression SEMICOLON 
StatementExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 147 on "COLON" between rule 27 and rule 30 starting at line 236, column 18

ConditionalExpression ::= ConditionalOrExpression QUESTION  .Expression COLON 
                          ConditionalExpression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
ConditionalExpression ::= ConditionalOrExpression QUESTION  .Expression COLON 
                          ConditionalExpression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 147 on "COMMA" between rule 27 and rule 30 starting at line 236, column 18

ActualTypeArgumentList ::= .ActualTypeArgumentList COMMA ActualTypeArgument 
ActualTypeArgumentList ::= .ActualTypeArgument 
ActualTypeArgument ::= .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
ActualTypeArgumentList ::= .ActualTypeArgumentList COMMA ActualTypeArgument 
ActualTypeArgumentList ::= .ActualTypeArgument 
ActualTypeArgument ::= .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 147 on "RPAREN" between rule 27 and rule 30 starting at line 236, column 18

SingleElementAnnotation ::= AT TypeName LPAREN  .ElementValue RPAREN 
ElementValue ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= .InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
SingleElementAnnotation ::= AT TypeName LPAREN  .ElementValue RPAREN 
ElementValue ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= .InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 147 on "AND_AND" between rule 27 and rule 30 starting at line 236, column 18

ConditionalAndExpression ::= .ConditionalAndExpression AND_AND 
                             InclusiveOrExpression 
ConditionalAndExpression ::= .InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
ConditionalAndExpression ::= .ConditionalAndExpression AND_AND 
                             InclusiveOrExpression 
ConditionalAndExpression ::= .InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 147 on "AND" between rule 27 and rule 30 starting at line 236, column 18

AndExpression ::= .AndExpression AND EqualityExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
AndExpression ::= .AndExpression AND EqualityExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 147 on "NOT_EQUAL" between rule 27 and rule 30 starting at line 236, column 18

EqualityExpression ::= .EqualityExpression NOT_EQUAL RelationalExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
EqualityExpression ::= .EqualityExpression NOT_EQUAL RelationalExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 147 on "OR" between rule 27 and rule 30 starting at line 236, column 18

InclusiveOrExpression ::= .InclusiveOrExpression OR ExclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
InclusiveOrExpression ::= .InclusiveOrExpression OR ExclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= RelationalExpression instanceof  .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)




STATE 167 ----------------------------------------------------------------------
( 114 )

RelationalExpression ::= RelationalExpression  .LESS ShiftExpression 
RelationalExpression ::= RelationalExpression  .GREATER ShiftExpression 
RelationalExpression ::= RelationalExpression  .LESS_EQUAL ShiftExpression 
RelationalExpression ::= RelationalExpression  .GREATER EQUAL ShiftExpression 
RelationalExpression ::= RelationalExpression  .instanceof ReferenceType 
EqualityExpression ::= EqualityExpression NOT_EQUAL RelationalExpression .
                        (413)

GJavaParser.g:904:26:904:69:29032:29075: Warning: Shift/reduce conflict in state 167 on "LESS" with rule 413

InterfaceMemberDeclarations ::= .InterfaceMemberDeclarations 
                                InterfaceMemberDeclaration 
InterfaceMemberDeclarations ::= .InterfaceMemberDeclaration 
InterfaceMemberDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= EqualityExpression NOT_EQUAL RelationalExpression .
                        (413)




STATE 168 ----------------------------------------------------------------------
( 115 )

RelationalExpression ::= RelationalExpression  .LESS ShiftExpression 
RelationalExpression ::= RelationalExpression  .GREATER ShiftExpression 
RelationalExpression ::= RelationalExpression  .LESS_EQUAL ShiftExpression 
RelationalExpression ::= RelationalExpression  .GREATER EQUAL ShiftExpression 
RelationalExpression ::= RelationalExpression  .instanceof ReferenceType 
EqualityExpression ::= EqualityExpression EQUAL_EQUAL RelationalExpression .
                        (412)

GJavaParser.g:903:26:903:69:28962:29005: Warning: Shift/reduce conflict in state 168 on "LESS" with rule 412

InterfaceMemberDeclarations ::= .InterfaceMemberDeclarations 
                                InterfaceMemberDeclaration 
InterfaceMemberDeclarations ::= .InterfaceMemberDeclaration 
InterfaceMemberDeclaration ::= .ConstantDeclaration 
ConstantDeclaration ::= ConstantModifiersopt Type  .VariableDeclarators 
VariableDeclarators ::= .VariableDeclarator 
VariableDeclarator ::= VariableDeclaratorId EQUAL  .VariableInitializer 
VariableInitializer ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= LeftHandSide AssignmentOperator  .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= ConditionalAndExpression AND_AND  .
                             InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= ExclusiveOrExpression XOR  .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= EqualityExpression EQUAL_EQUAL RelationalExpression .
                        (412)




STATE 170 ----------------------------------------------------------------------
( 117 )

ShiftExpression ::= ShiftExpression  .LEFT_SHIFT AdditiveExpression 
ShiftExpression ::= ShiftExpression  .GREATER GREATER AdditiveExpression 
ShiftExpression ::= ShiftExpression  .GREATER GREATER GREATER 
                    AdditiveExpression 
RelationalExpression ::= RelationalExpression LESS_EQUAL ShiftExpression .
                          (408)

GJavaParser.g:898:28:898:68:28697:28737: Warning: Shift/reduce conflict in state 170 on "GREATER" with rule 408

RelationalExpression ::= .RelationalExpression GREATER ShiftExpression 
RelationalExpression ::= RelationalExpression LESS_EQUAL ShiftExpression .
                          (408)




STATE 172 ----------------------------------------------------------------------
( 118 )

ShiftExpression ::= ShiftExpression  .LEFT_SHIFT AdditiveExpression 
ShiftExpression ::= ShiftExpression  .GREATER GREATER AdditiveExpression 
ShiftExpression ::= ShiftExpression  .GREATER GREATER GREATER 
                    AdditiveExpression 
RelationalExpression ::= RelationalExpression GREATER ShiftExpression . (407)

GJavaParser.g:897:28:897:67:28629:28668: Warning: Shift/reduce conflict in state 172 on "GREATER" with rule 407

RelationalExpression ::= .RelationalExpression GREATER ShiftExpression 
RelationalExpression ::= RelationalExpression GREATER ShiftExpression . (407)




STATE 173 ----------------------------------------------------------------------
( 119 )

ShiftExpression ::= ShiftExpression  .LEFT_SHIFT AdditiveExpression 
ShiftExpression ::= ShiftExpression  .GREATER GREATER AdditiveExpression 
ShiftExpression ::= ShiftExpression  .GREATER GREATER GREATER 
                    AdditiveExpression 
RelationalExpression ::= RelationalExpression LESS ShiftExpression . (406)

GJavaParser.g:896:28:896:67:28561:28600: Warning: Shift/reduce conflict in state 173 on "GREATER" with rule 406

RelationalExpression ::= .RelationalExpression GREATER ShiftExpression 
RelationalExpression ::= RelationalExpression LESS ShiftExpression . (406)




STATE 180 ----------------------------------------------------------------------
( 126 )

AnnotationTypeBody ::= LBRACE  .AnnotationTypeElementDeclarationsopt RBRACE 

ClassDeclaration ::= .NormalClassDeclaration 
ClassDeclaration ::= .EnumDeclaration 
NormalClassDeclaration ::= .ClassModifiersopt class identifier 
                           TypeParametersopt Superopt Interfacesopt ClassBody 
ClassModifiers ::= .ClassModifier 
ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifier ::= .Annotation 
ClassModifier ::= .public 
ClassModifier ::= .protected 
ClassModifier ::= .private 
ClassModifier ::= .abstract 
ClassModifier ::= .static 
ClassModifier ::= .final 
ClassModifier ::= .strictfp 
EnumDeclaration ::= .ClassModifiersopt enum identifier Interfacesopt EnumBody 
InterfaceDeclaration ::= .NormalInterfaceDeclaration 
InterfaceDeclaration ::= .AnnotationTypeDeclaration 
NormalInterfaceDeclaration ::= .InterfaceModifiersopt interface identifier 
                               TypeParametersopt ExtendsInterfacesopt 
                               InterfaceBody 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifier ::= .Annotation 
InterfaceModifier ::= .public 
InterfaceModifier ::= .protected 
InterfaceModifier ::= .private 
InterfaceModifier ::= .abstract 
InterfaceModifier ::= .static 
InterfaceModifier ::= .strictfp 
ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiers ::= .ConstantModifier 
ConstantModifiers ::= .ConstantModifiers ConstantModifier 
ConstantModifier ::= .Annotation 
ConstantModifier ::= .public 
ConstantModifier ::= .static 
ConstantModifier ::= .final 
AbstractMethodModifiers ::= .AbstractMethodModifier 
AbstractMethodModifiers ::= .AbstractMethodModifiers AbstractMethodModifier 
AbstractMethodModifier ::= .Annotations 
AbstractMethodModifier ::= .public 
AbstractMethodModifier ::= .abstract 
AnnotationTypeDeclaration ::= .InterfaceModifiersopt AT interface identifier 
                              AnnotationTypeBody 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .AbstractMethodModifiersopt Type 
                                     identifier LPAREN RPAREN DefaultValueopt 
                                     SEMICOLON 
AnnotationTypeElementDeclaration ::= .ConstantDeclaration 
AnnotationTypeElementDeclaration ::= .ClassDeclaration 
AnnotationTypeElementDeclaration ::= .InterfaceDeclaration 
AnnotationTypeElementDeclaration ::= .EnumDeclaration 
AnnotationTypeElementDeclaration ::= .AnnotationTypeDeclaration 
AnnotationTypeElementDeclaration ::= .SEMICOLON 
Annotations ::= .Annotation 
Annotations ::= .Annotations Annotation 
Annotation ::= .NormalAnnotation 
Annotation ::= .MarkerAnnotation 
Annotation ::= .SingleElementAnnotation 
NormalAnnotation ::= .AT TypeName LPAREN ElementValuePairsopt RPAREN 
MarkerAnnotation ::= .AT TypeName 
SingleElementAnnotation ::= .AT TypeName LPAREN ElementValue RPAREN 
AnnotationTypeElementDeclarationsopt ::= . (472)
AnnotationTypeElementDeclarationsopt ::= .AnnotationTypeElementDeclarations 
AbstractMethodModifiersopt ::= . (474)
AbstractMethodModifiersopt ::= .AbstractMethodModifiers 
ConstantModifiersopt ::= . (476)
ConstantModifiersopt ::= .ConstantModifiers 
InterfaceModifiersopt ::= . (482)
InterfaceModifiersopt ::= .InterfaceModifiers 
ClassModifiersopt ::= . (520)
ClassModifiersopt ::= .ClassModifiers 

GJavaParser.g:1007:27:1007:36:32114:32123: Warning: Shift/reduce conflict in state 180 on "AT" with rule 482

AnnotationTypeDeclaration ::= .InterfaceModifiersopt AT interface identifier 
                              AnnotationTypeBody 
InterfaceModifiersopt ::= . (482)

GJavaParser.g:995:32:995:41:31735:31744: Warning: Reduce/reduce conflict in state 180 on "IDENTIFIER" between rule 474 and rule 476 starting at line 998, column 26

AnnotationTypeElementDeclaration ::= .AbstractMethodModifiersopt Type 
                                     identifier LPAREN RPAREN DefaultValueopt 
                                     SEMICOLON 
AbstractMethodModifiersopt ::= . (474)
------------------------------------------------------------------------------
ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= . (476)

GJavaParser.g:995:32:995:41:31735:31744: Warning: Reduce/reduce conflict in state 180 on "short" between rule 474 and rule 476 starting at line 998, column 26

AnnotationTypeElementDeclaration ::= .AbstractMethodModifiersopt Type 
                                     identifier LPAREN RPAREN DefaultValueopt 
                                     SEMICOLON 
AbstractMethodModifiersopt ::= . (474)
------------------------------------------------------------------------------
ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= . (476)

GJavaParser.g:995:32:995:41:31735:31744: Warning: Reduce/reduce conflict in state 180 on "long" between rule 474 and rule 476 starting at line 998, column 26

AnnotationTypeElementDeclaration ::= .AbstractMethodModifiersopt Type 
                                     identifier LPAREN RPAREN DefaultValueopt 
                                     SEMICOLON 
AbstractMethodModifiersopt ::= . (474)
------------------------------------------------------------------------------
ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= . (476)

GJavaParser.g:995:32:995:41:31735:31744: Warning: Reduce/reduce conflict in state 180 on "int" between rule 474 and rule 476 starting at line 998, column 26

AnnotationTypeElementDeclaration ::= .AbstractMethodModifiersopt Type 
                                     identifier LPAREN RPAREN DefaultValueopt 
                                     SEMICOLON 
AbstractMethodModifiersopt ::= . (474)
------------------------------------------------------------------------------
ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= . (476)

GJavaParser.g:995:32:995:41:31735:31744: Warning: Reduce/reduce conflict in state 180 on "float" between rule 474 and rule 476 starting at line 998, column 26

AnnotationTypeElementDeclaration ::= .AbstractMethodModifiersopt Type 
                                     identifier LPAREN RPAREN DefaultValueopt 
                                     SEMICOLON 
AbstractMethodModifiersopt ::= . (474)
------------------------------------------------------------------------------
ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= . (476)

GJavaParser.g:995:32:995:41:31735:31744: Warning: Reduce/reduce conflict in state 180 on "double" between rule 474 and rule 476 starting at line 998, column 26

AnnotationTypeElementDeclaration ::= .AbstractMethodModifiersopt Type 
                                     identifier LPAREN RPAREN DefaultValueopt 
                                     SEMICOLON 
AbstractMethodModifiersopt ::= . (474)
------------------------------------------------------------------------------
ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= . (476)

GJavaParser.g:995:32:995:41:31735:31744: Warning: Reduce/reduce conflict in state 180 on "char" between rule 474 and rule 476 starting at line 998, column 26

AnnotationTypeElementDeclaration ::= .AbstractMethodModifiersopt Type 
                                     identifier LPAREN RPAREN DefaultValueopt 
                                     SEMICOLON 
AbstractMethodModifiersopt ::= . (474)
------------------------------------------------------------------------------
ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= . (476)

GJavaParser.g:995:32:995:41:31735:31744: Warning: Reduce/reduce conflict in state 180 on "byte" between rule 474 and rule 476 starting at line 998, column 26

AnnotationTypeElementDeclaration ::= .AbstractMethodModifiersopt Type 
                                     identifier LPAREN RPAREN DefaultValueopt 
                                     SEMICOLON 
AbstractMethodModifiersopt ::= . (474)
------------------------------------------------------------------------------
ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= . (476)

GJavaParser.g:995:32:995:41:31735:31744: Warning: Reduce/reduce conflict in state 180 on "boolean" between rule 474 and rule 476 starting at line 998, column 26

AnnotationTypeElementDeclaration ::= .AbstractMethodModifiersopt Type 
                                     identifier LPAREN RPAREN DefaultValueopt 
                                     SEMICOLON 
AbstractMethodModifiersopt ::= . (474)
------------------------------------------------------------------------------
ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= . (476)




STATE 186 ----------------------------------------------------------------------
( 129 )

EnumBody ::= LBRACE  .EnumConstantsopt Commaopt EnumBodyDeclarationsopt RBRACE 

identifier ::= .IDENTIFIER 
EnumConstants ::= .EnumConstant 
EnumConstants ::= .EnumConstants COMMA EnumConstant 
EnumConstant ::= .Annotationsopt identifier Argumentsopt ClassBodyopt 
Annotations ::= .Annotation 
Annotations ::= .Annotations Annotation 
Annotation ::= .NormalAnnotation 
Annotation ::= .MarkerAnnotation 
Annotation ::= .SingleElementAnnotation 
NormalAnnotation ::= .AT TypeName LPAREN ElementValuePairsopt RPAREN 
MarkerAnnotation ::= .AT TypeName 
SingleElementAnnotation ::= .AT TypeName LPAREN ElementValue RPAREN 
EnumConstant ::= .identifier 
EnumConstantsopt ::= . (492)
EnumConstantsopt ::= .EnumConstants 
Annotationsopt ::= . (522)
Annotationsopt ::= .Annotations 

GJavaParser.g:1067:20:1067:29:33568:33577: Warning: Shift/reduce conflict in state 186 on "IDENTIFIER" with rule 522

EnumConstant ::= .Annotationsopt identifier Argumentsopt ClassBodyopt 
Annotationsopt ::= . (522)




STATE 192 ----------------------------------------------------------------------
( 140 )

FieldAccess ::= ClassName DOT super DOT  .identifier 
MethodInvocation ::= ClassName DOT super DOT  .TypeArgumentsopt identifier 
                     LPAREN ArgumentListopt RPAREN 

identifier ::= .IDENTIFIER 
TypeArguments ::= .LESS ActualTypeArgumentList GREATER 
TypeArgumentsopt ::= . (536)
TypeArgumentsopt ::= .TypeArguments 

GJavaParser.g:1088:22:1088:31:34116:34125: Warning: Shift/reduce conflict in state 192 on "IDENTIFIER" with rule 536

MethodInvocation ::= ClassName DOT super DOT  .TypeArgumentsopt identifier 
                     LPAREN ArgumentListopt RPAREN 
TypeArgumentsopt ::= . (536)




STATE 208 ----------------------------------------------------------------------
( 171 )

ShiftExpression ::= ShiftExpression  .LEFT_SHIFT AdditiveExpression 
ShiftExpression ::= ShiftExpression  .GREATER GREATER AdditiveExpression 
ShiftExpression ::= ShiftExpression  .GREATER GREATER GREATER 
                    AdditiveExpression 
RelationalExpression ::= RelationalExpression GREATER EQUAL ShiftExpression .
                          (409)

GJavaParser.g:899:28:899:69:28766:28807: Warning: Shift/reduce conflict in state 208 on "GREATER" with rule 409

RelationalExpression ::= .RelationalExpression GREATER ShiftExpression 
RelationalExpression ::= RelationalExpression GREATER EQUAL ShiftExpression .
                          (409)




STATE 212 ----------------------------------------------------------------------
( 180 223 )

InterfaceDeclaration ::= AnnotationTypeDeclaration . (181)
AnnotationTypeElementDeclaration ::= AnnotationTypeDeclaration . (224)

GJavaParser.g:497:28:497:54:14093:14119: Warning: Reduce/reduce conflict in state 212 on "IDENTIFIER" between rule 181 and rule 224 starting at line 562, column 40

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .InterfaceDeclaration 
InterfaceDeclaration ::= AnnotationTypeDeclaration . (181)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= AnnotationTypeDeclaration . (224)

GJavaParser.g:497:28:497:54:14093:14119: Warning: Reduce/reduce conflict in state 212 on "strictfp" between rule 181 and rule 224 starting at line 562, column 40

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .InterfaceDeclaration 
InterfaceDeclaration ::= AnnotationTypeDeclaration . (181)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= AnnotationTypeDeclaration . (224)

GJavaParser.g:497:28:497:54:14093:14119: Warning: Reduce/reduce conflict in state 212 on "static" between rule 181 and rule 224 starting at line 562, column 40

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .InterfaceDeclaration 
InterfaceDeclaration ::= AnnotationTypeDeclaration . (181)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= AnnotationTypeDeclaration . (224)

GJavaParser.g:497:28:497:54:14093:14119: Warning: Reduce/reduce conflict in state 212 on "short" between rule 181 and rule 224 starting at line 562, column 40

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .InterfaceDeclaration 
InterfaceDeclaration ::= AnnotationTypeDeclaration . (181)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= AnnotationTypeDeclaration . (224)

GJavaParser.g:497:28:497:54:14093:14119: Warning: Reduce/reduce conflict in state 212 on "public" between rule 181 and rule 224 starting at line 562, column 40

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .InterfaceDeclaration 
InterfaceDeclaration ::= AnnotationTypeDeclaration . (181)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= AnnotationTypeDeclaration . (224)

GJavaParser.g:497:28:497:54:14093:14119: Warning: Reduce/reduce conflict in state 212 on "protected" between rule 181 and rule 224 starting at line 562, column 40

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .InterfaceDeclaration 
InterfaceDeclaration ::= AnnotationTypeDeclaration . (181)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= AnnotationTypeDeclaration . (224)

GJavaParser.g:497:28:497:54:14093:14119: Warning: Reduce/reduce conflict in state 212 on "private" between rule 181 and rule 224 starting at line 562, column 40

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .InterfaceDeclaration 
InterfaceDeclaration ::= AnnotationTypeDeclaration . (181)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= AnnotationTypeDeclaration . (224)

GJavaParser.g:497:28:497:54:14093:14119: Warning: Reduce/reduce conflict in state 212 on "long" between rule 181 and rule 224 starting at line 562, column 40

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .InterfaceDeclaration 
InterfaceDeclaration ::= AnnotationTypeDeclaration . (181)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= AnnotationTypeDeclaration . (224)

GJavaParser.g:497:28:497:54:14093:14119: Warning: Reduce/reduce conflict in state 212 on "interface" between rule 181 and rule 224 starting at line 562, column 40

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .InterfaceDeclaration 
InterfaceDeclaration ::= AnnotationTypeDeclaration . (181)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= AnnotationTypeDeclaration . (224)

GJavaParser.g:497:28:497:54:14093:14119: Warning: Reduce/reduce conflict in state 212 on "int" between rule 181 and rule 224 starting at line 562, column 40

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .InterfaceDeclaration 
InterfaceDeclaration ::= AnnotationTypeDeclaration . (181)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= AnnotationTypeDeclaration . (224)

GJavaParser.g:497:28:497:54:14093:14119: Warning: Reduce/reduce conflict in state 212 on "float" between rule 181 and rule 224 starting at line 562, column 40

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .InterfaceDeclaration 
InterfaceDeclaration ::= AnnotationTypeDeclaration . (181)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= AnnotationTypeDeclaration . (224)

GJavaParser.g:497:28:497:54:14093:14119: Warning: Reduce/reduce conflict in state 212 on "final" between rule 181 and rule 224 starting at line 562, column 40

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .InterfaceDeclaration 
InterfaceDeclaration ::= AnnotationTypeDeclaration . (181)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= AnnotationTypeDeclaration . (224)

GJavaParser.g:497:28:497:54:14093:14119: Warning: Reduce/reduce conflict in state 212 on "enum" between rule 181 and rule 224 starting at line 562, column 40

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .InterfaceDeclaration 
InterfaceDeclaration ::= AnnotationTypeDeclaration . (181)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= AnnotationTypeDeclaration . (224)

GJavaParser.g:497:28:497:54:14093:14119: Warning: Reduce/reduce conflict in state 212 on "double" between rule 181 and rule 224 starting at line 562, column 40

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .InterfaceDeclaration 
InterfaceDeclaration ::= AnnotationTypeDeclaration . (181)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= AnnotationTypeDeclaration . (224)

GJavaParser.g:497:28:497:54:14093:14119: Warning: Reduce/reduce conflict in state 212 on "class" between rule 181 and rule 224 starting at line 562, column 40

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .InterfaceDeclaration 
InterfaceDeclaration ::= AnnotationTypeDeclaration . (181)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= AnnotationTypeDeclaration . (224)

GJavaParser.g:497:28:497:54:14093:14119: Warning: Reduce/reduce conflict in state 212 on "char" between rule 181 and rule 224 starting at line 562, column 40

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .InterfaceDeclaration 
InterfaceDeclaration ::= AnnotationTypeDeclaration . (181)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= AnnotationTypeDeclaration . (224)

GJavaParser.g:497:28:497:54:14093:14119: Warning: Reduce/reduce conflict in state 212 on "byte" between rule 181 and rule 224 starting at line 562, column 40

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .InterfaceDeclaration 
InterfaceDeclaration ::= AnnotationTypeDeclaration . (181)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= AnnotationTypeDeclaration . (224)

GJavaParser.g:497:28:497:54:14093:14119: Warning: Reduce/reduce conflict in state 212 on "boolean" between rule 181 and rule 224 starting at line 562, column 40

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .InterfaceDeclaration 
InterfaceDeclaration ::= AnnotationTypeDeclaration . (181)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= AnnotationTypeDeclaration . (224)

GJavaParser.g:497:28:497:54:14093:14119: Warning: Reduce/reduce conflict in state 212 on "abstract" between rule 181 and rule 224 starting at line 562, column 40

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .InterfaceDeclaration 
InterfaceDeclaration ::= AnnotationTypeDeclaration . (181)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= AnnotationTypeDeclaration . (224)

GJavaParser.g:497:28:497:54:14093:14119: Warning: Reduce/reduce conflict in state 212 on "RBRACE" between rule 181 and rule 224 starting at line 562, column 40

AnnotationTypeBody ::= LBRACE  .AnnotationTypeElementDeclarationsopt RBRACE 
AnnotationTypeElementDeclarationsopt ::= .AnnotationTypeElementDeclarations 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .InterfaceDeclaration 
InterfaceDeclaration ::= AnnotationTypeDeclaration . (181)
------------------------------------------------------------------------------
AnnotationTypeBody ::= LBRACE  .AnnotationTypeElementDeclarationsopt RBRACE 
AnnotationTypeElementDeclarationsopt ::= .AnnotationTypeElementDeclarations 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= AnnotationTypeDeclaration . (224)

GJavaParser.g:497:28:497:54:14093:14119: Warning: Reduce/reduce conflict in state 212 on "AT" between rule 181 and rule 224 starting at line 562, column 40

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .InterfaceDeclaration 
InterfaceDeclaration ::= AnnotationTypeDeclaration . (181)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= AnnotationTypeDeclaration . (224)

GJavaParser.g:497:28:497:54:14093:14119: Warning: Reduce/reduce conflict in state 212 on "SEMICOLON" between rule 181 and rule 224 starting at line 562, column 40

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .InterfaceDeclaration 
InterfaceDeclaration ::= AnnotationTypeDeclaration . (181)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= AnnotationTypeDeclaration . (224)




STATE 213 ----------------------------------------------------------------------
( 180 223 )

ClassDeclaration ::= EnumDeclaration . (73)
AnnotationTypeElementDeclaration ::= EnumDeclaration . (223)

GJavaParser.g:319:24:319:40:8428:8444: Warning: Reduce/reduce conflict in state 213 on "IDENTIFIER" between rule 73 and rule 223 starting at line 561, column 40

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ClassDeclaration 
ClassDeclaration ::= EnumDeclaration . (73)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= EnumDeclaration . (223)

GJavaParser.g:319:24:319:40:8428:8444: Warning: Reduce/reduce conflict in state 213 on "strictfp" between rule 73 and rule 223 starting at line 561, column 40

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ClassDeclaration 
ClassDeclaration ::= EnumDeclaration . (73)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= EnumDeclaration . (223)

GJavaParser.g:319:24:319:40:8428:8444: Warning: Reduce/reduce conflict in state 213 on "static" between rule 73 and rule 223 starting at line 561, column 40

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ClassDeclaration 
ClassDeclaration ::= EnumDeclaration . (73)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= EnumDeclaration . (223)

GJavaParser.g:319:24:319:40:8428:8444: Warning: Reduce/reduce conflict in state 213 on "short" between rule 73 and rule 223 starting at line 561, column 40

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ClassDeclaration 
ClassDeclaration ::= EnumDeclaration . (73)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= EnumDeclaration . (223)

GJavaParser.g:319:24:319:40:8428:8444: Warning: Reduce/reduce conflict in state 213 on "public" between rule 73 and rule 223 starting at line 561, column 40

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ClassDeclaration 
ClassDeclaration ::= EnumDeclaration . (73)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= EnumDeclaration . (223)

GJavaParser.g:319:24:319:40:8428:8444: Warning: Reduce/reduce conflict in state 213 on "protected" between rule 73 and rule 223 starting at line 561, column 40

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ClassDeclaration 
ClassDeclaration ::= EnumDeclaration . (73)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= EnumDeclaration . (223)

GJavaParser.g:319:24:319:40:8428:8444: Warning: Reduce/reduce conflict in state 213 on "private" between rule 73 and rule 223 starting at line 561, column 40

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ClassDeclaration 
ClassDeclaration ::= EnumDeclaration . (73)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= EnumDeclaration . (223)

GJavaParser.g:319:24:319:40:8428:8444: Warning: Reduce/reduce conflict in state 213 on "long" between rule 73 and rule 223 starting at line 561, column 40

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ClassDeclaration 
ClassDeclaration ::= EnumDeclaration . (73)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= EnumDeclaration . (223)

GJavaParser.g:319:24:319:40:8428:8444: Warning: Reduce/reduce conflict in state 213 on "interface" between rule 73 and rule 223 starting at line 561, column 40

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ClassDeclaration 
ClassDeclaration ::= EnumDeclaration . (73)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= EnumDeclaration . (223)

GJavaParser.g:319:24:319:40:8428:8444: Warning: Reduce/reduce conflict in state 213 on "int" between rule 73 and rule 223 starting at line 561, column 40

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ClassDeclaration 
ClassDeclaration ::= EnumDeclaration . (73)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= EnumDeclaration . (223)

GJavaParser.g:319:24:319:40:8428:8444: Warning: Reduce/reduce conflict in state 213 on "float" between rule 73 and rule 223 starting at line 561, column 40

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ClassDeclaration 
ClassDeclaration ::= EnumDeclaration . (73)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= EnumDeclaration . (223)

GJavaParser.g:319:24:319:40:8428:8444: Warning: Reduce/reduce conflict in state 213 on "final" between rule 73 and rule 223 starting at line 561, column 40

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ClassDeclaration 
ClassDeclaration ::= EnumDeclaration . (73)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= EnumDeclaration . (223)

GJavaParser.g:319:24:319:40:8428:8444: Warning: Reduce/reduce conflict in state 213 on "enum" between rule 73 and rule 223 starting at line 561, column 40

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ClassDeclaration 
ClassDeclaration ::= EnumDeclaration . (73)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= EnumDeclaration . (223)

GJavaParser.g:319:24:319:40:8428:8444: Warning: Reduce/reduce conflict in state 213 on "double" between rule 73 and rule 223 starting at line 561, column 40

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ClassDeclaration 
ClassDeclaration ::= EnumDeclaration . (73)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= EnumDeclaration . (223)

GJavaParser.g:319:24:319:40:8428:8444: Warning: Reduce/reduce conflict in state 213 on "class" between rule 73 and rule 223 starting at line 561, column 40

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ClassDeclaration 
ClassDeclaration ::= EnumDeclaration . (73)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= EnumDeclaration . (223)

GJavaParser.g:319:24:319:40:8428:8444: Warning: Reduce/reduce conflict in state 213 on "char" between rule 73 and rule 223 starting at line 561, column 40

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ClassDeclaration 
ClassDeclaration ::= EnumDeclaration . (73)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= EnumDeclaration . (223)

GJavaParser.g:319:24:319:40:8428:8444: Warning: Reduce/reduce conflict in state 213 on "byte" between rule 73 and rule 223 starting at line 561, column 40

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ClassDeclaration 
ClassDeclaration ::= EnumDeclaration . (73)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= EnumDeclaration . (223)

GJavaParser.g:319:24:319:40:8428:8444: Warning: Reduce/reduce conflict in state 213 on "boolean" between rule 73 and rule 223 starting at line 561, column 40

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ClassDeclaration 
ClassDeclaration ::= EnumDeclaration . (73)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= EnumDeclaration . (223)

GJavaParser.g:319:24:319:40:8428:8444: Warning: Reduce/reduce conflict in state 213 on "abstract" between rule 73 and rule 223 starting at line 561, column 40

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ClassDeclaration 
ClassDeclaration ::= EnumDeclaration . (73)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= EnumDeclaration . (223)

GJavaParser.g:319:24:319:40:8428:8444: Warning: Reduce/reduce conflict in state 213 on "RBRACE" between rule 73 and rule 223 starting at line 561, column 40

AnnotationTypeBody ::= LBRACE  .AnnotationTypeElementDeclarationsopt RBRACE 
AnnotationTypeElementDeclarationsopt ::= .AnnotationTypeElementDeclarations 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ClassDeclaration 
ClassDeclaration ::= EnumDeclaration . (73)
------------------------------------------------------------------------------
AnnotationTypeBody ::= LBRACE  .AnnotationTypeElementDeclarationsopt RBRACE 
AnnotationTypeElementDeclarationsopt ::= .AnnotationTypeElementDeclarations 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= EnumDeclaration . (223)

GJavaParser.g:319:24:319:40:8428:8444: Warning: Reduce/reduce conflict in state 213 on "AT" between rule 73 and rule 223 starting at line 561, column 40

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ClassDeclaration 
ClassDeclaration ::= EnumDeclaration . (73)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= EnumDeclaration . (223)

GJavaParser.g:319:24:319:40:8428:8444: Warning: Reduce/reduce conflict in state 213 on "SEMICOLON" between rule 73 and rule 223 starting at line 561, column 40

AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= .ClassDeclaration 
ClassDeclaration ::= EnumDeclaration . (73)
------------------------------------------------------------------------------
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclarations 
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarations ::= .AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclaration ::= EnumDeclaration . (223)




STATE 214 ----------------------------------------------------------------------
( 180 223 224 249 )

ClassModifier ::= final . (83)
ConstantModifier ::= final . (208)

GJavaParser.g:332:21:332:27:8859:8865: Warning: Reduce/reduce conflict in state 214 on "static" between rule 83 and rule 208 starting at line 539, column 24

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= final . (83)
------------------------------------------------------------------------------
ConstantModifiers ::= .ConstantModifiers ConstantModifier 
ConstantModifiers ::= .ConstantModifier 
ConstantModifier ::= final . (208)

GJavaParser.g:332:21:332:27:8859:8865: Warning: Reduce/reduce conflict in state 214 on "public" between rule 83 and rule 208 starting at line 539, column 24

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= final . (83)
------------------------------------------------------------------------------
ConstantModifiers ::= .ConstantModifiers ConstantModifier 
ConstantModifiers ::= .ConstantModifier 
ConstantModifier ::= final . (208)

GJavaParser.g:332:21:332:27:8859:8865: Warning: Reduce/reduce conflict in state 214 on "final" between rule 83 and rule 208 starting at line 539, column 24

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= final . (83)
------------------------------------------------------------------------------
ConstantModifiers ::= .ConstantModifiers ConstantModifier 
ConstantModifiers ::= .ConstantModifier 
ConstantModifier ::= final . (208)

GJavaParser.g:332:21:332:27:8859:8865: Warning: Reduce/reduce conflict in state 214 on "AT" between rule 83 and rule 208 starting at line 539, column 24

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= final . (83)
------------------------------------------------------------------------------
ConstantModifiers ::= .ConstantModifiers ConstantModifier 
ConstantModifiers ::= .ConstantModifier 
ConstantModifier ::= final . (208)




STATE 215 ----------------------------------------------------------------------
( 180 223 224 249 )

ClassModifier ::= static . (82)
InterfaceModifier ::= static . (190)
ConstantModifier ::= static . (207)

GJavaParser.g:331:21:331:28:8830:8837: Warning: Reduce/reduce conflict in state 215 on "strictfp" between rule 82 and rule 190 starting at line 509, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= static . (82)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= static . (190)

GJavaParser.g:331:21:331:28:8830:8837: Warning: Reduce/reduce conflict in state 215 on "protected" between rule 82 and rule 190 starting at line 509, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= static . (82)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= static . (190)

GJavaParser.g:331:21:331:28:8830:8837: Warning: Reduce/reduce conflict in state 215 on "private" between rule 82 and rule 190 starting at line 509, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= static . (82)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= static . (190)

GJavaParser.g:331:21:331:28:8830:8837: Warning: Reduce/reduce conflict in state 215 on "abstract" between rule 82 and rule 190 starting at line 509, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= static . (82)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= static . (190)

GJavaParser.g:331:21:331:28:8830:8837: Warning: Reduce/reduce conflict in state 215 on "static" between rule 82 and rule 207 starting at line 538, column 24

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= static . (82)
------------------------------------------------------------------------------
ConstantModifiers ::= .ConstantModifiers ConstantModifier 
ConstantModifiers ::= .ConstantModifier 
ConstantModifier ::= static . (207)

GJavaParser.g:331:21:331:28:8830:8837: Warning: Reduce/reduce conflict in state 215 on "static" between rule 82 and rule 190 starting at line 509, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= static . (82)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= static . (190)

GJavaParser.g:331:21:331:28:8830:8837: Warning: Reduce/reduce conflict in state 215 on "public" between rule 82 and rule 207 starting at line 538, column 24

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= static . (82)
------------------------------------------------------------------------------
ConstantModifiers ::= .ConstantModifiers ConstantModifier 
ConstantModifiers ::= .ConstantModifier 
ConstantModifier ::= static . (207)

GJavaParser.g:331:21:331:28:8830:8837: Warning: Reduce/reduce conflict in state 215 on "public" between rule 82 and rule 190 starting at line 509, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= static . (82)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= static . (190)

GJavaParser.g:331:21:331:28:8830:8837: Warning: Reduce/reduce conflict in state 215 on "final" between rule 82 and rule 207 starting at line 538, column 24

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= static . (82)
------------------------------------------------------------------------------
ConstantModifiers ::= .ConstantModifiers ConstantModifier 
ConstantModifiers ::= .ConstantModifier 
ConstantModifier ::= static . (207)

GJavaParser.g:331:21:331:28:8830:8837: Warning: Reduce/reduce conflict in state 215 on "AT" between rule 82 and rule 207 starting at line 538, column 24

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= static . (82)
------------------------------------------------------------------------------
ConstantModifiers ::= .ConstantModifiers ConstantModifier 
ConstantModifiers ::= .ConstantModifier 
ConstantModifier ::= static . (207)

GJavaParser.g:331:21:331:28:8830:8837: Warning: Reduce/reduce conflict in state 215 on "AT" between rule 82 and rule 190 starting at line 509, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= static . (82)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= static . (190)




STATE 218 ----------------------------------------------------------------------
( 180 223 224 249 )

ClassModifier ::= Annotation . (77)
InterfaceModifier ::= Annotation . (185)
ConstantModifier ::= Annotation . (205)
Annotations ::= Annotation . (227)

GJavaParser.g:326:19:326:32:8673:8686: Warning: Reduce/reduce conflict in state 218 on "strictfp" between rule 77 and rule 185 starting at line 504, column 23

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= Annotation . (77)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= Annotation . (185)

GJavaParser.g:326:19:326:32:8673:8686: Warning: Reduce/reduce conflict in state 218 on "protected" between rule 77 and rule 185 starting at line 504, column 23

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= Annotation . (77)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= Annotation . (185)

GJavaParser.g:326:19:326:32:8673:8686: Warning: Reduce/reduce conflict in state 218 on "private" between rule 77 and rule 185 starting at line 504, column 23

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= Annotation . (77)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= Annotation . (185)

GJavaParser.g:326:19:326:32:8673:8686: Warning: Reduce/reduce conflict in state 218 on "static" between rule 77 and rule 205 starting at line 536, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= Annotation . (77)
------------------------------------------------------------------------------
ConstantModifiers ::= .ConstantModifiers ConstantModifier 
ConstantModifiers ::= .ConstantModifier 
ConstantModifier ::= Annotation . (205)

GJavaParser.g:326:19:326:32:8673:8686: Warning: Reduce/reduce conflict in state 218 on "static" between rule 77 and rule 185 starting at line 504, column 23

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= Annotation . (77)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= Annotation . (185)

GJavaParser.g:326:19:326:32:8673:8686: Warning: Reduce/reduce conflict in state 218 on "final" between rule 77 and rule 205 starting at line 536, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= Annotation . (77)
------------------------------------------------------------------------------
ConstantModifiers ::= .ConstantModifiers ConstantModifier 
ConstantModifiers ::= .ConstantModifier 
ConstantModifier ::= Annotation . (205)

GJavaParser.g:536:22:536:35:15523:15536: Warning: Reduce/reduce conflict in state 218 on "IDENTIFIER" between rule 205 and rule 227 starting at line 567, column 17

ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= .ConstantModifiers 
ConstantModifiers ::= .ConstantModifier 
ConstantModifier ::= Annotation . (205)
------------------------------------------------------------------------------
AnnotationTypeElementDeclaration ::= .AbstractMethodModifiersopt Type 
                                     identifier LPAREN RPAREN DefaultValueopt 
                                     SEMICOLON 
AbstractMethodModifiersopt ::= .AbstractMethodModifiers 
AbstractMethodModifiers ::= .AbstractMethodModifier 
AbstractMethodModifier ::= .Annotations 
Annotations ::= Annotation . (227)

GJavaParser.g:536:22:536:35:15523:15536: Warning: Reduce/reduce conflict in state 218 on "short" between rule 205 and rule 227 starting at line 567, column 17

ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= .ConstantModifiers 
ConstantModifiers ::= .ConstantModifier 
ConstantModifier ::= Annotation . (205)
------------------------------------------------------------------------------
AnnotationTypeElementDeclaration ::= .AbstractMethodModifiersopt Type 
                                     identifier LPAREN RPAREN DefaultValueopt 
                                     SEMICOLON 
AbstractMethodModifiersopt ::= .AbstractMethodModifiers 
AbstractMethodModifiers ::= .AbstractMethodModifier 
AbstractMethodModifier ::= .Annotations 
Annotations ::= Annotation . (227)

GJavaParser.g:326:19:326:32:8673:8686: Warning: Reduce/reduce conflict in state 218 on "public" between rule 77 and rule 227 starting at line 567, column 17

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= Annotation . (77)
------------------------------------------------------------------------------
AbstractMethodModifiers ::= .AbstractMethodModifiers AbstractMethodModifier 
AbstractMethodModifiers ::= .AbstractMethodModifier 
AbstractMethodModifier ::= .Annotations 
Annotations ::= Annotation . (227)

GJavaParser.g:326:19:326:32:8673:8686: Warning: Reduce/reduce conflict in state 218 on "public" between rule 77 and rule 205 starting at line 536, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= Annotation . (77)
------------------------------------------------------------------------------
ConstantModifiers ::= .ConstantModifiers ConstantModifier 
ConstantModifiers ::= .ConstantModifier 
ConstantModifier ::= Annotation . (205)

GJavaParser.g:326:19:326:32:8673:8686: Warning: Reduce/reduce conflict in state 218 on "public" between rule 77 and rule 185 starting at line 504, column 23

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= Annotation . (77)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= Annotation . (185)

GJavaParser.g:536:22:536:35:15523:15536: Warning: Reduce/reduce conflict in state 218 on "long" between rule 205 and rule 227 starting at line 567, column 17

ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= .ConstantModifiers 
ConstantModifiers ::= .ConstantModifier 
ConstantModifier ::= Annotation . (205)
------------------------------------------------------------------------------
AnnotationTypeElementDeclaration ::= .AbstractMethodModifiersopt Type 
                                     identifier LPAREN RPAREN DefaultValueopt 
                                     SEMICOLON 
AbstractMethodModifiersopt ::= .AbstractMethodModifiers 
AbstractMethodModifiers ::= .AbstractMethodModifier 
AbstractMethodModifier ::= .Annotations 
Annotations ::= Annotation . (227)

GJavaParser.g:536:22:536:35:15523:15536: Warning: Reduce/reduce conflict in state 218 on "int" between rule 205 and rule 227 starting at line 567, column 17

ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= .ConstantModifiers 
ConstantModifiers ::= .ConstantModifier 
ConstantModifier ::= Annotation . (205)
------------------------------------------------------------------------------
AnnotationTypeElementDeclaration ::= .AbstractMethodModifiersopt Type 
                                     identifier LPAREN RPAREN DefaultValueopt 
                                     SEMICOLON 
AbstractMethodModifiersopt ::= .AbstractMethodModifiers 
AbstractMethodModifiers ::= .AbstractMethodModifier 
AbstractMethodModifier ::= .Annotations 
Annotations ::= Annotation . (227)

GJavaParser.g:536:22:536:35:15523:15536: Warning: Reduce/reduce conflict in state 218 on "float" between rule 205 and rule 227 starting at line 567, column 17

ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= .ConstantModifiers 
ConstantModifiers ::= .ConstantModifier 
ConstantModifier ::= Annotation . (205)
------------------------------------------------------------------------------
AnnotationTypeElementDeclaration ::= .AbstractMethodModifiersopt Type 
                                     identifier LPAREN RPAREN DefaultValueopt 
                                     SEMICOLON 
AbstractMethodModifiersopt ::= .AbstractMethodModifiers 
AbstractMethodModifiers ::= .AbstractMethodModifier 
AbstractMethodModifier ::= .Annotations 
Annotations ::= Annotation . (227)

GJavaParser.g:536:22:536:35:15523:15536: Warning: Reduce/reduce conflict in state 218 on "double" between rule 205 and rule 227 starting at line 567, column 17

ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= .ConstantModifiers 
ConstantModifiers ::= .ConstantModifier 
ConstantModifier ::= Annotation . (205)
------------------------------------------------------------------------------
AnnotationTypeElementDeclaration ::= .AbstractMethodModifiersopt Type 
                                     identifier LPAREN RPAREN DefaultValueopt 
                                     SEMICOLON 
AbstractMethodModifiersopt ::= .AbstractMethodModifiers 
AbstractMethodModifiers ::= .AbstractMethodModifier 
AbstractMethodModifier ::= .Annotations 
Annotations ::= Annotation . (227)

GJavaParser.g:536:22:536:35:15523:15536: Warning: Reduce/reduce conflict in state 218 on "char" between rule 205 and rule 227 starting at line 567, column 17

ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= .ConstantModifiers 
ConstantModifiers ::= .ConstantModifier 
ConstantModifier ::= Annotation . (205)
------------------------------------------------------------------------------
AnnotationTypeElementDeclaration ::= .AbstractMethodModifiersopt Type 
                                     identifier LPAREN RPAREN DefaultValueopt 
                                     SEMICOLON 
AbstractMethodModifiersopt ::= .AbstractMethodModifiers 
AbstractMethodModifiers ::= .AbstractMethodModifier 
AbstractMethodModifier ::= .Annotations 
Annotations ::= Annotation . (227)

GJavaParser.g:536:22:536:35:15523:15536: Warning: Reduce/reduce conflict in state 218 on "byte" between rule 205 and rule 227 starting at line 567, column 17

ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= .ConstantModifiers 
ConstantModifiers ::= .ConstantModifier 
ConstantModifier ::= Annotation . (205)
------------------------------------------------------------------------------
AnnotationTypeElementDeclaration ::= .AbstractMethodModifiersopt Type 
                                     identifier LPAREN RPAREN DefaultValueopt 
                                     SEMICOLON 
AbstractMethodModifiersopt ::= .AbstractMethodModifiers 
AbstractMethodModifiers ::= .AbstractMethodModifier 
AbstractMethodModifier ::= .Annotations 
Annotations ::= Annotation . (227)

GJavaParser.g:536:22:536:35:15523:15536: Warning: Reduce/reduce conflict in state 218 on "boolean" between rule 205 and rule 227 starting at line 567, column 17

ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= .ConstantModifiers 
ConstantModifiers ::= .ConstantModifier 
ConstantModifier ::= Annotation . (205)
------------------------------------------------------------------------------
AnnotationTypeElementDeclaration ::= .AbstractMethodModifiersopt Type 
                                     identifier LPAREN RPAREN DefaultValueopt 
                                     SEMICOLON 
AbstractMethodModifiersopt ::= .AbstractMethodModifiers 
AbstractMethodModifiers ::= .AbstractMethodModifier 
AbstractMethodModifier ::= .Annotations 
Annotations ::= Annotation . (227)

GJavaParser.g:326:19:326:32:8673:8686: Warning: Reduce/reduce conflict in state 218 on "abstract" between rule 77 and rule 227 starting at line 567, column 17

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= Annotation . (77)
------------------------------------------------------------------------------
AbstractMethodModifiers ::= .AbstractMethodModifiers AbstractMethodModifier 
AbstractMethodModifiers ::= .AbstractMethodModifier 
AbstractMethodModifier ::= .Annotations 
Annotations ::= Annotation . (227)

GJavaParser.g:326:19:326:32:8673:8686: Warning: Reduce/reduce conflict in state 218 on "abstract" between rule 77 and rule 185 starting at line 504, column 23

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= Annotation . (77)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= Annotation . (185)

GJavaParser.g:326:19:326:32:8673:8686: Warning: Reduce/reduce conflict in state 218 on "AT" between rule 77 and rule 227 starting at line 567, column 17

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= Annotation . (77)
------------------------------------------------------------------------------
AbstractMethodModifiers ::= .AbstractMethodModifiers AbstractMethodModifier 
AbstractMethodModifiers ::= .AbstractMethodModifier 
AbstractMethodModifier ::= .Annotations 
Annotations ::= Annotation . (227)

GJavaParser.g:326:19:326:32:8673:8686: Warning: Reduce/reduce conflict in state 218 on "AT" between rule 77 and rule 205 starting at line 536, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= Annotation . (77)
------------------------------------------------------------------------------
ConstantModifiers ::= .ConstantModifiers ConstantModifier 
ConstantModifiers ::= .ConstantModifier 
ConstantModifier ::= Annotation . (205)

GJavaParser.g:326:19:326:32:8673:8686: Warning: Reduce/reduce conflict in state 218 on "AT" between rule 77 and rule 185 starting at line 504, column 23

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= Annotation . (77)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= Annotation . (185)




STATE 219 ----------------------------------------------------------------------
( 180 223 224 249 )

ClassModifier ::= abstract . (81)
InterfaceModifier ::= abstract . (189)
AbstractMethodModifier ::= abstract . (214)

GJavaParser.g:330:21:330:30:8799:8808: Warning: Reduce/reduce conflict in state 219 on "strictfp" between rule 81 and rule 189 starting at line 508, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= abstract . (81)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= abstract . (189)

GJavaParser.g:330:21:330:30:8799:8808: Warning: Reduce/reduce conflict in state 219 on "static" between rule 81 and rule 189 starting at line 508, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= abstract . (81)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= abstract . (189)

GJavaParser.g:330:21:330:30:8799:8808: Warning: Reduce/reduce conflict in state 219 on "protected" between rule 81 and rule 189 starting at line 508, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= abstract . (81)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= abstract . (189)

GJavaParser.g:330:21:330:30:8799:8808: Warning: Reduce/reduce conflict in state 219 on "private" between rule 81 and rule 189 starting at line 508, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= abstract . (81)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= abstract . (189)

GJavaParser.g:330:21:330:30:8799:8808: Warning: Reduce/reduce conflict in state 219 on "public" between rule 81 and rule 214 starting at line 548, column 30

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= abstract . (81)
------------------------------------------------------------------------------
AbstractMethodModifiers ::= .AbstractMethodModifiers AbstractMethodModifier 
AbstractMethodModifiers ::= .AbstractMethodModifier 
AbstractMethodModifier ::= abstract . (214)

GJavaParser.g:330:21:330:30:8799:8808: Warning: Reduce/reduce conflict in state 219 on "public" between rule 81 and rule 189 starting at line 508, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= abstract . (81)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= abstract . (189)

GJavaParser.g:330:21:330:30:8799:8808: Warning: Reduce/reduce conflict in state 219 on "abstract" between rule 81 and rule 214 starting at line 548, column 30

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= abstract . (81)
------------------------------------------------------------------------------
AbstractMethodModifiers ::= .AbstractMethodModifiers AbstractMethodModifier 
AbstractMethodModifiers ::= .AbstractMethodModifier 
AbstractMethodModifier ::= abstract . (214)

GJavaParser.g:330:21:330:30:8799:8808: Warning: Reduce/reduce conflict in state 219 on "abstract" between rule 81 and rule 189 starting at line 508, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= abstract . (81)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= abstract . (189)

GJavaParser.g:330:21:330:30:8799:8808: Warning: Reduce/reduce conflict in state 219 on "AT" between rule 81 and rule 214 starting at line 548, column 30

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= abstract . (81)
------------------------------------------------------------------------------
AbstractMethodModifiers ::= .AbstractMethodModifiers AbstractMethodModifier 
AbstractMethodModifiers ::= .AbstractMethodModifier 
AbstractMethodModifier ::= abstract . (214)

GJavaParser.g:330:21:330:30:8799:8808: Warning: Reduce/reduce conflict in state 219 on "AT" between rule 81 and rule 189 starting at line 508, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= abstract . (81)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= abstract . (189)




STATE 220 ----------------------------------------------------------------------
( 180 223 224 249 )

ClassModifier ::= public . (78)
InterfaceModifier ::= public . (186)
ConstantModifier ::= public . (206)
AbstractMethodModifier ::= public . (213)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 220 on "strictfp" between rule 78 and rule 186 starting at line 505, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= public . (186)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 220 on "protected" between rule 78 and rule 186 starting at line 505, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= public . (186)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 220 on "private" between rule 78 and rule 186 starting at line 505, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= public . (186)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 220 on "static" between rule 78 and rule 206 starting at line 537, column 24

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
ConstantModifiers ::= .ConstantModifiers ConstantModifier 
ConstantModifiers ::= .ConstantModifier 
ConstantModifier ::= public . (206)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 220 on "static" between rule 78 and rule 186 starting at line 505, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= public . (186)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 220 on "final" between rule 78 and rule 206 starting at line 537, column 24

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
ConstantModifiers ::= .ConstantModifiers ConstantModifier 
ConstantModifiers ::= .ConstantModifier 
ConstantModifier ::= public . (206)

GJavaParser.g:537:24:537:31:15561:15568: Warning: Reduce/reduce conflict in state 220 on "IDENTIFIER" between rule 206 and rule 213 starting at line 547, column 30

ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= .ConstantModifiers 
ConstantModifiers ::= .ConstantModifier 
ConstantModifier ::= public . (206)
------------------------------------------------------------------------------
AnnotationTypeElementDeclaration ::= .AbstractMethodModifiersopt Type 
                                     identifier LPAREN RPAREN DefaultValueopt 
                                     SEMICOLON 
AbstractMethodModifiersopt ::= .AbstractMethodModifiers 
AbstractMethodModifiers ::= .AbstractMethodModifier 
AbstractMethodModifier ::= public . (213)

GJavaParser.g:537:24:537:31:15561:15568: Warning: Reduce/reduce conflict in state 220 on "short" between rule 206 and rule 213 starting at line 547, column 30

ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= .ConstantModifiers 
ConstantModifiers ::= .ConstantModifier 
ConstantModifier ::= public . (206)
------------------------------------------------------------------------------
AnnotationTypeElementDeclaration ::= .AbstractMethodModifiersopt Type 
                                     identifier LPAREN RPAREN DefaultValueopt 
                                     SEMICOLON 
AbstractMethodModifiersopt ::= .AbstractMethodModifiers 
AbstractMethodModifiers ::= .AbstractMethodModifier 
AbstractMethodModifier ::= public . (213)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 220 on "public" between rule 78 and rule 213 starting at line 547, column 30

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
AbstractMethodModifiers ::= .AbstractMethodModifiers AbstractMethodModifier 
AbstractMethodModifiers ::= .AbstractMethodModifier 
AbstractMethodModifier ::= public . (213)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 220 on "public" between rule 78 and rule 206 starting at line 537, column 24

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
ConstantModifiers ::= .ConstantModifiers ConstantModifier 
ConstantModifiers ::= .ConstantModifier 
ConstantModifier ::= public . (206)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 220 on "public" between rule 78 and rule 186 starting at line 505, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= public . (186)

GJavaParser.g:537:24:537:31:15561:15568: Warning: Reduce/reduce conflict in state 220 on "long" between rule 206 and rule 213 starting at line 547, column 30

ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= .ConstantModifiers 
ConstantModifiers ::= .ConstantModifier 
ConstantModifier ::= public . (206)
------------------------------------------------------------------------------
AnnotationTypeElementDeclaration ::= .AbstractMethodModifiersopt Type 
                                     identifier LPAREN RPAREN DefaultValueopt 
                                     SEMICOLON 
AbstractMethodModifiersopt ::= .AbstractMethodModifiers 
AbstractMethodModifiers ::= .AbstractMethodModifier 
AbstractMethodModifier ::= public . (213)

GJavaParser.g:537:24:537:31:15561:15568: Warning: Reduce/reduce conflict in state 220 on "int" between rule 206 and rule 213 starting at line 547, column 30

ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= .ConstantModifiers 
ConstantModifiers ::= .ConstantModifier 
ConstantModifier ::= public . (206)
------------------------------------------------------------------------------
AnnotationTypeElementDeclaration ::= .AbstractMethodModifiersopt Type 
                                     identifier LPAREN RPAREN DefaultValueopt 
                                     SEMICOLON 
AbstractMethodModifiersopt ::= .AbstractMethodModifiers 
AbstractMethodModifiers ::= .AbstractMethodModifier 
AbstractMethodModifier ::= public . (213)

GJavaParser.g:537:24:537:31:15561:15568: Warning: Reduce/reduce conflict in state 220 on "float" between rule 206 and rule 213 starting at line 547, column 30

ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= .ConstantModifiers 
ConstantModifiers ::= .ConstantModifier 
ConstantModifier ::= public . (206)
------------------------------------------------------------------------------
AnnotationTypeElementDeclaration ::= .AbstractMethodModifiersopt Type 
                                     identifier LPAREN RPAREN DefaultValueopt 
                                     SEMICOLON 
AbstractMethodModifiersopt ::= .AbstractMethodModifiers 
AbstractMethodModifiers ::= .AbstractMethodModifier 
AbstractMethodModifier ::= public . (213)

GJavaParser.g:537:24:537:31:15561:15568: Warning: Reduce/reduce conflict in state 220 on "double" between rule 206 and rule 213 starting at line 547, column 30

ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= .ConstantModifiers 
ConstantModifiers ::= .ConstantModifier 
ConstantModifier ::= public . (206)
------------------------------------------------------------------------------
AnnotationTypeElementDeclaration ::= .AbstractMethodModifiersopt Type 
                                     identifier LPAREN RPAREN DefaultValueopt 
                                     SEMICOLON 
AbstractMethodModifiersopt ::= .AbstractMethodModifiers 
AbstractMethodModifiers ::= .AbstractMethodModifier 
AbstractMethodModifier ::= public . (213)

GJavaParser.g:537:24:537:31:15561:15568: Warning: Reduce/reduce conflict in state 220 on "char" between rule 206 and rule 213 starting at line 547, column 30

ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= .ConstantModifiers 
ConstantModifiers ::= .ConstantModifier 
ConstantModifier ::= public . (206)
------------------------------------------------------------------------------
AnnotationTypeElementDeclaration ::= .AbstractMethodModifiersopt Type 
                                     identifier LPAREN RPAREN DefaultValueopt 
                                     SEMICOLON 
AbstractMethodModifiersopt ::= .AbstractMethodModifiers 
AbstractMethodModifiers ::= .AbstractMethodModifier 
AbstractMethodModifier ::= public . (213)

GJavaParser.g:537:24:537:31:15561:15568: Warning: Reduce/reduce conflict in state 220 on "byte" between rule 206 and rule 213 starting at line 547, column 30

ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= .ConstantModifiers 
ConstantModifiers ::= .ConstantModifier 
ConstantModifier ::= public . (206)
------------------------------------------------------------------------------
AnnotationTypeElementDeclaration ::= .AbstractMethodModifiersopt Type 
                                     identifier LPAREN RPAREN DefaultValueopt 
                                     SEMICOLON 
AbstractMethodModifiersopt ::= .AbstractMethodModifiers 
AbstractMethodModifiers ::= .AbstractMethodModifier 
AbstractMethodModifier ::= public . (213)

GJavaParser.g:537:24:537:31:15561:15568: Warning: Reduce/reduce conflict in state 220 on "boolean" between rule 206 and rule 213 starting at line 547, column 30

ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= .ConstantModifiers 
ConstantModifiers ::= .ConstantModifier 
ConstantModifier ::= public . (206)
------------------------------------------------------------------------------
AnnotationTypeElementDeclaration ::= .AbstractMethodModifiersopt Type 
                                     identifier LPAREN RPAREN DefaultValueopt 
                                     SEMICOLON 
AbstractMethodModifiersopt ::= .AbstractMethodModifiers 
AbstractMethodModifiers ::= .AbstractMethodModifier 
AbstractMethodModifier ::= public . (213)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 220 on "abstract" between rule 78 and rule 213 starting at line 547, column 30

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
AbstractMethodModifiers ::= .AbstractMethodModifiers AbstractMethodModifier 
AbstractMethodModifiers ::= .AbstractMethodModifier 
AbstractMethodModifier ::= public . (213)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 220 on "abstract" between rule 78 and rule 186 starting at line 505, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= public . (186)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 220 on "AT" between rule 78 and rule 213 starting at line 547, column 30

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
AbstractMethodModifiers ::= .AbstractMethodModifiers AbstractMethodModifier 
AbstractMethodModifiers ::= .AbstractMethodModifier 
AbstractMethodModifier ::= public . (213)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 220 on "AT" between rule 78 and rule 206 starting at line 537, column 24

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
ConstantModifiers ::= .ConstantModifiers ConstantModifier 
ConstantModifiers ::= .ConstantModifier 
ConstantModifier ::= public . (206)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 220 on "AT" between rule 78 and rule 186 starting at line 505, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= public . (186)




STATE 221 ----------------------------------------------------------------------
( 180 222 223 224 249 )

AbstractMethodModifier ::= Annotations . (212)
Annotations ::= Annotations  .Annotation 

Annotation ::= .NormalAnnotation 
Annotation ::= .MarkerAnnotation 
Annotation ::= .SingleElementAnnotation 
NormalAnnotation ::= .AT TypeName LPAREN ElementValuePairsopt RPAREN 
MarkerAnnotation ::= .AT TypeName 
SingleElementAnnotation ::= .AT TypeName LPAREN ElementValue RPAREN 

GJavaParser.g:546:28:546:42:15928:15942: Warning: Shift/reduce conflict in state 221 on "AT" with rule 212

AbstractMethodModifiers ::= .AbstractMethodModifiers AbstractMethodModifier 
AbstractMethodModifiers ::= .AbstractMethodModifier 
AbstractMethodModifier ::= Annotations . (212)




STATE 223 ----------------------------------------------------------------------
( 180 )

AnnotationTypeElementDeclarations ::= AnnotationTypeElementDeclarations  .
                                      AnnotationTypeElementDeclaration 
AnnotationTypeElementDeclarationsopt ::= AnnotationTypeElementDeclarations .
                                         (473)

ClassDeclaration ::= .NormalClassDeclaration 
ClassDeclaration ::= .EnumDeclaration 
NormalClassDeclaration ::= .ClassModifiersopt class identifier 
                           TypeParametersopt Superopt Interfacesopt ClassBody 
ClassModifiers ::= .ClassModifier 
ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifier ::= .Annotation 
ClassModifier ::= .public 
ClassModifier ::= .protected 
ClassModifier ::= .private 
ClassModifier ::= .abstract 
ClassModifier ::= .static 
ClassModifier ::= .final 
ClassModifier ::= .strictfp 
EnumDeclaration ::= .ClassModifiersopt enum identifier Interfacesopt EnumBody 
InterfaceDeclaration ::= .NormalInterfaceDeclaration 
InterfaceDeclaration ::= .AnnotationTypeDeclaration 
NormalInterfaceDeclaration ::= .InterfaceModifiersopt interface identifier 
                               TypeParametersopt ExtendsInterfacesopt 
                               InterfaceBody 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifier ::= .Annotation 
InterfaceModifier ::= .public 
InterfaceModifier ::= .protected 
InterfaceModifier ::= .private 
InterfaceModifier ::= .abstract 
InterfaceModifier ::= .static 
InterfaceModifier ::= .strictfp 
ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiers ::= .ConstantModifier 
ConstantModifiers ::= .ConstantModifiers ConstantModifier 
ConstantModifier ::= .Annotation 
ConstantModifier ::= .public 
ConstantModifier ::= .static 
ConstantModifier ::= .final 
AbstractMethodModifiers ::= .AbstractMethodModifier 
AbstractMethodModifiers ::= .AbstractMethodModifiers AbstractMethodModifier 
AbstractMethodModifier ::= .Annotations 
AbstractMethodModifier ::= .public 
AbstractMethodModifier ::= .abstract 
AnnotationTypeDeclaration ::= .InterfaceModifiersopt AT interface identifier 
                              AnnotationTypeBody 
AnnotationTypeElementDeclaration ::= .AbstractMethodModifiersopt Type 
                                     identifier LPAREN RPAREN DefaultValueopt 
                                     SEMICOLON 
AnnotationTypeElementDeclaration ::= .ConstantDeclaration 
AnnotationTypeElementDeclaration ::= .ClassDeclaration 
AnnotationTypeElementDeclaration ::= .InterfaceDeclaration 
AnnotationTypeElementDeclaration ::= .EnumDeclaration 
AnnotationTypeElementDeclaration ::= .AnnotationTypeDeclaration 
AnnotationTypeElementDeclaration ::= .SEMICOLON 
Annotations ::= .Annotation 
Annotations ::= .Annotations Annotation 
Annotation ::= .NormalAnnotation 
Annotation ::= .MarkerAnnotation 
Annotation ::= .SingleElementAnnotation 
NormalAnnotation ::= .AT TypeName LPAREN ElementValuePairsopt RPAREN 
MarkerAnnotation ::= .AT TypeName 
SingleElementAnnotation ::= .AT TypeName LPAREN ElementValue RPAREN 
AbstractMethodModifiersopt ::= . (474)
AbstractMethodModifiersopt ::= .AbstractMethodModifiers 
ConstantModifiersopt ::= . (476)
ConstantModifiersopt ::= .ConstantModifiers 
InterfaceModifiersopt ::= . (482)
InterfaceModifiersopt ::= .InterfaceModifiers 
ClassModifiersopt ::= . (520)
ClassModifiersopt ::= .ClassModifiers 

GJavaParser.g:1007:27:1007:36:32114:32123: Warning: Shift/reduce conflict in state 223 on "AT" with rule 482

AnnotationTypeDeclaration ::= .InterfaceModifiersopt AT interface identifier 
                              AnnotationTypeBody 
InterfaceModifiersopt ::= . (482)

GJavaParser.g:995:32:995:41:31735:31744: Warning: Reduce/reduce conflict in state 223 on "IDENTIFIER" between rule 474 and rule 476 starting at line 998, column 26

AnnotationTypeElementDeclaration ::= .AbstractMethodModifiersopt Type 
                                     identifier LPAREN RPAREN DefaultValueopt 
                                     SEMICOLON 
AbstractMethodModifiersopt ::= . (474)
------------------------------------------------------------------------------
ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= . (476)

GJavaParser.g:995:32:995:41:31735:31744: Warning: Reduce/reduce conflict in state 223 on "short" between rule 474 and rule 476 starting at line 998, column 26

AnnotationTypeElementDeclaration ::= .AbstractMethodModifiersopt Type 
                                     identifier LPAREN RPAREN DefaultValueopt 
                                     SEMICOLON 
AbstractMethodModifiersopt ::= . (474)
------------------------------------------------------------------------------
ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= . (476)

GJavaParser.g:995:32:995:41:31735:31744: Warning: Reduce/reduce conflict in state 223 on "long" between rule 474 and rule 476 starting at line 998, column 26

AnnotationTypeElementDeclaration ::= .AbstractMethodModifiersopt Type 
                                     identifier LPAREN RPAREN DefaultValueopt 
                                     SEMICOLON 
AbstractMethodModifiersopt ::= . (474)
------------------------------------------------------------------------------
ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= . (476)

GJavaParser.g:995:32:995:41:31735:31744: Warning: Reduce/reduce conflict in state 223 on "int" between rule 474 and rule 476 starting at line 998, column 26

AnnotationTypeElementDeclaration ::= .AbstractMethodModifiersopt Type 
                                     identifier LPAREN RPAREN DefaultValueopt 
                                     SEMICOLON 
AbstractMethodModifiersopt ::= . (474)
------------------------------------------------------------------------------
ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= . (476)

GJavaParser.g:995:32:995:41:31735:31744: Warning: Reduce/reduce conflict in state 223 on "float" between rule 474 and rule 476 starting at line 998, column 26

AnnotationTypeElementDeclaration ::= .AbstractMethodModifiersopt Type 
                                     identifier LPAREN RPAREN DefaultValueopt 
                                     SEMICOLON 
AbstractMethodModifiersopt ::= . (474)
------------------------------------------------------------------------------
ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= . (476)

GJavaParser.g:995:32:995:41:31735:31744: Warning: Reduce/reduce conflict in state 223 on "double" between rule 474 and rule 476 starting at line 998, column 26

AnnotationTypeElementDeclaration ::= .AbstractMethodModifiersopt Type 
                                     identifier LPAREN RPAREN DefaultValueopt 
                                     SEMICOLON 
AbstractMethodModifiersopt ::= . (474)
------------------------------------------------------------------------------
ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= . (476)

GJavaParser.g:995:32:995:41:31735:31744: Warning: Reduce/reduce conflict in state 223 on "char" between rule 474 and rule 476 starting at line 998, column 26

AnnotationTypeElementDeclaration ::= .AbstractMethodModifiersopt Type 
                                     identifier LPAREN RPAREN DefaultValueopt 
                                     SEMICOLON 
AbstractMethodModifiersopt ::= . (474)
------------------------------------------------------------------------------
ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= . (476)

GJavaParser.g:995:32:995:41:31735:31744: Warning: Reduce/reduce conflict in state 223 on "byte" between rule 474 and rule 476 starting at line 998, column 26

AnnotationTypeElementDeclaration ::= .AbstractMethodModifiersopt Type 
                                     identifier LPAREN RPAREN DefaultValueopt 
                                     SEMICOLON 
AbstractMethodModifiersopt ::= . (474)
------------------------------------------------------------------------------
ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= . (476)

GJavaParser.g:995:32:995:41:31735:31744: Warning: Reduce/reduce conflict in state 223 on "boolean" between rule 474 and rule 476 starting at line 998, column 26

AnnotationTypeElementDeclaration ::= .AbstractMethodModifiersopt Type 
                                     identifier LPAREN RPAREN DefaultValueopt 
                                     SEMICOLON 
AbstractMethodModifiersopt ::= . (474)
------------------------------------------------------------------------------
ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= . (476)




STATE 224 ----------------------------------------------------------------------
( 181 )

InterfaceBody ::= LBRACE  .InterfaceMemberDeclarationsopt RBRACE 

ClassDeclaration ::= .NormalClassDeclaration 
ClassDeclaration ::= .EnumDeclaration 
NormalClassDeclaration ::= .ClassModifiersopt class identifier 
                           TypeParametersopt Superopt Interfacesopt ClassBody 
ClassModifiers ::= .ClassModifier 
ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifier ::= .Annotation 
ClassModifier ::= .public 
ClassModifier ::= .protected 
ClassModifier ::= .private 
ClassModifier ::= .abstract 
ClassModifier ::= .static 
ClassModifier ::= .final 
ClassModifier ::= .strictfp 
EnumDeclaration ::= .ClassModifiersopt enum identifier Interfacesopt EnumBody 
InterfaceDeclaration ::= .NormalInterfaceDeclaration 
InterfaceDeclaration ::= .AnnotationTypeDeclaration 
NormalInterfaceDeclaration ::= .InterfaceModifiersopt interface identifier 
                               TypeParametersopt ExtendsInterfacesopt 
                               InterfaceBody 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifier ::= .Annotation 
InterfaceModifier ::= .public 
InterfaceModifier ::= .protected 
InterfaceModifier ::= .private 
InterfaceModifier ::= .abstract 
InterfaceModifier ::= .static 
InterfaceModifier ::= .strictfp 
InterfaceMemberDeclarations ::= .InterfaceMemberDeclaration 
InterfaceMemberDeclarations ::= .InterfaceMemberDeclarations 
                                InterfaceMemberDeclaration 
InterfaceMemberDeclaration ::= .ConstantDeclaration 
InterfaceMemberDeclaration ::= .AbstractMethodDeclaration 
InterfaceMemberDeclaration ::= .ClassDeclaration 
InterfaceMemberDeclaration ::= .InterfaceDeclaration 
InterfaceMemberDeclaration ::= .SEMICOLON 
ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiers ::= .ConstantModifier 
ConstantModifiers ::= .ConstantModifiers ConstantModifier 
ConstantModifier ::= .Annotation 
ConstantModifier ::= .public 
ConstantModifier ::= .static 
ConstantModifier ::= .final 
AbstractMethodDeclaration ::= .AbstractMethodModifiersopt TypeParametersopt 
                              ResultType MethodDeclarator Throwsopt SEMICOLON 
AbstractMethodModifiers ::= .AbstractMethodModifier 
AbstractMethodModifiers ::= .AbstractMethodModifiers AbstractMethodModifier 
AbstractMethodModifier ::= .Annotations 
AbstractMethodModifier ::= .public 
AbstractMethodModifier ::= .abstract 
AnnotationTypeDeclaration ::= .InterfaceModifiersopt AT interface identifier 
                              AnnotationTypeBody 
Annotations ::= .Annotation 
Annotations ::= .Annotations Annotation 
Annotation ::= .NormalAnnotation 
Annotation ::= .MarkerAnnotation 
Annotation ::= .SingleElementAnnotation 
NormalAnnotation ::= .AT TypeName LPAREN ElementValuePairsopt RPAREN 
MarkerAnnotation ::= .AT TypeName 
SingleElementAnnotation ::= .AT TypeName LPAREN ElementValue RPAREN 
AbstractMethodModifiersopt ::= . (474)
AbstractMethodModifiersopt ::= .AbstractMethodModifiers 
ConstantModifiersopt ::= . (476)
ConstantModifiersopt ::= .ConstantModifiers 
InterfaceMemberDeclarationsopt ::= . (478)
InterfaceMemberDeclarationsopt ::= .InterfaceMemberDeclarations 
InterfaceModifiersopt ::= . (482)
InterfaceModifiersopt ::= .InterfaceModifiers 
ClassModifiersopt ::= . (520)
ClassModifiersopt ::= .ClassModifiers 

GJavaParser.g:1007:27:1007:36:32114:32123: Warning: Shift/reduce conflict in state 224 on "AT" with rule 482

AnnotationTypeDeclaration ::= .InterfaceModifiersopt AT interface identifier 
                              AnnotationTypeBody 
InterfaceModifiersopt ::= . (482)

GJavaParser.g:998:26:998:35:31831:31840: Warning: Reduce/reduce conflict in state 224 on "IDENTIFIER" between rule 476 and rule 474 starting at line 995, column 32

ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= . (476)
------------------------------------------------------------------------------
AbstractMethodDeclaration ::= .AbstractMethodModifiersopt TypeParametersopt 
                              ResultType MethodDeclarator Throwsopt SEMICOLON 
AbstractMethodModifiersopt ::= . (474)

GJavaParser.g:998:26:998:35:31831:31840: Warning: Reduce/reduce conflict in state 224 on "short" between rule 476 and rule 474 starting at line 995, column 32

ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= . (476)
------------------------------------------------------------------------------
AbstractMethodDeclaration ::= .AbstractMethodModifiersopt TypeParametersopt 
                              ResultType MethodDeclarator Throwsopt SEMICOLON 
AbstractMethodModifiersopt ::= . (474)

GJavaParser.g:998:26:998:35:31831:31840: Warning: Reduce/reduce conflict in state 224 on "long" between rule 476 and rule 474 starting at line 995, column 32

ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= . (476)
------------------------------------------------------------------------------
AbstractMethodDeclaration ::= .AbstractMethodModifiersopt TypeParametersopt 
                              ResultType MethodDeclarator Throwsopt SEMICOLON 
AbstractMethodModifiersopt ::= . (474)

GJavaParser.g:998:26:998:35:31831:31840: Warning: Reduce/reduce conflict in state 224 on "int" between rule 476 and rule 474 starting at line 995, column 32

ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= . (476)
------------------------------------------------------------------------------
AbstractMethodDeclaration ::= .AbstractMethodModifiersopt TypeParametersopt 
                              ResultType MethodDeclarator Throwsopt SEMICOLON 
AbstractMethodModifiersopt ::= . (474)

GJavaParser.g:998:26:998:35:31831:31840: Warning: Reduce/reduce conflict in state 224 on "float" between rule 476 and rule 474 starting at line 995, column 32

ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= . (476)
------------------------------------------------------------------------------
AbstractMethodDeclaration ::= .AbstractMethodModifiersopt TypeParametersopt 
                              ResultType MethodDeclarator Throwsopt SEMICOLON 
AbstractMethodModifiersopt ::= . (474)

GJavaParser.g:998:26:998:35:31831:31840: Warning: Reduce/reduce conflict in state 224 on "double" between rule 476 and rule 474 starting at line 995, column 32

ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= . (476)
------------------------------------------------------------------------------
AbstractMethodDeclaration ::= .AbstractMethodModifiersopt TypeParametersopt 
                              ResultType MethodDeclarator Throwsopt SEMICOLON 
AbstractMethodModifiersopt ::= . (474)

GJavaParser.g:998:26:998:35:31831:31840: Warning: Reduce/reduce conflict in state 224 on "char" between rule 476 and rule 474 starting at line 995, column 32

ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= . (476)
------------------------------------------------------------------------------
AbstractMethodDeclaration ::= .AbstractMethodModifiersopt TypeParametersopt 
                              ResultType MethodDeclarator Throwsopt SEMICOLON 
AbstractMethodModifiersopt ::= . (474)

GJavaParser.g:998:26:998:35:31831:31840: Warning: Reduce/reduce conflict in state 224 on "byte" between rule 476 and rule 474 starting at line 995, column 32

ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= . (476)
------------------------------------------------------------------------------
AbstractMethodDeclaration ::= .AbstractMethodModifiersopt TypeParametersopt 
                              ResultType MethodDeclarator Throwsopt SEMICOLON 
AbstractMethodModifiersopt ::= . (474)

GJavaParser.g:998:26:998:35:31831:31840: Warning: Reduce/reduce conflict in state 224 on "boolean" between rule 476 and rule 474 starting at line 995, column 32

ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= . (476)
------------------------------------------------------------------------------
AbstractMethodDeclaration ::= .AbstractMethodModifiersopt TypeParametersopt 
                              ResultType MethodDeclarator Throwsopt SEMICOLON 
AbstractMethodModifiersopt ::= . (474)




STATE 230 ----------------------------------------------------------------------
( 186 )

EnumConstants ::= EnumConstants  .COMMA EnumConstant 
EnumConstantsopt ::= EnumConstants . (493)

GJavaParser.g:1023:24:1023:38:32479:32493: Warning: Shift/reduce conflict in state 230 on "COMMA" with rule 493

EnumBody ::= LBRACE  .EnumConstantsopt Commaopt EnumBodyDeclarationsopt RBRACE 
EnumConstantsopt ::= EnumConstants . (493)




STATE 241 ----------------------------------------------------------------------
( 201 )

VariableInitializers ::= VariableInitializers  .COMMA VariableInitializer 
VariableInitializersopt ::= VariableInitializers . (465)

GJavaParser.g:981:31:981:52:31323:31344: Warning: Shift/reduce conflict in state 241 on "COMMA" with rule 465

ArrayInitializer ::= LBRACE  .VariableInitializersopt Commaopt RBRACE 
VariableInitializersopt ::= VariableInitializers . (465)




STATE 249 ----------------------------------------------------------------------
( 224 )

InterfaceMemberDeclarations ::= InterfaceMemberDeclarations  .
                                InterfaceMemberDeclaration 
InterfaceMemberDeclarationsopt ::= InterfaceMemberDeclarations . (479)

ClassDeclaration ::= .NormalClassDeclaration 
ClassDeclaration ::= .EnumDeclaration 
NormalClassDeclaration ::= .ClassModifiersopt class identifier 
                           TypeParametersopt Superopt Interfacesopt ClassBody 
ClassModifiers ::= .ClassModifier 
ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifier ::= .Annotation 
ClassModifier ::= .public 
ClassModifier ::= .protected 
ClassModifier ::= .private 
ClassModifier ::= .abstract 
ClassModifier ::= .static 
ClassModifier ::= .final 
ClassModifier ::= .strictfp 
EnumDeclaration ::= .ClassModifiersopt enum identifier Interfacesopt EnumBody 
InterfaceDeclaration ::= .NormalInterfaceDeclaration 
InterfaceDeclaration ::= .AnnotationTypeDeclaration 
NormalInterfaceDeclaration ::= .InterfaceModifiersopt interface identifier 
                               TypeParametersopt ExtendsInterfacesopt 
                               InterfaceBody 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifier ::= .Annotation 
InterfaceModifier ::= .public 
InterfaceModifier ::= .protected 
InterfaceModifier ::= .private 
InterfaceModifier ::= .abstract 
InterfaceModifier ::= .static 
InterfaceModifier ::= .strictfp 
InterfaceMemberDeclaration ::= .ConstantDeclaration 
InterfaceMemberDeclaration ::= .AbstractMethodDeclaration 
InterfaceMemberDeclaration ::= .ClassDeclaration 
InterfaceMemberDeclaration ::= .InterfaceDeclaration 
InterfaceMemberDeclaration ::= .SEMICOLON 
ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiers ::= .ConstantModifier 
ConstantModifiers ::= .ConstantModifiers ConstantModifier 
ConstantModifier ::= .Annotation 
ConstantModifier ::= .public 
ConstantModifier ::= .static 
ConstantModifier ::= .final 
AbstractMethodDeclaration ::= .AbstractMethodModifiersopt TypeParametersopt 
                              ResultType MethodDeclarator Throwsopt SEMICOLON 
AbstractMethodModifiers ::= .AbstractMethodModifier 
AbstractMethodModifiers ::= .AbstractMethodModifiers AbstractMethodModifier 
AbstractMethodModifier ::= .Annotations 
AbstractMethodModifier ::= .public 
AbstractMethodModifier ::= .abstract 
AnnotationTypeDeclaration ::= .InterfaceModifiersopt AT interface identifier 
                              AnnotationTypeBody 
Annotations ::= .Annotation 
Annotations ::= .Annotations Annotation 
Annotation ::= .NormalAnnotation 
Annotation ::= .MarkerAnnotation 
Annotation ::= .SingleElementAnnotation 
NormalAnnotation ::= .AT TypeName LPAREN ElementValuePairsopt RPAREN 
MarkerAnnotation ::= .AT TypeName 
SingleElementAnnotation ::= .AT TypeName LPAREN ElementValue RPAREN 
AbstractMethodModifiersopt ::= . (474)
AbstractMethodModifiersopt ::= .AbstractMethodModifiers 
ConstantModifiersopt ::= . (476)
ConstantModifiersopt ::= .ConstantModifiers 
InterfaceModifiersopt ::= . (482)
InterfaceModifiersopt ::= .InterfaceModifiers 
ClassModifiersopt ::= . (520)
ClassModifiersopt ::= .ClassModifiers 

GJavaParser.g:1007:27:1007:36:32114:32123: Warning: Shift/reduce conflict in state 249 on "AT" with rule 482

AnnotationTypeDeclaration ::= .InterfaceModifiersopt AT interface identifier 
                              AnnotationTypeBody 
InterfaceModifiersopt ::= . (482)

GJavaParser.g:998:26:998:35:31831:31840: Warning: Reduce/reduce conflict in state 249 on "IDENTIFIER" between rule 476 and rule 474 starting at line 995, column 32

ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= . (476)
------------------------------------------------------------------------------
AbstractMethodDeclaration ::= .AbstractMethodModifiersopt TypeParametersopt 
                              ResultType MethodDeclarator Throwsopt SEMICOLON 
AbstractMethodModifiersopt ::= . (474)

GJavaParser.g:998:26:998:35:31831:31840: Warning: Reduce/reduce conflict in state 249 on "short" between rule 476 and rule 474 starting at line 995, column 32

ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= . (476)
------------------------------------------------------------------------------
AbstractMethodDeclaration ::= .AbstractMethodModifiersopt TypeParametersopt 
                              ResultType MethodDeclarator Throwsopt SEMICOLON 
AbstractMethodModifiersopt ::= . (474)

GJavaParser.g:998:26:998:35:31831:31840: Warning: Reduce/reduce conflict in state 249 on "long" between rule 476 and rule 474 starting at line 995, column 32

ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= . (476)
------------------------------------------------------------------------------
AbstractMethodDeclaration ::= .AbstractMethodModifiersopt TypeParametersopt 
                              ResultType MethodDeclarator Throwsopt SEMICOLON 
AbstractMethodModifiersopt ::= . (474)

GJavaParser.g:998:26:998:35:31831:31840: Warning: Reduce/reduce conflict in state 249 on "int" between rule 476 and rule 474 starting at line 995, column 32

ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= . (476)
------------------------------------------------------------------------------
AbstractMethodDeclaration ::= .AbstractMethodModifiersopt TypeParametersopt 
                              ResultType MethodDeclarator Throwsopt SEMICOLON 
AbstractMethodModifiersopt ::= . (474)

GJavaParser.g:998:26:998:35:31831:31840: Warning: Reduce/reduce conflict in state 249 on "float" between rule 476 and rule 474 starting at line 995, column 32

ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= . (476)
------------------------------------------------------------------------------
AbstractMethodDeclaration ::= .AbstractMethodModifiersopt TypeParametersopt 
                              ResultType MethodDeclarator Throwsopt SEMICOLON 
AbstractMethodModifiersopt ::= . (474)

GJavaParser.g:998:26:998:35:31831:31840: Warning: Reduce/reduce conflict in state 249 on "double" between rule 476 and rule 474 starting at line 995, column 32

ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= . (476)
------------------------------------------------------------------------------
AbstractMethodDeclaration ::= .AbstractMethodModifiersopt TypeParametersopt 
                              ResultType MethodDeclarator Throwsopt SEMICOLON 
AbstractMethodModifiersopt ::= . (474)

GJavaParser.g:998:26:998:35:31831:31840: Warning: Reduce/reduce conflict in state 249 on "char" between rule 476 and rule 474 starting at line 995, column 32

ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= . (476)
------------------------------------------------------------------------------
AbstractMethodDeclaration ::= .AbstractMethodModifiersopt TypeParametersopt 
                              ResultType MethodDeclarator Throwsopt SEMICOLON 
AbstractMethodModifiersopt ::= . (474)

GJavaParser.g:998:26:998:35:31831:31840: Warning: Reduce/reduce conflict in state 249 on "byte" between rule 476 and rule 474 starting at line 995, column 32

ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= . (476)
------------------------------------------------------------------------------
AbstractMethodDeclaration ::= .AbstractMethodModifiersopt TypeParametersopt 
                              ResultType MethodDeclarator Throwsopt SEMICOLON 
AbstractMethodModifiersopt ::= . (474)

GJavaParser.g:998:26:998:35:31831:31840: Warning: Reduce/reduce conflict in state 249 on "boolean" between rule 476 and rule 474 starting at line 995, column 32

ConstantDeclaration ::= .ConstantModifiersopt Type VariableDeclarators 
ConstantModifiersopt ::= . (476)
------------------------------------------------------------------------------
AbstractMethodDeclaration ::= .AbstractMethodModifiersopt TypeParametersopt 
                              ResultType MethodDeclarator Throwsopt SEMICOLON 
AbstractMethodModifiersopt ::= . (474)




STATE 253 ----------------------------------------------------------------------
( 230 )

EnumConstants ::= EnumConstants COMMA  .EnumConstant 

identifier ::= .IDENTIFIER 
EnumConstant ::= .Annotationsopt identifier Argumentsopt ClassBodyopt 
Annotations ::= .Annotation 
Annotations ::= .Annotations Annotation 
Annotation ::= .NormalAnnotation 
Annotation ::= .MarkerAnnotation 
Annotation ::= .SingleElementAnnotation 
NormalAnnotation ::= .AT TypeName LPAREN ElementValuePairsopt RPAREN 
MarkerAnnotation ::= .AT TypeName 
SingleElementAnnotation ::= .AT TypeName LPAREN ElementValue RPAREN 
EnumConstant ::= .identifier 
Annotationsopt ::= . (522)
Annotationsopt ::= .Annotations 

GJavaParser.g:1067:20:1067:29:33568:33577: Warning: Shift/reduce conflict in state 253 on "IDENTIFIER" with rule 522

EnumConstant ::= .Annotationsopt identifier Argumentsopt ClassBodyopt 
Annotationsopt ::= . (522)




STATE 254 ----------------------------------------------------------------------
( 232 271 294 360 )

ClassBody ::= LBRACE  .ClassBodyDeclarationsopt RBRACE 

ClassDeclaration ::= .NormalClassDeclaration 
ClassDeclaration ::= .EnumDeclaration 
NormalClassDeclaration ::= .ClassModifiersopt class identifier 
                           TypeParametersopt Superopt Interfacesopt ClassBody 
ClassModifiers ::= .ClassModifier 
ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifier ::= .Annotation 
ClassModifier ::= .public 
ClassModifier ::= .protected 
ClassModifier ::= .private 
ClassModifier ::= .abstract 
ClassModifier ::= .static 
ClassModifier ::= .final 
ClassModifier ::= .strictfp 
ClassBodyDeclarations ::= .ClassBodyDeclaration 
ClassBodyDeclarations ::= .ClassBodyDeclarations ClassBodyDeclaration 
ClassBodyDeclaration ::= .ClassMemberDeclaration 
ClassBodyDeclaration ::= .InstanceInitializer 
ClassBodyDeclaration ::= .StaticInitializer 
ClassBodyDeclaration ::= .ConstructorDeclaration 
ClassMemberDeclaration ::= .FieldDeclaration 
ClassMemberDeclaration ::= .MethodDeclaration 
ClassMemberDeclaration ::= .ClassDeclaration 
ClassMemberDeclaration ::= .InterfaceDeclaration 
ClassMemberDeclaration ::= .SEMICOLON 
FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiers ::= .FieldModifier 
FieldModifiers ::= .FieldModifiers FieldModifier 
FieldModifier ::= .Annotation 
FieldModifier ::= .public 
FieldModifier ::= .protected 
FieldModifier ::= .private 
FieldModifier ::= .static 
FieldModifier ::= .final 
FieldModifier ::= .transient 
FieldModifier ::= .volatile 
MethodDeclaration ::= .MethodHeader MethodBody 
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiers ::= .MethodModifier 
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifier ::= .Annotations 
MethodModifier ::= .public 
MethodModifier ::= .protected 
MethodModifier ::= .private 
MethodModifier ::= .abstract 
MethodModifier ::= .static 
MethodModifier ::= .final 
MethodModifier ::= .synchronized 
MethodModifier ::= .native 
MethodModifier ::= .strictfp 
InstanceInitializer ::= .Block 
StaticInitializer ::= .static Block 
ConstructorDeclaration ::= .ConstructorModifiersopt ConstructorDeclarator 
                           Throwsopt ConstructorBody 
ConstructorModifiers ::= .ConstructorModifier 
ConstructorModifiers ::= .ConstructorModifiers ConstructorModifier 
ConstructorModifier ::= .Annotations 
ConstructorModifier ::= .public 
ConstructorModifier ::= .protected 
ConstructorModifier ::= .private 
EnumDeclaration ::= .ClassModifiersopt enum identifier Interfacesopt EnumBody 
InterfaceDeclaration ::= .NormalInterfaceDeclaration 
InterfaceDeclaration ::= .AnnotationTypeDeclaration 
NormalInterfaceDeclaration ::= .InterfaceModifiersopt interface identifier 
                               TypeParametersopt ExtendsInterfacesopt 
                               InterfaceBody 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifier ::= .Annotation 
InterfaceModifier ::= .public 
InterfaceModifier ::= .protected 
InterfaceModifier ::= .private 
InterfaceModifier ::= .abstract 
InterfaceModifier ::= .static 
InterfaceModifier ::= .strictfp 
AnnotationTypeDeclaration ::= .InterfaceModifiersopt AT interface identifier 
                              AnnotationTypeBody 
Annotations ::= .Annotation 
Annotations ::= .Annotations Annotation 
Annotation ::= .NormalAnnotation 
Annotation ::= .MarkerAnnotation 
Annotation ::= .SingleElementAnnotation 
NormalAnnotation ::= .AT TypeName LPAREN ElementValuePairsopt RPAREN 
MarkerAnnotation ::= .AT TypeName 
SingleElementAnnotation ::= .AT TypeName LPAREN ElementValue RPAREN 
Block ::= .LBRACE BlockStatementsopt RBRACE 
InterfaceModifiersopt ::= . (482)
InterfaceModifiersopt ::= .InterfaceModifiers 
ConstructorModifiersopt ::= . (500)
ConstructorModifiersopt ::= .ConstructorModifiers 
MethodModifiersopt ::= . (508)
MethodModifiersopt ::= .MethodModifiers 
FieldModifiersopt ::= . (510)
FieldModifiersopt ::= .FieldModifiers 
ClassBodyDeclarationsopt ::= . (512)
ClassBodyDeclarationsopt ::= .ClassBodyDeclarations 
ClassModifiersopt ::= . (520)
ClassModifiersopt ::= .ClassModifiers 

GJavaParser.g:1007:27:1007:36:32114:32123: Warning: Shift/reduce conflict in state 254 on "AT" with rule 482

AnnotationTypeDeclaration ::= .InterfaceModifiersopt AT interface identifier 
                              AnnotationTypeBody 
InterfaceModifiersopt ::= . (482)

GJavaParser.g:1046:24:1046:33:33062:33071: Warning: Reduce/reduce conflict in state 254 on "short" between rule 508 and rule 510 starting at line 1049, column 23

MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= . (508)
------------------------------------------------------------------------------
FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= . (510)

GJavaParser.g:1046:24:1046:33:33062:33071: Warning: Reduce/reduce conflict in state 254 on "long" between rule 508 and rule 510 starting at line 1049, column 23

MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= . (508)
------------------------------------------------------------------------------
FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= . (510)

GJavaParser.g:1046:24:1046:33:33062:33071: Warning: Reduce/reduce conflict in state 254 on "int" between rule 508 and rule 510 starting at line 1049, column 23

MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= . (508)
------------------------------------------------------------------------------
FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= . (510)

GJavaParser.g:1046:24:1046:33:33062:33071: Warning: Reduce/reduce conflict in state 254 on "float" between rule 508 and rule 510 starting at line 1049, column 23

MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= . (508)
------------------------------------------------------------------------------
FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= . (510)

GJavaParser.g:1046:24:1046:33:33062:33071: Warning: Reduce/reduce conflict in state 254 on "double" between rule 508 and rule 510 starting at line 1049, column 23

MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= . (508)
------------------------------------------------------------------------------
FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= . (510)

GJavaParser.g:1046:24:1046:33:33062:33071: Warning: Reduce/reduce conflict in state 254 on "char" between rule 508 and rule 510 starting at line 1049, column 23

MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= . (508)
------------------------------------------------------------------------------
FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= . (510)

GJavaParser.g:1046:24:1046:33:33062:33071: Warning: Reduce/reduce conflict in state 254 on "byte" between rule 508 and rule 510 starting at line 1049, column 23

MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= . (508)
------------------------------------------------------------------------------
FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= . (510)

GJavaParser.g:1046:24:1046:33:33062:33071: Warning: Reduce/reduce conflict in state 254 on "boolean" between rule 508 and rule 510 starting at line 1049, column 23

MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= . (508)
------------------------------------------------------------------------------
FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= . (510)

GJavaParser.g:1046:24:1046:33:33062:33071: Warning: Reduce/reduce conflict in state 254 on "IDENTIFIER" between rule 508 and rule 500 starting at line 1034, column 29

MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= . (508)
------------------------------------------------------------------------------
ConstructorDeclaration ::= .ConstructorModifiersopt ConstructorDeclarator 
                           Throwsopt ConstructorBody 
ConstructorModifiersopt ::= . (500)

GJavaParser.g:1046:24:1046:33:33062:33071: Warning: Reduce/reduce conflict in state 254 on "IDENTIFIER" between rule 508 and rule 510 starting at line 1049, column 23

MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= . (508)
------------------------------------------------------------------------------
FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= . (510)

GJavaParser.g:1046:24:1046:33:33062:33071: Warning: Reduce/reduce conflict in state 254 on "LESS" between rule 508 and rule 500 starting at line 1034, column 29

MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= . (508)
------------------------------------------------------------------------------
ConstructorDeclaration ::= .ConstructorModifiersopt ConstructorDeclarator 
                           Throwsopt ConstructorBody 
ConstructorModifiersopt ::= . (500)




STATE 270 ----------------------------------------------------------------------
( 251 )

EnumBodyDeclarations ::= SEMICOLON  .ClassBodyDeclarationsopt 

ClassDeclaration ::= .NormalClassDeclaration 
ClassDeclaration ::= .EnumDeclaration 
NormalClassDeclaration ::= .ClassModifiersopt class identifier 
                           TypeParametersopt Superopt Interfacesopt ClassBody 
ClassModifiers ::= .ClassModifier 
ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifier ::= .Annotation 
ClassModifier ::= .public 
ClassModifier ::= .protected 
ClassModifier ::= .private 
ClassModifier ::= .abstract 
ClassModifier ::= .static 
ClassModifier ::= .final 
ClassModifier ::= .strictfp 
ClassBodyDeclarations ::= .ClassBodyDeclaration 
ClassBodyDeclarations ::= .ClassBodyDeclarations ClassBodyDeclaration 
ClassBodyDeclaration ::= .ClassMemberDeclaration 
ClassBodyDeclaration ::= .InstanceInitializer 
ClassBodyDeclaration ::= .StaticInitializer 
ClassBodyDeclaration ::= .ConstructorDeclaration 
ClassMemberDeclaration ::= .FieldDeclaration 
ClassMemberDeclaration ::= .MethodDeclaration 
ClassMemberDeclaration ::= .ClassDeclaration 
ClassMemberDeclaration ::= .InterfaceDeclaration 
ClassMemberDeclaration ::= .SEMICOLON 
FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiers ::= .FieldModifier 
FieldModifiers ::= .FieldModifiers FieldModifier 
FieldModifier ::= .Annotation 
FieldModifier ::= .public 
FieldModifier ::= .protected 
FieldModifier ::= .private 
FieldModifier ::= .static 
FieldModifier ::= .final 
FieldModifier ::= .transient 
FieldModifier ::= .volatile 
MethodDeclaration ::= .MethodHeader MethodBody 
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiers ::= .MethodModifier 
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifier ::= .Annotations 
MethodModifier ::= .public 
MethodModifier ::= .protected 
MethodModifier ::= .private 
MethodModifier ::= .abstract 
MethodModifier ::= .static 
MethodModifier ::= .final 
MethodModifier ::= .synchronized 
MethodModifier ::= .native 
MethodModifier ::= .strictfp 
InstanceInitializer ::= .Block 
StaticInitializer ::= .static Block 
ConstructorDeclaration ::= .ConstructorModifiersopt ConstructorDeclarator 
                           Throwsopt ConstructorBody 
ConstructorModifiers ::= .ConstructorModifier 
ConstructorModifiers ::= .ConstructorModifiers ConstructorModifier 
ConstructorModifier ::= .Annotations 
ConstructorModifier ::= .public 
ConstructorModifier ::= .protected 
ConstructorModifier ::= .private 
EnumDeclaration ::= .ClassModifiersopt enum identifier Interfacesopt EnumBody 
InterfaceDeclaration ::= .NormalInterfaceDeclaration 
InterfaceDeclaration ::= .AnnotationTypeDeclaration 
NormalInterfaceDeclaration ::= .InterfaceModifiersopt interface identifier 
                               TypeParametersopt ExtendsInterfacesopt 
                               InterfaceBody 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifier ::= .Annotation 
InterfaceModifier ::= .public 
InterfaceModifier ::= .protected 
InterfaceModifier ::= .private 
InterfaceModifier ::= .abstract 
InterfaceModifier ::= .static 
InterfaceModifier ::= .strictfp 
AnnotationTypeDeclaration ::= .InterfaceModifiersopt AT interface identifier 
                              AnnotationTypeBody 
Annotations ::= .Annotation 
Annotations ::= .Annotations Annotation 
Annotation ::= .NormalAnnotation 
Annotation ::= .MarkerAnnotation 
Annotation ::= .SingleElementAnnotation 
NormalAnnotation ::= .AT TypeName LPAREN ElementValuePairsopt RPAREN 
MarkerAnnotation ::= .AT TypeName 
SingleElementAnnotation ::= .AT TypeName LPAREN ElementValue RPAREN 
Block ::= .LBRACE BlockStatementsopt RBRACE 
InterfaceModifiersopt ::= . (482)
InterfaceModifiersopt ::= .InterfaceModifiers 
ConstructorModifiersopt ::= . (500)
ConstructorModifiersopt ::= .ConstructorModifiers 
MethodModifiersopt ::= . (508)
MethodModifiersopt ::= .MethodModifiers 
FieldModifiersopt ::= . (510)
FieldModifiersopt ::= .FieldModifiers 
ClassBodyDeclarationsopt ::= . (512)
ClassBodyDeclarationsopt ::= .ClassBodyDeclarations 
ClassModifiersopt ::= . (520)
ClassModifiersopt ::= .ClassModifiers 

GJavaParser.g:1007:27:1007:36:32114:32123: Warning: Shift/reduce conflict in state 270 on "AT" with rule 482

AnnotationTypeDeclaration ::= .InterfaceModifiersopt AT interface identifier 
                              AnnotationTypeBody 
InterfaceModifiersopt ::= . (482)

GJavaParser.g:1046:24:1046:33:33062:33071: Warning: Reduce/reduce conflict in state 270 on "short" between rule 508 and rule 510 starting at line 1049, column 23

MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= . (508)
------------------------------------------------------------------------------
FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= . (510)

GJavaParser.g:1046:24:1046:33:33062:33071: Warning: Reduce/reduce conflict in state 270 on "long" between rule 508 and rule 510 starting at line 1049, column 23

MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= . (508)
------------------------------------------------------------------------------
FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= . (510)

GJavaParser.g:1046:24:1046:33:33062:33071: Warning: Reduce/reduce conflict in state 270 on "int" between rule 508 and rule 510 starting at line 1049, column 23

MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= . (508)
------------------------------------------------------------------------------
FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= . (510)

GJavaParser.g:1046:24:1046:33:33062:33071: Warning: Reduce/reduce conflict in state 270 on "float" between rule 508 and rule 510 starting at line 1049, column 23

MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= . (508)
------------------------------------------------------------------------------
FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= . (510)

GJavaParser.g:1046:24:1046:33:33062:33071: Warning: Reduce/reduce conflict in state 270 on "double" between rule 508 and rule 510 starting at line 1049, column 23

MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= . (508)
------------------------------------------------------------------------------
FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= . (510)

GJavaParser.g:1046:24:1046:33:33062:33071: Warning: Reduce/reduce conflict in state 270 on "char" between rule 508 and rule 510 starting at line 1049, column 23

MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= . (508)
------------------------------------------------------------------------------
FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= . (510)

GJavaParser.g:1046:24:1046:33:33062:33071: Warning: Reduce/reduce conflict in state 270 on "byte" between rule 508 and rule 510 starting at line 1049, column 23

MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= . (508)
------------------------------------------------------------------------------
FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= . (510)

GJavaParser.g:1046:24:1046:33:33062:33071: Warning: Reduce/reduce conflict in state 270 on "boolean" between rule 508 and rule 510 starting at line 1049, column 23

MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= . (508)
------------------------------------------------------------------------------
FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= . (510)

GJavaParser.g:1046:24:1046:33:33062:33071: Warning: Reduce/reduce conflict in state 270 on "IDENTIFIER" between rule 508 and rule 500 starting at line 1034, column 29

MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= . (508)
------------------------------------------------------------------------------
ConstructorDeclaration ::= .ConstructorModifiersopt ConstructorDeclarator 
                           Throwsopt ConstructorBody 
ConstructorModifiersopt ::= . (500)

GJavaParser.g:1046:24:1046:33:33062:33071: Warning: Reduce/reduce conflict in state 270 on "IDENTIFIER" between rule 508 and rule 510 starting at line 1049, column 23

MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= . (508)
------------------------------------------------------------------------------
FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= . (510)

GJavaParser.g:1046:24:1046:33:33062:33071: Warning: Reduce/reduce conflict in state 270 on "LESS" between rule 508 and rule 500 starting at line 1034, column 29

MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= . (508)
------------------------------------------------------------------------------
ConstructorDeclaration ::= .ConstructorModifiersopt ConstructorDeclarator 
                           Throwsopt ConstructorBody 
ConstructorModifiersopt ::= . (500)




STATE 276 ----------------------------------------------------------------------
( 254 270 276 279 285 291 306 312 332 353 387 393 395 399 400 429 435 437 441 
  442 453 463 464 465 471 473 )

Block ::= LBRACE  .BlockStatementsopt RBRACE 

identifier ::= .IDENTIFIER 
Type ::= .PrimitiveType 
Type ::= .ReferenceType 
PrimitiveType ::= .NumericType 
PrimitiveType ::= .boolean 
NumericType ::= .IntegralType 
NumericType ::= .FloatingPointType 
IntegralType ::= .byte 
IntegralType ::= .short 
IntegralType ::= .int 
IntegralType ::= .long 
IntegralType ::= .char 
FloatingPointType ::= .float 
FloatingPointType ::= .double 
ReferenceType ::= .ClassOrInterfaceType 
ReferenceType ::= .TypeVariable 
ReferenceType ::= .ArrayType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= .identifier 
TypeName ::= .TypeName DOT identifier 
ClassName ::= .TypeName 
TypeVariable ::= .identifier 
ArrayType ::= .Type LBRACKET RBRACKET 
ExpressionName ::= .identifier 
ExpressionName ::= .AmbiguousName DOT identifier 
MethodName ::= .identifier 
MethodName ::= .AmbiguousName DOT identifier 
AmbiguousName ::= .identifier 
AmbiguousName ::= .AmbiguousName DOT identifier 
ClassDeclaration ::= .NormalClassDeclaration 
ClassDeclaration ::= .EnumDeclaration 
NormalClassDeclaration ::= .ClassModifiersopt class identifier 
                           TypeParametersopt Superopt Interfacesopt ClassBody 
ClassModifiers ::= .ClassModifier 
ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifier ::= .Annotation 
ClassModifier ::= .public 
ClassModifier ::= .protected 
ClassModifier ::= .private 
ClassModifier ::= .abstract 
ClassModifier ::= .static 
ClassModifier ::= .final 
ClassModifier ::= .strictfp 
VariableModifiers ::= .VariableModifier 
VariableModifiers ::= .VariableModifiers VariableModifier 
VariableModifier ::= .final 
VariableModifier ::= .Annotations 
EnumDeclaration ::= .ClassModifiersopt enum identifier Interfacesopt EnumBody 
Annotations ::= .Annotation 
Annotations ::= .Annotations Annotation 
Annotation ::= .NormalAnnotation 
Annotation ::= .MarkerAnnotation 
Annotation ::= .SingleElementAnnotation 
NormalAnnotation ::= .AT TypeName LPAREN ElementValuePairsopt RPAREN 
MarkerAnnotation ::= .AT TypeName 
SingleElementAnnotation ::= .AT TypeName LPAREN ElementValue RPAREN 
Block ::= .LBRACE BlockStatementsopt RBRACE 
BlockStatements ::= .BlockStatement 
BlockStatements ::= .BlockStatements BlockStatement 
BlockStatement ::= .LocalVariableDeclarationStatement 
BlockStatement ::= .ClassDeclaration 
BlockStatement ::= .Statement 
LocalVariableDeclarationStatement ::= .LocalVariableDeclaration SEMICOLON 
LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
Statement ::= .StatementWithoutTrailingSubstatement 
Statement ::= .LabeledStatement 
Statement ::= .IfThenStatement 
Statement ::= .IfThenElseStatement 
Statement ::= .WhileStatement 
Statement ::= .ForStatement 
StatementWithoutTrailingSubstatement ::= .Block 
StatementWithoutTrailingSubstatement ::= .EmptyStatement 
StatementWithoutTrailingSubstatement ::= .ExpressionStatement 
StatementWithoutTrailingSubstatement ::= .AssertStatement 
StatementWithoutTrailingSubstatement ::= .SwitchStatement 
StatementWithoutTrailingSubstatement ::= .DoStatement 
StatementWithoutTrailingSubstatement ::= .BreakStatement 
StatementWithoutTrailingSubstatement ::= .ContinueStatement 
StatementWithoutTrailingSubstatement ::= .ReturnStatement 
StatementWithoutTrailingSubstatement ::= .SynchronizedStatement 
StatementWithoutTrailingSubstatement ::= .ThrowStatement 
StatementWithoutTrailingSubstatement ::= .TryStatement 
IfThenStatement ::= .if LPAREN Expression RPAREN Statement 
IfThenElseStatement ::= .if LPAREN Expression RPAREN StatementNoShortIf else 
                        Statement 
EmptyStatement ::= .SEMICOLON 
LabeledStatement ::= .identifier COLON Statement 
ExpressionStatement ::= .StatementExpression SEMICOLON 
StatementExpression ::= .Assignment 
StatementExpression ::= .PreIncrementExpression 
StatementExpression ::= .PreDecrementExpression 
StatementExpression ::= .PostIncrementExpression 
StatementExpression ::= .PostDecrementExpression 
StatementExpression ::= .MethodInvocation 
StatementExpression ::= .ClassInstanceCreationExpression 
AssertStatement ::= .assert Expression SEMICOLON 
AssertStatement ::= .assert Expression COLON Expression SEMICOLON 
SwitchStatement ::= .switch LPAREN Expression RPAREN SwitchBlock 
WhileStatement ::= .while LPAREN Expression RPAREN Statement 
DoStatement ::= .do Statement while LPAREN Expression RPAREN SEMICOLON 
ForStatement ::= .BasicForStatement 
ForStatement ::= .EnhancedForStatement 
BasicForStatement ::= .for LPAREN ForInitopt SEMICOLON Expressionopt SEMICOLON 
                      ForUpdateopt RPAREN Statement 
EnhancedForStatement ::= .for LPAREN FormalParameter COLON Expression RPAREN 
                         Statement 
BreakStatement ::= .break identifieropt SEMICOLON 
ContinueStatement ::= .continue identifieropt SEMICOLON 
ReturnStatement ::= .return Expressionopt SEMICOLON 
ThrowStatement ::= .throw Expression SEMICOLON 
SynchronizedStatement ::= .synchronized LPAREN Expression RPAREN Block 
TryStatement ::= .try Block Catches 
TryStatement ::= .try Block Catchesopt Finally 
Primary ::= .PrimaryNoNewArray 
Primary ::= .ArrayCreationExpression 
PrimaryNoNewArray ::= .Literal 
PrimaryNoNewArray ::= .Type DOT class 
PrimaryNoNewArray ::= .void DOT class 
PrimaryNoNewArray ::= .this 
PrimaryNoNewArray ::= .ClassName DOT this 
PrimaryNoNewArray ::= .LPAREN Expression RPAREN 
PrimaryNoNewArray ::= .ClassInstanceCreationExpression 
PrimaryNoNewArray ::= .FieldAccess 
PrimaryNoNewArray ::= .MethodInvocation 
PrimaryNoNewArray ::= .ArrayAccess 
Literal ::= .IntegerLiteral 
Literal ::= .LongLiteral 
Literal ::= .FloatingPointLiteral 
Literal ::= .DoubleLiteral 
Literal ::= .BooleanLiteral 
Literal ::= .CharacterLiteral 
Literal ::= .StringLiteral 
Literal ::= .null 
BooleanLiteral ::= .true 
BooleanLiteral ::= .false 
ClassInstanceCreationExpression ::= .new TypeArgumentsopt ClassOrInterfaceType 
                                    TypeArgumentsopt LPAREN ArgumentListopt 
                                    RPAREN ClassBodyopt 
ClassInstanceCreationExpression ::= .Primary DOT new TypeArgumentsopt 
                                    identifier TypeArgumentsopt LPAREN 
                                    ArgumentListopt RPAREN ClassBodyopt 
ArrayCreationExpression ::= .new PrimitiveType DimExprs Dimsopt 
ArrayCreationExpression ::= .new ClassOrInterfaceType DimExprs Dimsopt 
ArrayCreationExpression ::= .new PrimitiveType Dims ArrayInitializer 
ArrayCreationExpression ::= .new ClassOrInterfaceType Dims ArrayInitializer 
FieldAccess ::= .Primary DOT identifier 
FieldAccess ::= .super DOT identifier 
FieldAccess ::= .ClassName DOT super DOT identifier 
MethodInvocation ::= .MethodName LPAREN ArgumentListopt RPAREN 
MethodInvocation ::= .Primary DOT TypeArgumentsopt identifier LPAREN 
                     ArgumentListopt RPAREN 
MethodInvocation ::= .super DOT TypeArgumentsopt identifier LPAREN 
                     ArgumentListopt RPAREN 
MethodInvocation ::= .ClassName DOT super DOT TypeArgumentsopt identifier 
                     LPAREN ArgumentListopt RPAREN 
MethodInvocation ::= .TypeName DOT TypeArguments identifier LPAREN 
                     ArgumentListopt RPAREN 
ArrayAccess ::= .ExpressionName LBRACKET Expression RBRACKET 
ArrayAccess ::= .PrimaryNoNewArray LBRACKET Expression RBRACKET 
PostfixExpression ::= .Primary 
PostfixExpression ::= .ExpressionName 
PostfixExpression ::= .PostIncrementExpression 
PostfixExpression ::= .PostDecrementExpression 
PostIncrementExpression ::= .PostfixExpression PLUS_PLUS 
PostDecrementExpression ::= .PostfixExpression MINUS_MINUS 
PreIncrementExpression ::= .PLUS_PLUS UnaryExpression 
PreDecrementExpression ::= .MINUS_MINUS UnaryExpression 
Assignment ::= .LeftHandSide AssignmentOperator AssignmentExpression 
LeftHandSide ::= .ExpressionName 
LeftHandSide ::= .FieldAccess 
LeftHandSide ::= .ArrayAccess 
VariableModifiersopt ::= . (462)
VariableModifiersopt ::= .VariableModifiers 
BlockStatementsopt ::= . (496)
BlockStatementsopt ::= .BlockStatements 
ClassModifiersopt ::= . (520)
ClassModifiersopt ::= .ClassModifiers 

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 276 on "double" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 276 on "float" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 276 on "char" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 276 on "long" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 276 on "int" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 276 on "short" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 276 on "byte" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 276 on "boolean" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 276 on "IDENTIFIER" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)




STATE 280 ----------------------------------------------------------------------
( 254 270 291 )

MethodModifier ::= Annotations . (141)
ConstructorModifier ::= Annotations . (165)
Annotations ::= Annotations  .Annotation 

Annotation ::= .NormalAnnotation 
Annotation ::= .MarkerAnnotation 
Annotation ::= .SingleElementAnnotation 
NormalAnnotation ::= .AT TypeName LPAREN ElementValuePairsopt RPAREN 
MarkerAnnotation ::= .AT TypeName 
SingleElementAnnotation ::= .AT TypeName LPAREN ElementValue RPAREN 

GJavaParser.g:435:20:435:34:12037:12051: Warning: Shift/reduce conflict in state 280 on "AT" with rule 141

MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= Annotations . (141)

GJavaParser.g:470:25:470:39:13079:13093: Warning: Shift/reduce conflict in state 280 on "AT" with rule 165

ConstructorModifiers ::= .ConstructorModifiers ConstructorModifier 
ConstructorModifiers ::= .ConstructorModifier 
ConstructorModifier ::= Annotations . (165)

GJavaParser.g:435:20:435:34:12037:12051: Warning: Reduce/reduce conflict in state 280 on "IDENTIFIER" between rule 141 and rule 165 starting at line 470, column 25

MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= Annotations . (141)
------------------------------------------------------------------------------
ConstructorDeclaration ::= .ConstructorModifiersopt ConstructorDeclarator 
                           Throwsopt ConstructorBody 
ConstructorModifiersopt ::= .ConstructorModifiers 
ConstructorModifiers ::= .ConstructorModifier 
ConstructorModifier ::= Annotations . (165)

GJavaParser.g:435:20:435:34:12037:12051: Warning: Reduce/reduce conflict in state 280 on "public" between rule 141 and rule 165 starting at line 470, column 25

MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= Annotations . (141)
------------------------------------------------------------------------------
ConstructorModifiers ::= .ConstructorModifiers ConstructorModifier 
ConstructorModifiers ::= .ConstructorModifier 
ConstructorModifier ::= Annotations . (165)

GJavaParser.g:435:20:435:34:12037:12051: Warning: Reduce/reduce conflict in state 280 on "protected" between rule 141 and rule 165 starting at line 470, column 25

MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= Annotations . (141)
------------------------------------------------------------------------------
ConstructorModifiers ::= .ConstructorModifiers ConstructorModifier 
ConstructorModifiers ::= .ConstructorModifier 
ConstructorModifier ::= Annotations . (165)

GJavaParser.g:435:20:435:34:12037:12051: Warning: Reduce/reduce conflict in state 280 on "private" between rule 141 and rule 165 starting at line 470, column 25

MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= Annotations . (141)
------------------------------------------------------------------------------
ConstructorModifiers ::= .ConstructorModifiers ConstructorModifier 
ConstructorModifiers ::= .ConstructorModifier 
ConstructorModifier ::= Annotations . (165)

GJavaParser.g:435:20:435:34:12037:12051: Warning: Reduce/reduce conflict in state 280 on "LESS" between rule 141 and rule 165 starting at line 470, column 25

MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= Annotations . (141)
------------------------------------------------------------------------------
ConstructorDeclaration ::= .ConstructorModifiersopt ConstructorDeclarator 
                           Throwsopt ConstructorBody 
ConstructorModifiersopt ::= .ConstructorModifiers 
ConstructorModifiers ::= .ConstructorModifier 
ConstructorModifier ::= Annotations . (165)




STATE 283 ----------------------------------------------------------------------
( 254 270 291 )

ClassModifier ::= final . (83)
FieldModifier ::= final . (120)
MethodModifier ::= final . (147)

GJavaParser.g:395:21:395:27:10800:10806: Warning: Reduce/reduce conflict in state 283 on "IDENTIFIER" between rule 120 and rule 147 starting at line 441, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= final . (120)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= final . (147)

GJavaParser.g:332:21:332:27:8859:8865: Warning: Reduce/reduce conflict in state 283 on "strictfp" between rule 83 and rule 147 starting at line 441, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= final . (83)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= final . (147)

GJavaParser.g:332:21:332:27:8859:8865: Warning: Reduce/reduce conflict in state 283 on "static" between rule 83 and rule 147 starting at line 441, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= final . (83)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= final . (147)

GJavaParser.g:332:21:332:27:8859:8865: Warning: Reduce/reduce conflict in state 283 on "static" between rule 83 and rule 120 starting at line 395, column 21

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= final . (83)
------------------------------------------------------------------------------
FieldModifiers ::= .FieldModifiers FieldModifier 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= final . (120)

GJavaParser.g:395:21:395:27:10800:10806: Warning: Reduce/reduce conflict in state 283 on "short" between rule 120 and rule 147 starting at line 441, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= final . (120)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= final . (147)

GJavaParser.g:332:21:332:27:8859:8865: Warning: Reduce/reduce conflict in state 283 on "public" between rule 83 and rule 147 starting at line 441, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= final . (83)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= final . (147)

GJavaParser.g:332:21:332:27:8859:8865: Warning: Reduce/reduce conflict in state 283 on "public" between rule 83 and rule 120 starting at line 395, column 21

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= final . (83)
------------------------------------------------------------------------------
FieldModifiers ::= .FieldModifiers FieldModifier 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= final . (120)

GJavaParser.g:332:21:332:27:8859:8865: Warning: Reduce/reduce conflict in state 283 on "protected" between rule 83 and rule 147 starting at line 441, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= final . (83)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= final . (147)

GJavaParser.g:332:21:332:27:8859:8865: Warning: Reduce/reduce conflict in state 283 on "protected" between rule 83 and rule 120 starting at line 395, column 21

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= final . (83)
------------------------------------------------------------------------------
FieldModifiers ::= .FieldModifiers FieldModifier 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= final . (120)

GJavaParser.g:332:21:332:27:8859:8865: Warning: Reduce/reduce conflict in state 283 on "private" between rule 83 and rule 147 starting at line 441, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= final . (83)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= final . (147)

GJavaParser.g:332:21:332:27:8859:8865: Warning: Reduce/reduce conflict in state 283 on "private" between rule 83 and rule 120 starting at line 395, column 21

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= final . (83)
------------------------------------------------------------------------------
FieldModifiers ::= .FieldModifiers FieldModifier 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= final . (120)

GJavaParser.g:395:21:395:27:10800:10806: Warning: Reduce/reduce conflict in state 283 on "long" between rule 120 and rule 147 starting at line 441, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= final . (120)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= final . (147)

GJavaParser.g:395:21:395:27:10800:10806: Warning: Reduce/reduce conflict in state 283 on "int" between rule 120 and rule 147 starting at line 441, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= final . (120)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= final . (147)

GJavaParser.g:395:21:395:27:10800:10806: Warning: Reduce/reduce conflict in state 283 on "float" between rule 120 and rule 147 starting at line 441, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= final . (120)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= final . (147)

GJavaParser.g:332:21:332:27:8859:8865: Warning: Reduce/reduce conflict in state 283 on "final" between rule 83 and rule 147 starting at line 441, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= final . (83)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= final . (147)

GJavaParser.g:332:21:332:27:8859:8865: Warning: Reduce/reduce conflict in state 283 on "final" between rule 83 and rule 120 starting at line 395, column 21

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= final . (83)
------------------------------------------------------------------------------
FieldModifiers ::= .FieldModifiers FieldModifier 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= final . (120)

GJavaParser.g:395:21:395:27:10800:10806: Warning: Reduce/reduce conflict in state 283 on "double" between rule 120 and rule 147 starting at line 441, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= final . (120)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= final . (147)

GJavaParser.g:395:21:395:27:10800:10806: Warning: Reduce/reduce conflict in state 283 on "char" between rule 120 and rule 147 starting at line 441, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= final . (120)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= final . (147)

GJavaParser.g:395:21:395:27:10800:10806: Warning: Reduce/reduce conflict in state 283 on "byte" between rule 120 and rule 147 starting at line 441, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= final . (120)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= final . (147)

GJavaParser.g:395:21:395:27:10800:10806: Warning: Reduce/reduce conflict in state 283 on "boolean" between rule 120 and rule 147 starting at line 441, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= final . (120)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= final . (147)

GJavaParser.g:332:21:332:27:8859:8865: Warning: Reduce/reduce conflict in state 283 on "abstract" between rule 83 and rule 147 starting at line 441, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= final . (83)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= final . (147)

GJavaParser.g:332:21:332:27:8859:8865: Warning: Reduce/reduce conflict in state 283 on "AT" between rule 83 and rule 147 starting at line 441, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= final . (83)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= final . (147)

GJavaParser.g:332:21:332:27:8859:8865: Warning: Reduce/reduce conflict in state 283 on "AT" between rule 83 and rule 120 starting at line 395, column 21

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= final . (83)
------------------------------------------------------------------------------
FieldModifiers ::= .FieldModifiers FieldModifier 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= final . (120)




STATE 284 ----------------------------------------------------------------------
( 254 270 291 )

ClassModifier ::= strictfp . (84)
MethodModifier ::= strictfp . (150)
InterfaceModifier ::= strictfp . (191)

GJavaParser.g:333:21:333:30:8887:8896: Warning: Reduce/reduce conflict in state 284 on "final" between rule 84 and rule 150 starting at line 444, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= strictfp . (84)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= strictfp . (150)

GJavaParser.g:333:21:333:30:8887:8896: Warning: Reduce/reduce conflict in state 284 on "strictfp" between rule 84 and rule 191 starting at line 510, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= strictfp . (84)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= strictfp . (191)

GJavaParser.g:333:21:333:30:8887:8896: Warning: Reduce/reduce conflict in state 284 on "strictfp" between rule 84 and rule 150 starting at line 444, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= strictfp . (84)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= strictfp . (150)

GJavaParser.g:333:21:333:30:8887:8896: Warning: Reduce/reduce conflict in state 284 on "static" between rule 84 and rule 191 starting at line 510, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= strictfp . (84)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= strictfp . (191)

GJavaParser.g:333:21:333:30:8887:8896: Warning: Reduce/reduce conflict in state 284 on "static" between rule 84 and rule 150 starting at line 444, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= strictfp . (84)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= strictfp . (150)

GJavaParser.g:333:21:333:30:8887:8896: Warning: Reduce/reduce conflict in state 284 on "public" between rule 84 and rule 191 starting at line 510, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= strictfp . (84)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= strictfp . (191)

GJavaParser.g:333:21:333:30:8887:8896: Warning: Reduce/reduce conflict in state 284 on "public" between rule 84 and rule 150 starting at line 444, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= strictfp . (84)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= strictfp . (150)

GJavaParser.g:333:21:333:30:8887:8896: Warning: Reduce/reduce conflict in state 284 on "protected" between rule 84 and rule 191 starting at line 510, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= strictfp . (84)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= strictfp . (191)

GJavaParser.g:333:21:333:30:8887:8896: Warning: Reduce/reduce conflict in state 284 on "protected" between rule 84 and rule 150 starting at line 444, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= strictfp . (84)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= strictfp . (150)

GJavaParser.g:333:21:333:30:8887:8896: Warning: Reduce/reduce conflict in state 284 on "private" between rule 84 and rule 191 starting at line 510, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= strictfp . (84)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= strictfp . (191)

GJavaParser.g:333:21:333:30:8887:8896: Warning: Reduce/reduce conflict in state 284 on "private" between rule 84 and rule 150 starting at line 444, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= strictfp . (84)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= strictfp . (150)

GJavaParser.g:333:21:333:30:8887:8896: Warning: Reduce/reduce conflict in state 284 on "abstract" between rule 84 and rule 191 starting at line 510, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= strictfp . (84)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= strictfp . (191)

GJavaParser.g:333:21:333:30:8887:8896: Warning: Reduce/reduce conflict in state 284 on "abstract" between rule 84 and rule 150 starting at line 444, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= strictfp . (84)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= strictfp . (150)

GJavaParser.g:333:21:333:30:8887:8896: Warning: Reduce/reduce conflict in state 284 on "AT" between rule 84 and rule 191 starting at line 510, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= strictfp . (84)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= strictfp . (191)

GJavaParser.g:333:21:333:30:8887:8896: Warning: Reduce/reduce conflict in state 284 on "AT" between rule 84 and rule 150 starting at line 444, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= strictfp . (84)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= strictfp . (150)




STATE 285 ----------------------------------------------------------------------
( 254 270 291 )

ClassModifier ::= static . (82)
FieldModifier ::= static . (119)
MethodModifier ::= static . (146)
StaticInitializer ::= static  .Block 
InterfaceModifier ::= static . (190)

Block ::= .LBRACE BlockStatementsopt RBRACE 

GJavaParser.g:394:21:394:28:10771:10778: Warning: Reduce/reduce conflict in state 285 on "IDENTIFIER" between rule 119 and rule 146 starting at line 440, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= static . (119)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= static . (146)

GJavaParser.g:394:21:394:28:10771:10778: Warning: Reduce/reduce conflict in state 285 on "short" between rule 119 and rule 146 starting at line 440, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= static . (119)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= static . (146)

GJavaParser.g:394:21:394:28:10771:10778: Warning: Reduce/reduce conflict in state 285 on "long" between rule 119 and rule 146 starting at line 440, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= static . (119)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= static . (146)

GJavaParser.g:394:21:394:28:10771:10778: Warning: Reduce/reduce conflict in state 285 on "int" between rule 119 and rule 146 starting at line 440, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= static . (119)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= static . (146)

GJavaParser.g:394:21:394:28:10771:10778: Warning: Reduce/reduce conflict in state 285 on "float" between rule 119 and rule 146 starting at line 440, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= static . (119)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= static . (146)

GJavaParser.g:331:21:331:28:8830:8837: Warning: Reduce/reduce conflict in state 285 on "final" between rule 82 and rule 146 starting at line 440, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= static . (82)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= static . (146)

GJavaParser.g:331:21:331:28:8830:8837: Warning: Reduce/reduce conflict in state 285 on "final" between rule 82 and rule 119 starting at line 394, column 21

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= static . (82)
------------------------------------------------------------------------------
FieldModifiers ::= .FieldModifiers FieldModifier 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= static . (119)

GJavaParser.g:394:21:394:28:10771:10778: Warning: Reduce/reduce conflict in state 285 on "double" between rule 119 and rule 146 starting at line 440, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= static . (119)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= static . (146)

GJavaParser.g:394:21:394:28:10771:10778: Warning: Reduce/reduce conflict in state 285 on "char" between rule 119 and rule 146 starting at line 440, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= static . (119)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= static . (146)

GJavaParser.g:394:21:394:28:10771:10778: Warning: Reduce/reduce conflict in state 285 on "byte" between rule 119 and rule 146 starting at line 440, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= static . (119)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= static . (146)

GJavaParser.g:394:21:394:28:10771:10778: Warning: Reduce/reduce conflict in state 285 on "boolean" between rule 119 and rule 146 starting at line 440, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= static . (119)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= static . (146)

GJavaParser.g:331:21:331:28:8830:8837: Warning: Reduce/reduce conflict in state 285 on "strictfp" between rule 82 and rule 190 starting at line 509, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= static . (82)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= static . (190)

GJavaParser.g:331:21:331:28:8830:8837: Warning: Reduce/reduce conflict in state 285 on "strictfp" between rule 82 and rule 146 starting at line 440, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= static . (82)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= static . (146)

GJavaParser.g:331:21:331:28:8830:8837: Warning: Reduce/reduce conflict in state 285 on "static" between rule 82 and rule 190 starting at line 509, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= static . (82)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= static . (190)

GJavaParser.g:331:21:331:28:8830:8837: Warning: Reduce/reduce conflict in state 285 on "static" between rule 82 and rule 146 starting at line 440, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= static . (82)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= static . (146)

GJavaParser.g:331:21:331:28:8830:8837: Warning: Reduce/reduce conflict in state 285 on "static" between rule 82 and rule 119 starting at line 394, column 21

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= static . (82)
------------------------------------------------------------------------------
FieldModifiers ::= .FieldModifiers FieldModifier 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= static . (119)

GJavaParser.g:331:21:331:28:8830:8837: Warning: Reduce/reduce conflict in state 285 on "public" between rule 82 and rule 190 starting at line 509, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= static . (82)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= static . (190)

GJavaParser.g:331:21:331:28:8830:8837: Warning: Reduce/reduce conflict in state 285 on "public" between rule 82 and rule 146 starting at line 440, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= static . (82)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= static . (146)

GJavaParser.g:331:21:331:28:8830:8837: Warning: Reduce/reduce conflict in state 285 on "public" between rule 82 and rule 119 starting at line 394, column 21

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= static . (82)
------------------------------------------------------------------------------
FieldModifiers ::= .FieldModifiers FieldModifier 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= static . (119)

GJavaParser.g:331:21:331:28:8830:8837: Warning: Reduce/reduce conflict in state 285 on "protected" between rule 82 and rule 190 starting at line 509, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= static . (82)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= static . (190)

GJavaParser.g:331:21:331:28:8830:8837: Warning: Reduce/reduce conflict in state 285 on "protected" between rule 82 and rule 146 starting at line 440, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= static . (82)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= static . (146)

GJavaParser.g:331:21:331:28:8830:8837: Warning: Reduce/reduce conflict in state 285 on "protected" between rule 82 and rule 119 starting at line 394, column 21

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= static . (82)
------------------------------------------------------------------------------
FieldModifiers ::= .FieldModifiers FieldModifier 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= static . (119)

GJavaParser.g:331:21:331:28:8830:8837: Warning: Reduce/reduce conflict in state 285 on "private" between rule 82 and rule 190 starting at line 509, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= static . (82)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= static . (190)

GJavaParser.g:331:21:331:28:8830:8837: Warning: Reduce/reduce conflict in state 285 on "private" between rule 82 and rule 146 starting at line 440, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= static . (82)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= static . (146)

GJavaParser.g:331:21:331:28:8830:8837: Warning: Reduce/reduce conflict in state 285 on "private" between rule 82 and rule 119 starting at line 394, column 21

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= static . (82)
------------------------------------------------------------------------------
FieldModifiers ::= .FieldModifiers FieldModifier 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= static . (119)

GJavaParser.g:331:21:331:28:8830:8837: Warning: Reduce/reduce conflict in state 285 on "abstract" between rule 82 and rule 190 starting at line 509, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= static . (82)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= static . (190)

GJavaParser.g:331:21:331:28:8830:8837: Warning: Reduce/reduce conflict in state 285 on "abstract" between rule 82 and rule 146 starting at line 440, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= static . (82)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= static . (146)

GJavaParser.g:331:21:331:28:8830:8837: Warning: Reduce/reduce conflict in state 285 on "AT" between rule 82 and rule 190 starting at line 509, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= static . (82)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= static . (190)

GJavaParser.g:331:21:331:28:8830:8837: Warning: Reduce/reduce conflict in state 285 on "AT" between rule 82 and rule 146 starting at line 440, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= static . (82)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= static . (146)

GJavaParser.g:331:21:331:28:8830:8837: Warning: Reduce/reduce conflict in state 285 on "AT" between rule 82 and rule 119 starting at line 394, column 21

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= static . (82)
------------------------------------------------------------------------------
FieldModifiers ::= .FieldModifiers FieldModifier 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= static . (119)




STATE 286 ----------------------------------------------------------------------
( 254 270 291 )

ClassModifier ::= abstract . (81)
MethodModifier ::= abstract . (145)
InterfaceModifier ::= abstract . (189)

GJavaParser.g:330:21:330:30:8799:8808: Warning: Reduce/reduce conflict in state 286 on "final" between rule 81 and rule 145 starting at line 439, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= abstract . (81)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= abstract . (145)

GJavaParser.g:330:21:330:30:8799:8808: Warning: Reduce/reduce conflict in state 286 on "strictfp" between rule 81 and rule 189 starting at line 508, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= abstract . (81)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= abstract . (189)

GJavaParser.g:330:21:330:30:8799:8808: Warning: Reduce/reduce conflict in state 286 on "strictfp" between rule 81 and rule 145 starting at line 439, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= abstract . (81)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= abstract . (145)

GJavaParser.g:330:21:330:30:8799:8808: Warning: Reduce/reduce conflict in state 286 on "static" between rule 81 and rule 189 starting at line 508, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= abstract . (81)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= abstract . (189)

GJavaParser.g:330:21:330:30:8799:8808: Warning: Reduce/reduce conflict in state 286 on "static" between rule 81 and rule 145 starting at line 439, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= abstract . (81)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= abstract . (145)

GJavaParser.g:330:21:330:30:8799:8808: Warning: Reduce/reduce conflict in state 286 on "public" between rule 81 and rule 189 starting at line 508, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= abstract . (81)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= abstract . (189)

GJavaParser.g:330:21:330:30:8799:8808: Warning: Reduce/reduce conflict in state 286 on "public" between rule 81 and rule 145 starting at line 439, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= abstract . (81)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= abstract . (145)

GJavaParser.g:330:21:330:30:8799:8808: Warning: Reduce/reduce conflict in state 286 on "protected" between rule 81 and rule 189 starting at line 508, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= abstract . (81)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= abstract . (189)

GJavaParser.g:330:21:330:30:8799:8808: Warning: Reduce/reduce conflict in state 286 on "protected" between rule 81 and rule 145 starting at line 439, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= abstract . (81)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= abstract . (145)

GJavaParser.g:330:21:330:30:8799:8808: Warning: Reduce/reduce conflict in state 286 on "private" between rule 81 and rule 189 starting at line 508, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= abstract . (81)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= abstract . (189)

GJavaParser.g:330:21:330:30:8799:8808: Warning: Reduce/reduce conflict in state 286 on "private" between rule 81 and rule 145 starting at line 439, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= abstract . (81)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= abstract . (145)

GJavaParser.g:330:21:330:30:8799:8808: Warning: Reduce/reduce conflict in state 286 on "abstract" between rule 81 and rule 189 starting at line 508, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= abstract . (81)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= abstract . (189)

GJavaParser.g:330:21:330:30:8799:8808: Warning: Reduce/reduce conflict in state 286 on "abstract" between rule 81 and rule 145 starting at line 439, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= abstract . (81)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= abstract . (145)

GJavaParser.g:330:21:330:30:8799:8808: Warning: Reduce/reduce conflict in state 286 on "AT" between rule 81 and rule 189 starting at line 508, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= abstract . (81)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= abstract . (189)

GJavaParser.g:330:21:330:30:8799:8808: Warning: Reduce/reduce conflict in state 286 on "AT" between rule 81 and rule 145 starting at line 439, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= abstract . (81)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= abstract . (145)




STATE 287 ----------------------------------------------------------------------
( 254 270 291 )

ClassModifier ::= private . (80)
FieldModifier ::= private . (118)
MethodModifier ::= private . (144)
ConstructorModifier ::= private . (168)
InterfaceModifier ::= private . (188)

GJavaParser.g:393:21:393:29:10741:10749: Warning: Reduce/reduce conflict in state 287 on "short" between rule 118 and rule 144 starting at line 438, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= private . (118)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= private . (144)

GJavaParser.g:393:21:393:29:10741:10749: Warning: Reduce/reduce conflict in state 287 on "long" between rule 118 and rule 144 starting at line 438, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= private . (118)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= private . (144)

GJavaParser.g:393:21:393:29:10741:10749: Warning: Reduce/reduce conflict in state 287 on "int" between rule 118 and rule 144 starting at line 438, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= private . (118)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= private . (144)

GJavaParser.g:393:21:393:29:10741:10749: Warning: Reduce/reduce conflict in state 287 on "float" between rule 118 and rule 144 starting at line 438, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= private . (118)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= private . (144)

GJavaParser.g:329:21:329:29:8769:8777: Warning: Reduce/reduce conflict in state 287 on "final" between rule 80 and rule 144 starting at line 438, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= private . (80)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= private . (144)

GJavaParser.g:329:21:329:29:8769:8777: Warning: Reduce/reduce conflict in state 287 on "final" between rule 80 and rule 118 starting at line 393, column 21

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= private . (80)
------------------------------------------------------------------------------
FieldModifiers ::= .FieldModifiers FieldModifier 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= private . (118)

GJavaParser.g:393:21:393:29:10741:10749: Warning: Reduce/reduce conflict in state 287 on "double" between rule 118 and rule 144 starting at line 438, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= private . (118)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= private . (144)

GJavaParser.g:393:21:393:29:10741:10749: Warning: Reduce/reduce conflict in state 287 on "char" between rule 118 and rule 144 starting at line 438, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= private . (118)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= private . (144)

GJavaParser.g:393:21:393:29:10741:10749: Warning: Reduce/reduce conflict in state 287 on "byte" between rule 118 and rule 144 starting at line 438, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= private . (118)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= private . (144)

GJavaParser.g:393:21:393:29:10741:10749: Warning: Reduce/reduce conflict in state 287 on "boolean" between rule 118 and rule 144 starting at line 438, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= private . (118)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= private . (144)

GJavaParser.g:393:21:393:29:10741:10749: Warning: Reduce/reduce conflict in state 287 on "IDENTIFIER" between rule 118 and rule 168 starting at line 473, column 27

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= private . (118)
------------------------------------------------------------------------------
ConstructorDeclaration ::= .ConstructorModifiersopt ConstructorDeclarator 
                           Throwsopt ConstructorBody 
ConstructorModifiersopt ::= .ConstructorModifiers 
ConstructorModifiers ::= .ConstructorModifier 
ConstructorModifier ::= private . (168)

GJavaParser.g:393:21:393:29:10741:10749: Warning: Reduce/reduce conflict in state 287 on "IDENTIFIER" between rule 118 and rule 144 starting at line 438, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= private . (118)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= private . (144)

GJavaParser.g:438:22:438:30:12137:12145: Warning: Reduce/reduce conflict in state 287 on "LESS" between rule 144 and rule 168 starting at line 473, column 27

MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= private . (144)
------------------------------------------------------------------------------
ConstructorDeclaration ::= .ConstructorModifiersopt ConstructorDeclarator 
                           Throwsopt ConstructorBody 
ConstructorModifiersopt ::= .ConstructorModifiers 
ConstructorModifiers ::= .ConstructorModifier 
ConstructorModifier ::= private . (168)

GJavaParser.g:329:21:329:29:8769:8777: Warning: Reduce/reduce conflict in state 287 on "strictfp" between rule 80 and rule 188 starting at line 507, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= private . (80)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= private . (188)

GJavaParser.g:329:21:329:29:8769:8777: Warning: Reduce/reduce conflict in state 287 on "strictfp" between rule 80 and rule 144 starting at line 438, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= private . (80)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= private . (144)

GJavaParser.g:329:21:329:29:8769:8777: Warning: Reduce/reduce conflict in state 287 on "static" between rule 80 and rule 188 starting at line 507, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= private . (80)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= private . (188)

GJavaParser.g:329:21:329:29:8769:8777: Warning: Reduce/reduce conflict in state 287 on "static" between rule 80 and rule 144 starting at line 438, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= private . (80)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= private . (144)

GJavaParser.g:329:21:329:29:8769:8777: Warning: Reduce/reduce conflict in state 287 on "static" between rule 80 and rule 118 starting at line 393, column 21

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= private . (80)
------------------------------------------------------------------------------
FieldModifiers ::= .FieldModifiers FieldModifier 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= private . (118)

GJavaParser.g:329:21:329:29:8769:8777: Warning: Reduce/reduce conflict in state 287 on "public" between rule 80 and rule 188 starting at line 507, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= private . (80)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= private . (188)

GJavaParser.g:329:21:329:29:8769:8777: Warning: Reduce/reduce conflict in state 287 on "public" between rule 80 and rule 168 starting at line 473, column 27

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= private . (80)
------------------------------------------------------------------------------
ConstructorModifiers ::= .ConstructorModifiers ConstructorModifier 
ConstructorModifiers ::= .ConstructorModifier 
ConstructorModifier ::= private . (168)

GJavaParser.g:329:21:329:29:8769:8777: Warning: Reduce/reduce conflict in state 287 on "public" between rule 80 and rule 144 starting at line 438, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= private . (80)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= private . (144)

GJavaParser.g:329:21:329:29:8769:8777: Warning: Reduce/reduce conflict in state 287 on "public" between rule 80 and rule 118 starting at line 393, column 21

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= private . (80)
------------------------------------------------------------------------------
FieldModifiers ::= .FieldModifiers FieldModifier 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= private . (118)

GJavaParser.g:329:21:329:29:8769:8777: Warning: Reduce/reduce conflict in state 287 on "protected" between rule 80 and rule 188 starting at line 507, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= private . (80)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= private . (188)

GJavaParser.g:329:21:329:29:8769:8777: Warning: Reduce/reduce conflict in state 287 on "protected" between rule 80 and rule 168 starting at line 473, column 27

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= private . (80)
------------------------------------------------------------------------------
ConstructorModifiers ::= .ConstructorModifiers ConstructorModifier 
ConstructorModifiers ::= .ConstructorModifier 
ConstructorModifier ::= private . (168)

GJavaParser.g:329:21:329:29:8769:8777: Warning: Reduce/reduce conflict in state 287 on "protected" between rule 80 and rule 144 starting at line 438, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= private . (80)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= private . (144)

GJavaParser.g:329:21:329:29:8769:8777: Warning: Reduce/reduce conflict in state 287 on "protected" between rule 80 and rule 118 starting at line 393, column 21

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= private . (80)
------------------------------------------------------------------------------
FieldModifiers ::= .FieldModifiers FieldModifier 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= private . (118)

GJavaParser.g:329:21:329:29:8769:8777: Warning: Reduce/reduce conflict in state 287 on "private" between rule 80 and rule 188 starting at line 507, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= private . (80)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= private . (188)

GJavaParser.g:329:21:329:29:8769:8777: Warning: Reduce/reduce conflict in state 287 on "private" between rule 80 and rule 168 starting at line 473, column 27

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= private . (80)
------------------------------------------------------------------------------
ConstructorModifiers ::= .ConstructorModifiers ConstructorModifier 
ConstructorModifiers ::= .ConstructorModifier 
ConstructorModifier ::= private . (168)

GJavaParser.g:329:21:329:29:8769:8777: Warning: Reduce/reduce conflict in state 287 on "private" between rule 80 and rule 144 starting at line 438, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= private . (80)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= private . (144)

GJavaParser.g:329:21:329:29:8769:8777: Warning: Reduce/reduce conflict in state 287 on "private" between rule 80 and rule 118 starting at line 393, column 21

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= private . (80)
------------------------------------------------------------------------------
FieldModifiers ::= .FieldModifiers FieldModifier 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= private . (118)

GJavaParser.g:329:21:329:29:8769:8777: Warning: Reduce/reduce conflict in state 287 on "abstract" between rule 80 and rule 188 starting at line 507, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= private . (80)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= private . (188)

GJavaParser.g:329:21:329:29:8769:8777: Warning: Reduce/reduce conflict in state 287 on "abstract" between rule 80 and rule 144 starting at line 438, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= private . (80)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= private . (144)

GJavaParser.g:329:21:329:29:8769:8777: Warning: Reduce/reduce conflict in state 287 on "AT" between rule 80 and rule 188 starting at line 507, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= private . (80)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= private . (188)

GJavaParser.g:329:21:329:29:8769:8777: Warning: Reduce/reduce conflict in state 287 on "AT" between rule 80 and rule 168 starting at line 473, column 27

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= private . (80)
------------------------------------------------------------------------------
ConstructorModifiers ::= .ConstructorModifiers ConstructorModifier 
ConstructorModifiers ::= .ConstructorModifier 
ConstructorModifier ::= private . (168)

GJavaParser.g:329:21:329:29:8769:8777: Warning: Reduce/reduce conflict in state 287 on "AT" between rule 80 and rule 144 starting at line 438, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= private . (80)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= private . (144)

GJavaParser.g:329:21:329:29:8769:8777: Warning: Reduce/reduce conflict in state 287 on "AT" between rule 80 and rule 118 starting at line 393, column 21

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= private . (80)
------------------------------------------------------------------------------
FieldModifiers ::= .FieldModifiers FieldModifier 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= private . (118)




STATE 288 ----------------------------------------------------------------------
( 254 270 291 )

ClassModifier ::= protected . (79)
FieldModifier ::= protected . (117)
MethodModifier ::= protected . (143)
ConstructorModifier ::= protected . (167)
InterfaceModifier ::= protected . (187)

GJavaParser.g:392:21:392:31:10709:10719: Warning: Reduce/reduce conflict in state 288 on "short" between rule 117 and rule 143 starting at line 437, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= protected . (117)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= protected . (143)

GJavaParser.g:392:21:392:31:10709:10719: Warning: Reduce/reduce conflict in state 288 on "long" between rule 117 and rule 143 starting at line 437, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= protected . (117)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= protected . (143)

GJavaParser.g:392:21:392:31:10709:10719: Warning: Reduce/reduce conflict in state 288 on "int" between rule 117 and rule 143 starting at line 437, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= protected . (117)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= protected . (143)

GJavaParser.g:392:21:392:31:10709:10719: Warning: Reduce/reduce conflict in state 288 on "float" between rule 117 and rule 143 starting at line 437, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= protected . (117)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= protected . (143)

GJavaParser.g:328:21:328:31:8737:8747: Warning: Reduce/reduce conflict in state 288 on "final" between rule 79 and rule 143 starting at line 437, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= protected . (79)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= protected . (143)

GJavaParser.g:328:21:328:31:8737:8747: Warning: Reduce/reduce conflict in state 288 on "final" between rule 79 and rule 117 starting at line 392, column 21

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= protected . (79)
------------------------------------------------------------------------------
FieldModifiers ::= .FieldModifiers FieldModifier 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= protected . (117)

GJavaParser.g:392:21:392:31:10709:10719: Warning: Reduce/reduce conflict in state 288 on "double" between rule 117 and rule 143 starting at line 437, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= protected . (117)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= protected . (143)

GJavaParser.g:392:21:392:31:10709:10719: Warning: Reduce/reduce conflict in state 288 on "char" between rule 117 and rule 143 starting at line 437, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= protected . (117)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= protected . (143)

GJavaParser.g:392:21:392:31:10709:10719: Warning: Reduce/reduce conflict in state 288 on "byte" between rule 117 and rule 143 starting at line 437, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= protected . (117)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= protected . (143)

GJavaParser.g:392:21:392:31:10709:10719: Warning: Reduce/reduce conflict in state 288 on "boolean" between rule 117 and rule 143 starting at line 437, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= protected . (117)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= protected . (143)

GJavaParser.g:392:21:392:31:10709:10719: Warning: Reduce/reduce conflict in state 288 on "IDENTIFIER" between rule 117 and rule 167 starting at line 472, column 27

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= protected . (117)
------------------------------------------------------------------------------
ConstructorDeclaration ::= .ConstructorModifiersopt ConstructorDeclarator 
                           Throwsopt ConstructorBody 
ConstructorModifiersopt ::= .ConstructorModifiers 
ConstructorModifiers ::= .ConstructorModifier 
ConstructorModifier ::= protected . (167)

GJavaParser.g:392:21:392:31:10709:10719: Warning: Reduce/reduce conflict in state 288 on "IDENTIFIER" between rule 117 and rule 143 starting at line 437, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= protected . (117)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= protected . (143)

GJavaParser.g:437:22:437:32:12104:12114: Warning: Reduce/reduce conflict in state 288 on "LESS" between rule 143 and rule 167 starting at line 472, column 27

MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= protected . (143)
------------------------------------------------------------------------------
ConstructorDeclaration ::= .ConstructorModifiersopt ConstructorDeclarator 
                           Throwsopt ConstructorBody 
ConstructorModifiersopt ::= .ConstructorModifiers 
ConstructorModifiers ::= .ConstructorModifier 
ConstructorModifier ::= protected . (167)

GJavaParser.g:328:21:328:31:8737:8747: Warning: Reduce/reduce conflict in state 288 on "strictfp" between rule 79 and rule 187 starting at line 506, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= protected . (79)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= protected . (187)

GJavaParser.g:328:21:328:31:8737:8747: Warning: Reduce/reduce conflict in state 288 on "strictfp" between rule 79 and rule 143 starting at line 437, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= protected . (79)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= protected . (143)

GJavaParser.g:328:21:328:31:8737:8747: Warning: Reduce/reduce conflict in state 288 on "static" between rule 79 and rule 187 starting at line 506, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= protected . (79)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= protected . (187)

GJavaParser.g:328:21:328:31:8737:8747: Warning: Reduce/reduce conflict in state 288 on "static" between rule 79 and rule 143 starting at line 437, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= protected . (79)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= protected . (143)

GJavaParser.g:328:21:328:31:8737:8747: Warning: Reduce/reduce conflict in state 288 on "static" between rule 79 and rule 117 starting at line 392, column 21

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= protected . (79)
------------------------------------------------------------------------------
FieldModifiers ::= .FieldModifiers FieldModifier 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= protected . (117)

GJavaParser.g:328:21:328:31:8737:8747: Warning: Reduce/reduce conflict in state 288 on "public" between rule 79 and rule 187 starting at line 506, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= protected . (79)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= protected . (187)

GJavaParser.g:328:21:328:31:8737:8747: Warning: Reduce/reduce conflict in state 288 on "public" between rule 79 and rule 167 starting at line 472, column 27

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= protected . (79)
------------------------------------------------------------------------------
ConstructorModifiers ::= .ConstructorModifiers ConstructorModifier 
ConstructorModifiers ::= .ConstructorModifier 
ConstructorModifier ::= protected . (167)

GJavaParser.g:328:21:328:31:8737:8747: Warning: Reduce/reduce conflict in state 288 on "public" between rule 79 and rule 143 starting at line 437, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= protected . (79)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= protected . (143)

GJavaParser.g:328:21:328:31:8737:8747: Warning: Reduce/reduce conflict in state 288 on "public" between rule 79 and rule 117 starting at line 392, column 21

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= protected . (79)
------------------------------------------------------------------------------
FieldModifiers ::= .FieldModifiers FieldModifier 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= protected . (117)

GJavaParser.g:328:21:328:31:8737:8747: Warning: Reduce/reduce conflict in state 288 on "protected" between rule 79 and rule 187 starting at line 506, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= protected . (79)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= protected . (187)

GJavaParser.g:328:21:328:31:8737:8747: Warning: Reduce/reduce conflict in state 288 on "protected" between rule 79 and rule 167 starting at line 472, column 27

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= protected . (79)
------------------------------------------------------------------------------
ConstructorModifiers ::= .ConstructorModifiers ConstructorModifier 
ConstructorModifiers ::= .ConstructorModifier 
ConstructorModifier ::= protected . (167)

GJavaParser.g:328:21:328:31:8737:8747: Warning: Reduce/reduce conflict in state 288 on "protected" between rule 79 and rule 143 starting at line 437, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= protected . (79)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= protected . (143)

GJavaParser.g:328:21:328:31:8737:8747: Warning: Reduce/reduce conflict in state 288 on "protected" between rule 79 and rule 117 starting at line 392, column 21

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= protected . (79)
------------------------------------------------------------------------------
FieldModifiers ::= .FieldModifiers FieldModifier 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= protected . (117)

GJavaParser.g:328:21:328:31:8737:8747: Warning: Reduce/reduce conflict in state 288 on "private" between rule 79 and rule 187 starting at line 506, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= protected . (79)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= protected . (187)

GJavaParser.g:328:21:328:31:8737:8747: Warning: Reduce/reduce conflict in state 288 on "private" between rule 79 and rule 167 starting at line 472, column 27

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= protected . (79)
------------------------------------------------------------------------------
ConstructorModifiers ::= .ConstructorModifiers ConstructorModifier 
ConstructorModifiers ::= .ConstructorModifier 
ConstructorModifier ::= protected . (167)

GJavaParser.g:328:21:328:31:8737:8747: Warning: Reduce/reduce conflict in state 288 on "private" between rule 79 and rule 143 starting at line 437, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= protected . (79)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= protected . (143)

GJavaParser.g:328:21:328:31:8737:8747: Warning: Reduce/reduce conflict in state 288 on "private" between rule 79 and rule 117 starting at line 392, column 21

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= protected . (79)
------------------------------------------------------------------------------
FieldModifiers ::= .FieldModifiers FieldModifier 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= protected . (117)

GJavaParser.g:328:21:328:31:8737:8747: Warning: Reduce/reduce conflict in state 288 on "abstract" between rule 79 and rule 187 starting at line 506, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= protected . (79)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= protected . (187)

GJavaParser.g:328:21:328:31:8737:8747: Warning: Reduce/reduce conflict in state 288 on "abstract" between rule 79 and rule 143 starting at line 437, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= protected . (79)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= protected . (143)

GJavaParser.g:328:21:328:31:8737:8747: Warning: Reduce/reduce conflict in state 288 on "AT" between rule 79 and rule 187 starting at line 506, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= protected . (79)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= protected . (187)

GJavaParser.g:328:21:328:31:8737:8747: Warning: Reduce/reduce conflict in state 288 on "AT" between rule 79 and rule 167 starting at line 472, column 27

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= protected . (79)
------------------------------------------------------------------------------
ConstructorModifiers ::= .ConstructorModifiers ConstructorModifier 
ConstructorModifiers ::= .ConstructorModifier 
ConstructorModifier ::= protected . (167)

GJavaParser.g:328:21:328:31:8737:8747: Warning: Reduce/reduce conflict in state 288 on "AT" between rule 79 and rule 143 starting at line 437, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= protected . (79)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= protected . (143)

GJavaParser.g:328:21:328:31:8737:8747: Warning: Reduce/reduce conflict in state 288 on "AT" between rule 79 and rule 117 starting at line 392, column 21

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= protected . (79)
------------------------------------------------------------------------------
FieldModifiers ::= .FieldModifiers FieldModifier 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= protected . (117)




STATE 289 ----------------------------------------------------------------------
( 254 270 291 )

ClassModifier ::= public . (78)
FieldModifier ::= public . (116)
MethodModifier ::= public . (142)
ConstructorModifier ::= public . (166)
InterfaceModifier ::= public . (186)

GJavaParser.g:391:21:391:28:10680:10687: Warning: Reduce/reduce conflict in state 289 on "short" between rule 116 and rule 142 starting at line 436, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= public . (116)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= public . (142)

GJavaParser.g:391:21:391:28:10680:10687: Warning: Reduce/reduce conflict in state 289 on "long" between rule 116 and rule 142 starting at line 436, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= public . (116)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= public . (142)

GJavaParser.g:391:21:391:28:10680:10687: Warning: Reduce/reduce conflict in state 289 on "int" between rule 116 and rule 142 starting at line 436, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= public . (116)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= public . (142)

GJavaParser.g:391:21:391:28:10680:10687: Warning: Reduce/reduce conflict in state 289 on "float" between rule 116 and rule 142 starting at line 436, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= public . (116)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= public . (142)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 289 on "final" between rule 78 and rule 142 starting at line 436, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= public . (142)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 289 on "final" between rule 78 and rule 116 starting at line 391, column 21

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
FieldModifiers ::= .FieldModifiers FieldModifier 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= public . (116)

GJavaParser.g:391:21:391:28:10680:10687: Warning: Reduce/reduce conflict in state 289 on "double" between rule 116 and rule 142 starting at line 436, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= public . (116)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= public . (142)

GJavaParser.g:391:21:391:28:10680:10687: Warning: Reduce/reduce conflict in state 289 on "char" between rule 116 and rule 142 starting at line 436, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= public . (116)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= public . (142)

GJavaParser.g:391:21:391:28:10680:10687: Warning: Reduce/reduce conflict in state 289 on "byte" between rule 116 and rule 142 starting at line 436, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= public . (116)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= public . (142)

GJavaParser.g:391:21:391:28:10680:10687: Warning: Reduce/reduce conflict in state 289 on "boolean" between rule 116 and rule 142 starting at line 436, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= public . (116)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= public . (142)

GJavaParser.g:391:21:391:28:10680:10687: Warning: Reduce/reduce conflict in state 289 on "IDENTIFIER" between rule 116 and rule 166 starting at line 471, column 27

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= public . (116)
------------------------------------------------------------------------------
ConstructorDeclaration ::= .ConstructorModifiersopt ConstructorDeclarator 
                           Throwsopt ConstructorBody 
ConstructorModifiersopt ::= .ConstructorModifiers 
ConstructorModifiers ::= .ConstructorModifier 
ConstructorModifier ::= public . (166)

GJavaParser.g:391:21:391:28:10680:10687: Warning: Reduce/reduce conflict in state 289 on "IDENTIFIER" between rule 116 and rule 142 starting at line 436, column 22

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= public . (116)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= public . (142)

GJavaParser.g:436:22:436:29:12074:12081: Warning: Reduce/reduce conflict in state 289 on "LESS" between rule 142 and rule 166 starting at line 471, column 27

MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= public . (142)
------------------------------------------------------------------------------
ConstructorDeclaration ::= .ConstructorModifiersopt ConstructorDeclarator 
                           Throwsopt ConstructorBody 
ConstructorModifiersopt ::= .ConstructorModifiers 
ConstructorModifiers ::= .ConstructorModifier 
ConstructorModifier ::= public . (166)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 289 on "strictfp" between rule 78 and rule 186 starting at line 505, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= public . (186)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 289 on "strictfp" between rule 78 and rule 142 starting at line 436, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= public . (142)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 289 on "static" between rule 78 and rule 186 starting at line 505, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= public . (186)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 289 on "static" between rule 78 and rule 142 starting at line 436, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= public . (142)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 289 on "static" between rule 78 and rule 116 starting at line 391, column 21

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
FieldModifiers ::= .FieldModifiers FieldModifier 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= public . (116)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 289 on "public" between rule 78 and rule 186 starting at line 505, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= public . (186)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 289 on "public" between rule 78 and rule 166 starting at line 471, column 27

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
ConstructorModifiers ::= .ConstructorModifiers ConstructorModifier 
ConstructorModifiers ::= .ConstructorModifier 
ConstructorModifier ::= public . (166)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 289 on "public" between rule 78 and rule 142 starting at line 436, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= public . (142)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 289 on "public" between rule 78 and rule 116 starting at line 391, column 21

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
FieldModifiers ::= .FieldModifiers FieldModifier 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= public . (116)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 289 on "protected" between rule 78 and rule 186 starting at line 505, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= public . (186)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 289 on "protected" between rule 78 and rule 166 starting at line 471, column 27

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
ConstructorModifiers ::= .ConstructorModifiers ConstructorModifier 
ConstructorModifiers ::= .ConstructorModifier 
ConstructorModifier ::= public . (166)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 289 on "protected" between rule 78 and rule 142 starting at line 436, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= public . (142)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 289 on "protected" between rule 78 and rule 116 starting at line 391, column 21

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
FieldModifiers ::= .FieldModifiers FieldModifier 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= public . (116)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 289 on "private" between rule 78 and rule 186 starting at line 505, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= public . (186)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 289 on "private" between rule 78 and rule 166 starting at line 471, column 27

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
ConstructorModifiers ::= .ConstructorModifiers ConstructorModifier 
ConstructorModifiers ::= .ConstructorModifier 
ConstructorModifier ::= public . (166)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 289 on "private" between rule 78 and rule 142 starting at line 436, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= public . (142)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 289 on "private" between rule 78 and rule 116 starting at line 391, column 21

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
FieldModifiers ::= .FieldModifiers FieldModifier 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= public . (116)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 289 on "abstract" between rule 78 and rule 186 starting at line 505, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= public . (186)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 289 on "abstract" between rule 78 and rule 142 starting at line 436, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= public . (142)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 289 on "AT" between rule 78 and rule 186 starting at line 505, column 25

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= public . (186)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 289 on "AT" between rule 78 and rule 166 starting at line 471, column 27

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
ConstructorModifiers ::= .ConstructorModifiers ConstructorModifier 
ConstructorModifiers ::= .ConstructorModifier 
ConstructorModifier ::= public . (166)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 289 on "AT" between rule 78 and rule 142 starting at line 436, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= public . (142)

GJavaParser.g:327:21:327:28:8708:8715: Warning: Reduce/reduce conflict in state 289 on "AT" between rule 78 and rule 116 starting at line 391, column 21

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= public . (78)
------------------------------------------------------------------------------
FieldModifiers ::= .FieldModifiers FieldModifier 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= public . (116)




STATE 290 ----------------------------------------------------------------------
( 254 270 291 )

ClassModifier ::= Annotation . (77)
FieldModifier ::= Annotation . (115)
InterfaceModifier ::= Annotation . (185)
Annotations ::= Annotation . (227)

GJavaParser.g:390:19:390:32:10645:10658: Warning: Reduce/reduce conflict in state 290 on "IDENTIFIER" between rule 115 and rule 227 starting at line 567, column 17

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= Annotation . (115)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= .Annotations 
Annotations ::= Annotation . (227)

GJavaParser.g:326:19:326:32:8673:8686: Warning: Reduce/reduce conflict in state 290 on "strictfp" between rule 77 and rule 227 starting at line 567, column 17

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= Annotation . (77)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= .Annotations 
Annotations ::= Annotation . (227)

GJavaParser.g:326:19:326:32:8673:8686: Warning: Reduce/reduce conflict in state 290 on "strictfp" between rule 77 and rule 185 starting at line 504, column 23

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= Annotation . (77)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= Annotation . (185)

GJavaParser.g:326:19:326:32:8673:8686: Warning: Reduce/reduce conflict in state 290 on "static" between rule 77 and rule 227 starting at line 567, column 17

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= Annotation . (77)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= .Annotations 
Annotations ::= Annotation . (227)

GJavaParser.g:326:19:326:32:8673:8686: Warning: Reduce/reduce conflict in state 290 on "static" between rule 77 and rule 185 starting at line 504, column 23

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= Annotation . (77)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= Annotation . (185)

GJavaParser.g:326:19:326:32:8673:8686: Warning: Reduce/reduce conflict in state 290 on "static" between rule 77 and rule 115 starting at line 390, column 19

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= Annotation . (77)
------------------------------------------------------------------------------
FieldModifiers ::= .FieldModifiers FieldModifier 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= Annotation . (115)

GJavaParser.g:390:19:390:32:10645:10658: Warning: Reduce/reduce conflict in state 290 on "short" between rule 115 and rule 227 starting at line 567, column 17

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= Annotation . (115)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= .Annotations 
Annotations ::= Annotation . (227)

GJavaParser.g:326:19:326:32:8673:8686: Warning: Reduce/reduce conflict in state 290 on "public" between rule 77 and rule 227 starting at line 567, column 17

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= Annotation . (77)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= .Annotations 
Annotations ::= Annotation . (227)

GJavaParser.g:326:19:326:32:8673:8686: Warning: Reduce/reduce conflict in state 290 on "public" between rule 77 and rule 185 starting at line 504, column 23

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= Annotation . (77)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= Annotation . (185)

GJavaParser.g:326:19:326:32:8673:8686: Warning: Reduce/reduce conflict in state 290 on "public" between rule 77 and rule 115 starting at line 390, column 19

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= Annotation . (77)
------------------------------------------------------------------------------
FieldModifiers ::= .FieldModifiers FieldModifier 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= Annotation . (115)

GJavaParser.g:326:19:326:32:8673:8686: Warning: Reduce/reduce conflict in state 290 on "protected" between rule 77 and rule 227 starting at line 567, column 17

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= Annotation . (77)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= .Annotations 
Annotations ::= Annotation . (227)

GJavaParser.g:326:19:326:32:8673:8686: Warning: Reduce/reduce conflict in state 290 on "protected" between rule 77 and rule 185 starting at line 504, column 23

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= Annotation . (77)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= Annotation . (185)

GJavaParser.g:326:19:326:32:8673:8686: Warning: Reduce/reduce conflict in state 290 on "protected" between rule 77 and rule 115 starting at line 390, column 19

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= Annotation . (77)
------------------------------------------------------------------------------
FieldModifiers ::= .FieldModifiers FieldModifier 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= Annotation . (115)

GJavaParser.g:326:19:326:32:8673:8686: Warning: Reduce/reduce conflict in state 290 on "private" between rule 77 and rule 227 starting at line 567, column 17

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= Annotation . (77)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= .Annotations 
Annotations ::= Annotation . (227)

GJavaParser.g:326:19:326:32:8673:8686: Warning: Reduce/reduce conflict in state 290 on "private" between rule 77 and rule 185 starting at line 504, column 23

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= Annotation . (77)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= Annotation . (185)

GJavaParser.g:326:19:326:32:8673:8686: Warning: Reduce/reduce conflict in state 290 on "private" between rule 77 and rule 115 starting at line 390, column 19

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= Annotation . (77)
------------------------------------------------------------------------------
FieldModifiers ::= .FieldModifiers FieldModifier 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= Annotation . (115)

GJavaParser.g:390:19:390:32:10645:10658: Warning: Reduce/reduce conflict in state 290 on "long" between rule 115 and rule 227 starting at line 567, column 17

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= Annotation . (115)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= .Annotations 
Annotations ::= Annotation . (227)

GJavaParser.g:390:19:390:32:10645:10658: Warning: Reduce/reduce conflict in state 290 on "int" between rule 115 and rule 227 starting at line 567, column 17

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= Annotation . (115)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= .Annotations 
Annotations ::= Annotation . (227)

GJavaParser.g:390:19:390:32:10645:10658: Warning: Reduce/reduce conflict in state 290 on "float" between rule 115 and rule 227 starting at line 567, column 17

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= Annotation . (115)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= .Annotations 
Annotations ::= Annotation . (227)

GJavaParser.g:326:19:326:32:8673:8686: Warning: Reduce/reduce conflict in state 290 on "final" between rule 77 and rule 227 starting at line 567, column 17

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= Annotation . (77)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= .Annotations 
Annotations ::= Annotation . (227)

GJavaParser.g:326:19:326:32:8673:8686: Warning: Reduce/reduce conflict in state 290 on "final" between rule 77 and rule 115 starting at line 390, column 19

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= Annotation . (77)
------------------------------------------------------------------------------
FieldModifiers ::= .FieldModifiers FieldModifier 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= Annotation . (115)

GJavaParser.g:390:19:390:32:10645:10658: Warning: Reduce/reduce conflict in state 290 on "double" between rule 115 and rule 227 starting at line 567, column 17

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= Annotation . (115)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= .Annotations 
Annotations ::= Annotation . (227)

GJavaParser.g:390:19:390:32:10645:10658: Warning: Reduce/reduce conflict in state 290 on "char" between rule 115 and rule 227 starting at line 567, column 17

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= Annotation . (115)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= .Annotations 
Annotations ::= Annotation . (227)

GJavaParser.g:390:19:390:32:10645:10658: Warning: Reduce/reduce conflict in state 290 on "byte" between rule 115 and rule 227 starting at line 567, column 17

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= Annotation . (115)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= .Annotations 
Annotations ::= Annotation . (227)

GJavaParser.g:390:19:390:32:10645:10658: Warning: Reduce/reduce conflict in state 290 on "boolean" between rule 115 and rule 227 starting at line 567, column 17

FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= .FieldModifiers 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= Annotation . (115)
------------------------------------------------------------------------------
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= .MethodModifiers 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= .Annotations 
Annotations ::= Annotation . (227)

GJavaParser.g:326:19:326:32:8673:8686: Warning: Reduce/reduce conflict in state 290 on "abstract" between rule 77 and rule 227 starting at line 567, column 17

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= Annotation . (77)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= .Annotations 
Annotations ::= Annotation . (227)

GJavaParser.g:326:19:326:32:8673:8686: Warning: Reduce/reduce conflict in state 290 on "abstract" between rule 77 and rule 185 starting at line 504, column 23

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= Annotation . (77)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= Annotation . (185)

GJavaParser.g:326:19:326:32:8673:8686: Warning: Reduce/reduce conflict in state 290 on "AT" between rule 77 and rule 227 starting at line 567, column 17

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= Annotation . (77)
------------------------------------------------------------------------------
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= .MethodModifier 
MethodModifier ::= .Annotations 
Annotations ::= Annotation . (227)

GJavaParser.g:326:19:326:32:8673:8686: Warning: Reduce/reduce conflict in state 290 on "AT" between rule 77 and rule 185 starting at line 504, column 23

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= Annotation . (77)
------------------------------------------------------------------------------
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifier ::= Annotation . (185)

GJavaParser.g:326:19:326:32:8673:8686: Warning: Reduce/reduce conflict in state 290 on "AT" between rule 77 and rule 115 starting at line 390, column 19

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= Annotation . (77)
------------------------------------------------------------------------------
FieldModifiers ::= .FieldModifiers FieldModifier 
FieldModifiers ::= .FieldModifier 
FieldModifier ::= Annotation . (115)




STATE 291 ----------------------------------------------------------------------
( 254 270 )

ClassBodyDeclarations ::= ClassBodyDeclarations  .ClassBodyDeclaration 
ClassBodyDeclarationsopt ::= ClassBodyDeclarations . (513)

ClassDeclaration ::= .NormalClassDeclaration 
ClassDeclaration ::= .EnumDeclaration 
NormalClassDeclaration ::= .ClassModifiersopt class identifier 
                           TypeParametersopt Superopt Interfacesopt ClassBody 
ClassModifiers ::= .ClassModifier 
ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifier ::= .Annotation 
ClassModifier ::= .public 
ClassModifier ::= .protected 
ClassModifier ::= .private 
ClassModifier ::= .abstract 
ClassModifier ::= .static 
ClassModifier ::= .final 
ClassModifier ::= .strictfp 
ClassBodyDeclaration ::= .ClassMemberDeclaration 
ClassBodyDeclaration ::= .InstanceInitializer 
ClassBodyDeclaration ::= .StaticInitializer 
ClassBodyDeclaration ::= .ConstructorDeclaration 
ClassMemberDeclaration ::= .FieldDeclaration 
ClassMemberDeclaration ::= .MethodDeclaration 
ClassMemberDeclaration ::= .ClassDeclaration 
ClassMemberDeclaration ::= .InterfaceDeclaration 
ClassMemberDeclaration ::= .SEMICOLON 
FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiers ::= .FieldModifier 
FieldModifiers ::= .FieldModifiers FieldModifier 
FieldModifier ::= .Annotation 
FieldModifier ::= .public 
FieldModifier ::= .protected 
FieldModifier ::= .private 
FieldModifier ::= .static 
FieldModifier ::= .final 
FieldModifier ::= .transient 
FieldModifier ::= .volatile 
MethodDeclaration ::= .MethodHeader MethodBody 
MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiers ::= .MethodModifier 
MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifier ::= .Annotations 
MethodModifier ::= .public 
MethodModifier ::= .protected 
MethodModifier ::= .private 
MethodModifier ::= .abstract 
MethodModifier ::= .static 
MethodModifier ::= .final 
MethodModifier ::= .synchronized 
MethodModifier ::= .native 
MethodModifier ::= .strictfp 
InstanceInitializer ::= .Block 
StaticInitializer ::= .static Block 
ConstructorDeclaration ::= .ConstructorModifiersopt ConstructorDeclarator 
                           Throwsopt ConstructorBody 
ConstructorModifiers ::= .ConstructorModifier 
ConstructorModifiers ::= .ConstructorModifiers ConstructorModifier 
ConstructorModifier ::= .Annotations 
ConstructorModifier ::= .public 
ConstructorModifier ::= .protected 
ConstructorModifier ::= .private 
EnumDeclaration ::= .ClassModifiersopt enum identifier Interfacesopt EnumBody 
InterfaceDeclaration ::= .NormalInterfaceDeclaration 
InterfaceDeclaration ::= .AnnotationTypeDeclaration 
NormalInterfaceDeclaration ::= .InterfaceModifiersopt interface identifier 
                               TypeParametersopt ExtendsInterfacesopt 
                               InterfaceBody 
InterfaceModifiers ::= .InterfaceModifier 
InterfaceModifiers ::= .InterfaceModifiers InterfaceModifier 
InterfaceModifier ::= .Annotation 
InterfaceModifier ::= .public 
InterfaceModifier ::= .protected 
InterfaceModifier ::= .private 
InterfaceModifier ::= .abstract 
InterfaceModifier ::= .static 
InterfaceModifier ::= .strictfp 
AnnotationTypeDeclaration ::= .InterfaceModifiersopt AT interface identifier 
                              AnnotationTypeBody 
Annotations ::= .Annotation 
Annotations ::= .Annotations Annotation 
Annotation ::= .NormalAnnotation 
Annotation ::= .MarkerAnnotation 
Annotation ::= .SingleElementAnnotation 
NormalAnnotation ::= .AT TypeName LPAREN ElementValuePairsopt RPAREN 
MarkerAnnotation ::= .AT TypeName 
SingleElementAnnotation ::= .AT TypeName LPAREN ElementValue RPAREN 
Block ::= .LBRACE BlockStatementsopt RBRACE 
InterfaceModifiersopt ::= . (482)
InterfaceModifiersopt ::= .InterfaceModifiers 
ConstructorModifiersopt ::= . (500)
ConstructorModifiersopt ::= .ConstructorModifiers 
MethodModifiersopt ::= . (508)
MethodModifiersopt ::= .MethodModifiers 
FieldModifiersopt ::= . (510)
FieldModifiersopt ::= .FieldModifiers 
ClassModifiersopt ::= . (520)
ClassModifiersopt ::= .ClassModifiers 

GJavaParser.g:1007:27:1007:36:32114:32123: Warning: Shift/reduce conflict in state 291 on "AT" with rule 482

AnnotationTypeDeclaration ::= .InterfaceModifiersopt AT interface identifier 
                              AnnotationTypeBody 
InterfaceModifiersopt ::= . (482)

GJavaParser.g:1046:24:1046:33:33062:33071: Warning: Reduce/reduce conflict in state 291 on "short" between rule 508 and rule 510 starting at line 1049, column 23

MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= . (508)
------------------------------------------------------------------------------
FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= . (510)

GJavaParser.g:1046:24:1046:33:33062:33071: Warning: Reduce/reduce conflict in state 291 on "long" between rule 508 and rule 510 starting at line 1049, column 23

MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= . (508)
------------------------------------------------------------------------------
FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= . (510)

GJavaParser.g:1046:24:1046:33:33062:33071: Warning: Reduce/reduce conflict in state 291 on "int" between rule 508 and rule 510 starting at line 1049, column 23

MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= . (508)
------------------------------------------------------------------------------
FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= . (510)

GJavaParser.g:1046:24:1046:33:33062:33071: Warning: Reduce/reduce conflict in state 291 on "float" between rule 508 and rule 510 starting at line 1049, column 23

MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= . (508)
------------------------------------------------------------------------------
FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= . (510)

GJavaParser.g:1046:24:1046:33:33062:33071: Warning: Reduce/reduce conflict in state 291 on "double" between rule 508 and rule 510 starting at line 1049, column 23

MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= . (508)
------------------------------------------------------------------------------
FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= . (510)

GJavaParser.g:1046:24:1046:33:33062:33071: Warning: Reduce/reduce conflict in state 291 on "char" between rule 508 and rule 510 starting at line 1049, column 23

MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= . (508)
------------------------------------------------------------------------------
FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= . (510)

GJavaParser.g:1046:24:1046:33:33062:33071: Warning: Reduce/reduce conflict in state 291 on "byte" between rule 508 and rule 510 starting at line 1049, column 23

MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= . (508)
------------------------------------------------------------------------------
FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= . (510)

GJavaParser.g:1046:24:1046:33:33062:33071: Warning: Reduce/reduce conflict in state 291 on "boolean" between rule 508 and rule 510 starting at line 1049, column 23

MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= . (508)
------------------------------------------------------------------------------
FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= . (510)

GJavaParser.g:1046:24:1046:33:33062:33071: Warning: Reduce/reduce conflict in state 291 on "IDENTIFIER" between rule 508 and rule 500 starting at line 1034, column 29

MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= . (508)
------------------------------------------------------------------------------
ConstructorDeclaration ::= .ConstructorModifiersopt ConstructorDeclarator 
                           Throwsopt ConstructorBody 
ConstructorModifiersopt ::= . (500)

GJavaParser.g:1046:24:1046:33:33062:33071: Warning: Reduce/reduce conflict in state 291 on "IDENTIFIER" between rule 508 and rule 510 starting at line 1049, column 23

MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= . (508)
------------------------------------------------------------------------------
FieldDeclaration ::= .FieldModifiersopt Type VariableDeclarators SEMICOLON 
FieldModifiersopt ::= . (510)

GJavaParser.g:1046:24:1046:33:33062:33071: Warning: Reduce/reduce conflict in state 291 on "LESS" between rule 508 and rule 500 starting at line 1034, column 29

MethodHeader ::= .MethodModifiersopt TypeParametersopt ResultType 
                 MethodDeclarator Throwsopt 
MethodModifiersopt ::= . (508)
------------------------------------------------------------------------------
ConstructorDeclaration ::= .ConstructorModifiersopt ConstructorDeclarator 
                           Throwsopt ConstructorBody 
ConstructorModifiersopt ::= . (500)




STATE 302 ----------------------------------------------------------------------
( 274 )

ConstructorModifier ::= Annotations . (165)
Annotations ::= Annotations  .Annotation 

Annotation ::= .NormalAnnotation 
Annotation ::= .MarkerAnnotation 
Annotation ::= .SingleElementAnnotation 
NormalAnnotation ::= .AT TypeName LPAREN ElementValuePairsopt RPAREN 
MarkerAnnotation ::= .AT TypeName 
SingleElementAnnotation ::= .AT TypeName LPAREN ElementValue RPAREN 

GJavaParser.g:470:25:470:39:13079:13093: Warning: Shift/reduce conflict in state 302 on "AT" with rule 165

ConstructorModifiers ::= .ConstructorModifiers ConstructorModifier 
ConstructorModifiers ::= ConstructorModifiers  .ConstructorModifier 
ConstructorModifier ::= Annotations . (165)




STATE 322 ----------------------------------------------------------------------
( 276 312 332 353 387 400 435 437 442 453 465 )

TypeName ::= identifier . (27)
TypeVariable ::= identifier . (30)
ExpressionName ::= identifier . (47)
MethodName ::= identifier . (49)
AmbiguousName ::= identifier . (53)
LabeledStatement ::= identifier  .COLON Statement 

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 322 on "LBRACKET" between rule 27 and rule 47 starting at line 275, column 20

ArrayType ::= .Type LBRACKET RBRACKET 
Type ::= .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
ArrayAccess ::= .ExpressionName LBRACKET Expression RBRACKET 
ExpressionName ::= identifier . (47)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 322 on "LBRACKET" between rule 27 and rule 30 starting at line 236, column 18

ArrayType ::= .Type LBRACKET RBRACKET 
Type ::= .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
ArrayType ::= .Type LBRACKET RBRACKET 
Type ::= .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 322 on "DOT" between rule 27 and rule 53 starting at line 284, column 19

PrimaryNoNewArray ::= .Type DOT class 
Type ::= .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
ExpressionName ::= .AmbiguousName DOT identifier 
AmbiguousName ::= identifier . (53)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 322 on "DOT" between rule 27 and rule 30 starting at line 236, column 18

PrimaryNoNewArray ::= .Type DOT class 
Type ::= .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
PrimaryNoNewArray ::= .Type DOT class 
Type ::= .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)




STATE 327 ----------------------------------------------------------------------
( 276 332 387 435 453 )

ClassModifier ::= Annotation . (77)
Annotations ::= Annotation . (227)

GJavaParser.g:326:19:326:32:8673:8686: Warning: Reduce/reduce conflict in state 327 on "final" between rule 77 and rule 227 starting at line 567, column 17

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= Annotation . (77)
------------------------------------------------------------------------------
VariableModifiers ::= .VariableModifiers VariableModifier 
VariableModifiers ::= .VariableModifier 
VariableModifier ::= .Annotations 
Annotations ::= Annotation . (227)

GJavaParser.g:326:19:326:32:8673:8686: Warning: Reduce/reduce conflict in state 327 on "AT" between rule 77 and rule 227 starting at line 567, column 17

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= Annotation . (77)
------------------------------------------------------------------------------
VariableModifiers ::= .VariableModifiers VariableModifier 
VariableModifiers ::= .VariableModifier 
VariableModifier ::= .Annotations 
Annotations ::= Annotation . (227)




STATE 328 ----------------------------------------------------------------------
( 276 330 332 356 365 368 387 394 406 435 438 453 )

VariableModifier ::= Annotations . (137)
Annotations ::= Annotations  .Annotation 

Annotation ::= .NormalAnnotation 
Annotation ::= .MarkerAnnotation 
Annotation ::= .SingleElementAnnotation 
NormalAnnotation ::= .AT TypeName LPAREN ElementValuePairsopt RPAREN 
MarkerAnnotation ::= .AT TypeName 
SingleElementAnnotation ::= .AT TypeName LPAREN ElementValue RPAREN 

GJavaParser.g:422:24:422:36:11673:11685: Warning: Shift/reduce conflict in state 328 on "AT" with rule 137

VariableModifiers ::= .VariableModifiers VariableModifier 
VariableModifiers ::= .VariableModifier 
VariableModifier ::= Annotations . (137)




STATE 329 ----------------------------------------------------------------------
( 276 332 387 435 453 )

ClassModifier ::= final . (83)
VariableModifier ::= final . (136)

GJavaParser.g:332:21:332:27:8859:8865: Warning: Reduce/reduce conflict in state 329 on "final" between rule 83 and rule 136 starting at line 421, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= final . (83)
------------------------------------------------------------------------------
VariableModifiers ::= .VariableModifiers VariableModifier 
VariableModifiers ::= .VariableModifier 
VariableModifier ::= final . (136)

GJavaParser.g:332:21:332:27:8859:8865: Warning: Reduce/reduce conflict in state 329 on "AT" between rule 83 and rule 136 starting at line 421, column 22

ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifiers ::= .ClassModifier 
ClassModifier ::= final . (83)
------------------------------------------------------------------------------
VariableModifiers ::= .VariableModifiers VariableModifier 
VariableModifiers ::= .VariableModifier 
VariableModifier ::= final . (136)




STATE 332 ----------------------------------------------------------------------
( 276 387 )

BlockStatements ::= BlockStatements  .BlockStatement 
BlockStatementsopt ::= BlockStatements . (497)

identifier ::= .IDENTIFIER 
Type ::= .PrimitiveType 
Type ::= .ReferenceType 
PrimitiveType ::= .NumericType 
PrimitiveType ::= .boolean 
NumericType ::= .IntegralType 
NumericType ::= .FloatingPointType 
IntegralType ::= .byte 
IntegralType ::= .short 
IntegralType ::= .int 
IntegralType ::= .long 
IntegralType ::= .char 
FloatingPointType ::= .float 
FloatingPointType ::= .double 
ReferenceType ::= .ClassOrInterfaceType 
ReferenceType ::= .TypeVariable 
ReferenceType ::= .ArrayType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= .identifier 
TypeName ::= .TypeName DOT identifier 
ClassName ::= .TypeName 
TypeVariable ::= .identifier 
ArrayType ::= .Type LBRACKET RBRACKET 
ExpressionName ::= .identifier 
ExpressionName ::= .AmbiguousName DOT identifier 
MethodName ::= .identifier 
MethodName ::= .AmbiguousName DOT identifier 
AmbiguousName ::= .identifier 
AmbiguousName ::= .AmbiguousName DOT identifier 
ClassDeclaration ::= .NormalClassDeclaration 
ClassDeclaration ::= .EnumDeclaration 
NormalClassDeclaration ::= .ClassModifiersopt class identifier 
                           TypeParametersopt Superopt Interfacesopt ClassBody 
ClassModifiers ::= .ClassModifier 
ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifier ::= .Annotation 
ClassModifier ::= .public 
ClassModifier ::= .protected 
ClassModifier ::= .private 
ClassModifier ::= .abstract 
ClassModifier ::= .static 
ClassModifier ::= .final 
ClassModifier ::= .strictfp 
VariableModifiers ::= .VariableModifier 
VariableModifiers ::= .VariableModifiers VariableModifier 
VariableModifier ::= .final 
VariableModifier ::= .Annotations 
EnumDeclaration ::= .ClassModifiersopt enum identifier Interfacesopt EnumBody 
Annotations ::= .Annotation 
Annotations ::= .Annotations Annotation 
Annotation ::= .NormalAnnotation 
Annotation ::= .MarkerAnnotation 
Annotation ::= .SingleElementAnnotation 
NormalAnnotation ::= .AT TypeName LPAREN ElementValuePairsopt RPAREN 
MarkerAnnotation ::= .AT TypeName 
SingleElementAnnotation ::= .AT TypeName LPAREN ElementValue RPAREN 
Block ::= .LBRACE BlockStatementsopt RBRACE 
BlockStatement ::= .LocalVariableDeclarationStatement 
BlockStatement ::= .ClassDeclaration 
BlockStatement ::= .Statement 
LocalVariableDeclarationStatement ::= .LocalVariableDeclaration SEMICOLON 
LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
Statement ::= .StatementWithoutTrailingSubstatement 
Statement ::= .LabeledStatement 
Statement ::= .IfThenStatement 
Statement ::= .IfThenElseStatement 
Statement ::= .WhileStatement 
Statement ::= .ForStatement 
StatementWithoutTrailingSubstatement ::= .Block 
StatementWithoutTrailingSubstatement ::= .EmptyStatement 
StatementWithoutTrailingSubstatement ::= .ExpressionStatement 
StatementWithoutTrailingSubstatement ::= .AssertStatement 
StatementWithoutTrailingSubstatement ::= .SwitchStatement 
StatementWithoutTrailingSubstatement ::= .DoStatement 
StatementWithoutTrailingSubstatement ::= .BreakStatement 
StatementWithoutTrailingSubstatement ::= .ContinueStatement 
StatementWithoutTrailingSubstatement ::= .ReturnStatement 
StatementWithoutTrailingSubstatement ::= .SynchronizedStatement 
StatementWithoutTrailingSubstatement ::= .ThrowStatement 
StatementWithoutTrailingSubstatement ::= .TryStatement 
IfThenStatement ::= .if LPAREN Expression RPAREN Statement 
IfThenElseStatement ::= .if LPAREN Expression RPAREN StatementNoShortIf else 
                        Statement 
EmptyStatement ::= .SEMICOLON 
LabeledStatement ::= .identifier COLON Statement 
ExpressionStatement ::= .StatementExpression SEMICOLON 
StatementExpression ::= .Assignment 
StatementExpression ::= .PreIncrementExpression 
StatementExpression ::= .PreDecrementExpression 
StatementExpression ::= .PostIncrementExpression 
StatementExpression ::= .PostDecrementExpression 
StatementExpression ::= .MethodInvocation 
StatementExpression ::= .ClassInstanceCreationExpression 
AssertStatement ::= .assert Expression SEMICOLON 
AssertStatement ::= .assert Expression COLON Expression SEMICOLON 
SwitchStatement ::= .switch LPAREN Expression RPAREN SwitchBlock 
WhileStatement ::= .while LPAREN Expression RPAREN Statement 
DoStatement ::= .do Statement while LPAREN Expression RPAREN SEMICOLON 
ForStatement ::= .BasicForStatement 
ForStatement ::= .EnhancedForStatement 
BasicForStatement ::= .for LPAREN ForInitopt SEMICOLON Expressionopt SEMICOLON 
                      ForUpdateopt RPAREN Statement 
EnhancedForStatement ::= .for LPAREN FormalParameter COLON Expression RPAREN 
                         Statement 
BreakStatement ::= .break identifieropt SEMICOLON 
ContinueStatement ::= .continue identifieropt SEMICOLON 
ReturnStatement ::= .return Expressionopt SEMICOLON 
ThrowStatement ::= .throw Expression SEMICOLON 
SynchronizedStatement ::= .synchronized LPAREN Expression RPAREN Block 
TryStatement ::= .try Block Catches 
TryStatement ::= .try Block Catchesopt Finally 
Primary ::= .PrimaryNoNewArray 
Primary ::= .ArrayCreationExpression 
PrimaryNoNewArray ::= .Literal 
PrimaryNoNewArray ::= .Type DOT class 
PrimaryNoNewArray ::= .void DOT class 
PrimaryNoNewArray ::= .this 
PrimaryNoNewArray ::= .ClassName DOT this 
PrimaryNoNewArray ::= .LPAREN Expression RPAREN 
PrimaryNoNewArray ::= .ClassInstanceCreationExpression 
PrimaryNoNewArray ::= .FieldAccess 
PrimaryNoNewArray ::= .MethodInvocation 
PrimaryNoNewArray ::= .ArrayAccess 
Literal ::= .IntegerLiteral 
Literal ::= .LongLiteral 
Literal ::= .FloatingPointLiteral 
Literal ::= .DoubleLiteral 
Literal ::= .BooleanLiteral 
Literal ::= .CharacterLiteral 
Literal ::= .StringLiteral 
Literal ::= .null 
BooleanLiteral ::= .true 
BooleanLiteral ::= .false 
ClassInstanceCreationExpression ::= .new TypeArgumentsopt ClassOrInterfaceType 
                                    TypeArgumentsopt LPAREN ArgumentListopt 
                                    RPAREN ClassBodyopt 
ClassInstanceCreationExpression ::= .Primary DOT new TypeArgumentsopt 
                                    identifier TypeArgumentsopt LPAREN 
                                    ArgumentListopt RPAREN ClassBodyopt 
ArrayCreationExpression ::= .new PrimitiveType DimExprs Dimsopt 
ArrayCreationExpression ::= .new ClassOrInterfaceType DimExprs Dimsopt 
ArrayCreationExpression ::= .new PrimitiveType Dims ArrayInitializer 
ArrayCreationExpression ::= .new ClassOrInterfaceType Dims ArrayInitializer 
FieldAccess ::= .Primary DOT identifier 
FieldAccess ::= .super DOT identifier 
FieldAccess ::= .ClassName DOT super DOT identifier 
MethodInvocation ::= .MethodName LPAREN ArgumentListopt RPAREN 
MethodInvocation ::= .Primary DOT TypeArgumentsopt identifier LPAREN 
                     ArgumentListopt RPAREN 
MethodInvocation ::= .super DOT TypeArgumentsopt identifier LPAREN 
                     ArgumentListopt RPAREN 
MethodInvocation ::= .ClassName DOT super DOT TypeArgumentsopt identifier 
                     LPAREN ArgumentListopt RPAREN 
MethodInvocation ::= .TypeName DOT TypeArguments identifier LPAREN 
                     ArgumentListopt RPAREN 
ArrayAccess ::= .ExpressionName LBRACKET Expression RBRACKET 
ArrayAccess ::= .PrimaryNoNewArray LBRACKET Expression RBRACKET 
PostfixExpression ::= .Primary 
PostfixExpression ::= .ExpressionName 
PostfixExpression ::= .PostIncrementExpression 
PostfixExpression ::= .PostDecrementExpression 
PostIncrementExpression ::= .PostfixExpression PLUS_PLUS 
PostDecrementExpression ::= .PostfixExpression MINUS_MINUS 
PreIncrementExpression ::= .PLUS_PLUS UnaryExpression 
PreDecrementExpression ::= .MINUS_MINUS UnaryExpression 
Assignment ::= .LeftHandSide AssignmentOperator AssignmentExpression 
LeftHandSide ::= .ExpressionName 
LeftHandSide ::= .FieldAccess 
LeftHandSide ::= .ArrayAccess 
VariableModifiersopt ::= . (462)
VariableModifiersopt ::= .VariableModifiers 
ClassModifiersopt ::= . (520)
ClassModifiersopt ::= .ClassModifiers 

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 332 on "double" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 332 on "float" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 332 on "char" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 332 on "long" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 332 on "int" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 332 on "short" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 332 on "byte" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 332 on "boolean" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 332 on "IDENTIFIER" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)




STATE 334 ----------------------------------------------------------------------
( 281 )

MethodModifier ::= Annotations . (141)
Annotations ::= Annotations  .Annotation 

Annotation ::= .NormalAnnotation 
Annotation ::= .MarkerAnnotation 
Annotation ::= .SingleElementAnnotation 
NormalAnnotation ::= .AT TypeName LPAREN ElementValuePairsopt RPAREN 
MarkerAnnotation ::= .AT TypeName 
SingleElementAnnotation ::= .AT TypeName LPAREN ElementValue RPAREN 

GJavaParser.g:435:20:435:34:12037:12051: Warning: Shift/reduce conflict in state 334 on "AT" with rule 141

MethodModifiers ::= .MethodModifiers MethodModifier 
MethodModifiers ::= MethodModifiers  .MethodModifier 
MethodModifier ::= Annotations . (141)




STATE 356 ----------------------------------------------------------------------
( 325 )

BasicForStatement ::= for LPAREN  .ForInitopt SEMICOLON Expressionopt SEMICOLON 
                      ForUpdateopt RPAREN Statement 
EnhancedForStatement ::= for LPAREN  .FormalParameter COLON Expression RPAREN 
                         Statement 

identifier ::= .IDENTIFIER 
Type ::= .PrimitiveType 
Type ::= .ReferenceType 
PrimitiveType ::= .NumericType 
PrimitiveType ::= .boolean 
NumericType ::= .IntegralType 
NumericType ::= .FloatingPointType 
IntegralType ::= .byte 
IntegralType ::= .short 
IntegralType ::= .int 
IntegralType ::= .long 
IntegralType ::= .char 
FloatingPointType ::= .float 
FloatingPointType ::= .double 
ReferenceType ::= .ClassOrInterfaceType 
ReferenceType ::= .TypeVariable 
ReferenceType ::= .ArrayType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= .identifier 
TypeName ::= .TypeName DOT identifier 
ClassName ::= .TypeName 
TypeVariable ::= .identifier 
ArrayType ::= .Type LBRACKET RBRACKET 
ExpressionName ::= .identifier 
ExpressionName ::= .AmbiguousName DOT identifier 
MethodName ::= .identifier 
MethodName ::= .AmbiguousName DOT identifier 
AmbiguousName ::= .identifier 
AmbiguousName ::= .AmbiguousName DOT identifier 
FormalParameter ::= .VariableModifiersopt Type VariableDeclaratorId 
VariableModifiers ::= .VariableModifier 
VariableModifiers ::= .VariableModifiers VariableModifier 
VariableModifier ::= .final 
VariableModifier ::= .Annotations 
Annotations ::= .Annotation 
Annotations ::= .Annotations Annotation 
Annotation ::= .NormalAnnotation 
Annotation ::= .MarkerAnnotation 
Annotation ::= .SingleElementAnnotation 
NormalAnnotation ::= .AT TypeName LPAREN ElementValuePairsopt RPAREN 
MarkerAnnotation ::= .AT TypeName 
SingleElementAnnotation ::= .AT TypeName LPAREN ElementValue RPAREN 
LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
StatementExpression ::= .Assignment 
StatementExpression ::= .PreIncrementExpression 
StatementExpression ::= .PreDecrementExpression 
StatementExpression ::= .PostIncrementExpression 
StatementExpression ::= .PostDecrementExpression 
StatementExpression ::= .MethodInvocation 
StatementExpression ::= .ClassInstanceCreationExpression 
ForInit ::= .StatementExpressionList 
ForInit ::= .LocalVariableDeclaration 
StatementExpressionList ::= .StatementExpression 
StatementExpressionList ::= .StatementExpressionList COMMA StatementExpression 
Primary ::= .PrimaryNoNewArray 
Primary ::= .ArrayCreationExpression 
PrimaryNoNewArray ::= .Literal 
PrimaryNoNewArray ::= .Type DOT class 
PrimaryNoNewArray ::= .void DOT class 
PrimaryNoNewArray ::= .this 
PrimaryNoNewArray ::= .ClassName DOT this 
PrimaryNoNewArray ::= .LPAREN Expression RPAREN 
PrimaryNoNewArray ::= .ClassInstanceCreationExpression 
PrimaryNoNewArray ::= .FieldAccess 
PrimaryNoNewArray ::= .MethodInvocation 
PrimaryNoNewArray ::= .ArrayAccess 
Literal ::= .IntegerLiteral 
Literal ::= .LongLiteral 
Literal ::= .FloatingPointLiteral 
Literal ::= .DoubleLiteral 
Literal ::= .BooleanLiteral 
Literal ::= .CharacterLiteral 
Literal ::= .StringLiteral 
Literal ::= .null 
BooleanLiteral ::= .true 
BooleanLiteral ::= .false 
ClassInstanceCreationExpression ::= .new TypeArgumentsopt ClassOrInterfaceType 
                                    TypeArgumentsopt LPAREN ArgumentListopt 
                                    RPAREN ClassBodyopt 
ClassInstanceCreationExpression ::= .Primary DOT new TypeArgumentsopt 
                                    identifier TypeArgumentsopt LPAREN 
                                    ArgumentListopt RPAREN ClassBodyopt 
ArrayCreationExpression ::= .new PrimitiveType DimExprs Dimsopt 
ArrayCreationExpression ::= .new ClassOrInterfaceType DimExprs Dimsopt 
ArrayCreationExpression ::= .new PrimitiveType Dims ArrayInitializer 
ArrayCreationExpression ::= .new ClassOrInterfaceType Dims ArrayInitializer 
FieldAccess ::= .Primary DOT identifier 
FieldAccess ::= .super DOT identifier 
FieldAccess ::= .ClassName DOT super DOT identifier 
MethodInvocation ::= .MethodName LPAREN ArgumentListopt RPAREN 
MethodInvocation ::= .Primary DOT TypeArgumentsopt identifier LPAREN 
                     ArgumentListopt RPAREN 
MethodInvocation ::= .super DOT TypeArgumentsopt identifier LPAREN 
                     ArgumentListopt RPAREN 
MethodInvocation ::= .ClassName DOT super DOT TypeArgumentsopt identifier 
                     LPAREN ArgumentListopt RPAREN 
MethodInvocation ::= .TypeName DOT TypeArguments identifier LPAREN 
                     ArgumentListopt RPAREN 
ArrayAccess ::= .ExpressionName LBRACKET Expression RBRACKET 
ArrayAccess ::= .PrimaryNoNewArray LBRACKET Expression RBRACKET 
PostfixExpression ::= .Primary 
PostfixExpression ::= .ExpressionName 
PostfixExpression ::= .PostIncrementExpression 
PostfixExpression ::= .PostDecrementExpression 
PostIncrementExpression ::= .PostfixExpression PLUS_PLUS 
PostDecrementExpression ::= .PostfixExpression MINUS_MINUS 
PreIncrementExpression ::= .PLUS_PLUS UnaryExpression 
PreDecrementExpression ::= .MINUS_MINUS UnaryExpression 
Assignment ::= .LeftHandSide AssignmentOperator AssignmentExpression 
LeftHandSide ::= .ExpressionName 
LeftHandSide ::= .FieldAccess 
LeftHandSide ::= .ArrayAccess 
ForInitopt ::= . (456)
ForInitopt ::= .ForInit 
VariableModifiersopt ::= . (462)
VariableModifiersopt ::= .VariableModifiers 

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 356 on "IDENTIFIER" with rule 462

FormalParameter ::= .VariableModifiersopt Type VariableDeclaratorId 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 356 on "boolean" with rule 462

FormalParameter ::= .VariableModifiersopt Type VariableDeclaratorId 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 356 on "char" with rule 462

FormalParameter ::= .VariableModifiersopt Type VariableDeclaratorId 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 356 on "long" with rule 462

FormalParameter ::= .VariableModifiersopt Type VariableDeclaratorId 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 356 on "int" with rule 462

FormalParameter ::= .VariableModifiersopt Type VariableDeclaratorId 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 356 on "short" with rule 462

FormalParameter ::= .VariableModifiersopt Type VariableDeclaratorId 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 356 on "byte" with rule 462

FormalParameter ::= .VariableModifiersopt Type VariableDeclaratorId 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 356 on "double" with rule 462

FormalParameter ::= .VariableModifiersopt Type VariableDeclaratorId 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 356 on "float" with rule 462

FormalParameter ::= .VariableModifiersopt Type VariableDeclaratorId 
VariableModifiersopt ::= . (462)




STATE 366 ----------------------------------------------------------------------
( 341 )

ConstructorBody ::= LBRACE  .ExplicitConstructorInvocationopt 
                    BlockStatementsopt RBRACE 

identifier ::= .IDENTIFIER 
Type ::= .PrimitiveType 
Type ::= .ReferenceType 
PrimitiveType ::= .NumericType 
PrimitiveType ::= .boolean 
NumericType ::= .IntegralType 
NumericType ::= .FloatingPointType 
IntegralType ::= .byte 
IntegralType ::= .short 
IntegralType ::= .int 
IntegralType ::= .long 
IntegralType ::= .char 
FloatingPointType ::= .float 
FloatingPointType ::= .double 
ReferenceType ::= .ClassOrInterfaceType 
ReferenceType ::= .TypeVariable 
ReferenceType ::= .ArrayType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= .identifier 
TypeName ::= .TypeName DOT identifier 
ClassName ::= .TypeName 
TypeVariable ::= .identifier 
ArrayType ::= .Type LBRACKET RBRACKET 
TypeArguments ::= .LESS ActualTypeArgumentList GREATER 
ExpressionName ::= .identifier 
ExpressionName ::= .AmbiguousName DOT identifier 
MethodName ::= .identifier 
MethodName ::= .AmbiguousName DOT identifier 
AmbiguousName ::= .identifier 
AmbiguousName ::= .AmbiguousName DOT identifier 
ExplicitConstructorInvocation ::= .TypeArgumentsopt this LPAREN ArgumentListopt 
                                  RPAREN SEMICOLON 
ExplicitConstructorInvocation ::= .TypeArgumentsopt super LPAREN 
                                  ArgumentListopt RPAREN SEMICOLON 
ExplicitConstructorInvocation ::= .Primary DOT TypeArgumentsopt super LPAREN 
                                  ArgumentListopt RPAREN SEMICOLON 
Primary ::= .PrimaryNoNewArray 
Primary ::= .ArrayCreationExpression 
PrimaryNoNewArray ::= .Literal 
PrimaryNoNewArray ::= .Type DOT class 
PrimaryNoNewArray ::= .void DOT class 
PrimaryNoNewArray ::= .this 
PrimaryNoNewArray ::= .ClassName DOT this 
PrimaryNoNewArray ::= .LPAREN Expression RPAREN 
PrimaryNoNewArray ::= .ClassInstanceCreationExpression 
PrimaryNoNewArray ::= .FieldAccess 
PrimaryNoNewArray ::= .MethodInvocation 
PrimaryNoNewArray ::= .ArrayAccess 
Literal ::= .IntegerLiteral 
Literal ::= .LongLiteral 
Literal ::= .FloatingPointLiteral 
Literal ::= .DoubleLiteral 
Literal ::= .BooleanLiteral 
Literal ::= .CharacterLiteral 
Literal ::= .StringLiteral 
Literal ::= .null 
BooleanLiteral ::= .true 
BooleanLiteral ::= .false 
ClassInstanceCreationExpression ::= .new TypeArgumentsopt ClassOrInterfaceType 
                                    TypeArgumentsopt LPAREN ArgumentListopt 
                                    RPAREN ClassBodyopt 
ClassInstanceCreationExpression ::= .Primary DOT new TypeArgumentsopt 
                                    identifier TypeArgumentsopt LPAREN 
                                    ArgumentListopt RPAREN ClassBodyopt 
ArrayCreationExpression ::= .new PrimitiveType DimExprs Dimsopt 
ArrayCreationExpression ::= .new ClassOrInterfaceType DimExprs Dimsopt 
ArrayCreationExpression ::= .new PrimitiveType Dims ArrayInitializer 
ArrayCreationExpression ::= .new ClassOrInterfaceType Dims ArrayInitializer 
FieldAccess ::= .Primary DOT identifier 
FieldAccess ::= .super DOT identifier 
FieldAccess ::= .ClassName DOT super DOT identifier 
MethodInvocation ::= .MethodName LPAREN ArgumentListopt RPAREN 
MethodInvocation ::= .Primary DOT TypeArgumentsopt identifier LPAREN 
                     ArgumentListopt RPAREN 
MethodInvocation ::= .super DOT TypeArgumentsopt identifier LPAREN 
                     ArgumentListopt RPAREN 
MethodInvocation ::= .ClassName DOT super DOT TypeArgumentsopt identifier 
                     LPAREN ArgumentListopt RPAREN 
MethodInvocation ::= .TypeName DOT TypeArguments identifier LPAREN 
                     ArgumentListopt RPAREN 
ArrayAccess ::= .ExpressionName LBRACKET Expression RBRACKET 
ArrayAccess ::= .PrimaryNoNewArray LBRACKET Expression RBRACKET 
ExplicitConstructorInvocationopt ::= . (498)
ExplicitConstructorInvocationopt ::= .ExplicitConstructorInvocation 
TypeArgumentsopt ::= . (536)
TypeArgumentsopt ::= .TypeArguments 

GJavaParser.g:1031:38:1031:47:32680:32689: Warning: Shift/reduce conflict in state 366 on "null" with rule 498

ConstructorBody ::= LBRACE  .ExplicitConstructorInvocationopt 
                    BlockStatementsopt RBRACE 
ExplicitConstructorInvocationopt ::= . (498)

GJavaParser.g:1031:38:1031:47:32680:32689: Warning: Shift/reduce conflict in state 366 on "StringLiteral" with rule 498

ConstructorBody ::= LBRACE  .ExplicitConstructorInvocationopt 
                    BlockStatementsopt RBRACE 
ExplicitConstructorInvocationopt ::= . (498)

GJavaParser.g:1031:38:1031:47:32680:32689: Warning: Shift/reduce conflict in state 366 on "CharacterLiteral" with rule 498

ConstructorBody ::= LBRACE  .ExplicitConstructorInvocationopt 
                    BlockStatementsopt RBRACE 
ExplicitConstructorInvocationopt ::= . (498)

GJavaParser.g:1031:38:1031:47:32680:32689: Warning: Shift/reduce conflict in state 366 on "DoubleLiteral" with rule 498

ConstructorBody ::= LBRACE  .ExplicitConstructorInvocationopt 
                    BlockStatementsopt RBRACE 
ExplicitConstructorInvocationopt ::= . (498)

GJavaParser.g:1031:38:1031:47:32680:32689: Warning: Shift/reduce conflict in state 366 on "FloatingPointLiteral" with rule 498

ConstructorBody ::= LBRACE  .ExplicitConstructorInvocationopt 
                    BlockStatementsopt RBRACE 
ExplicitConstructorInvocationopt ::= . (498)

GJavaParser.g:1031:38:1031:47:32680:32689: Warning: Shift/reduce conflict in state 366 on "LongLiteral" with rule 498

ConstructorBody ::= LBRACE  .ExplicitConstructorInvocationopt 
                    BlockStatementsopt RBRACE 
ExplicitConstructorInvocationopt ::= . (498)

GJavaParser.g:1031:38:1031:47:32680:32689: Warning: Shift/reduce conflict in state 366 on "IntegerLiteral" with rule 498

ConstructorBody ::= LBRACE  .ExplicitConstructorInvocationopt 
                    BlockStatementsopt RBRACE 
ExplicitConstructorInvocationopt ::= . (498)

GJavaParser.g:1031:38:1031:47:32680:32689: Warning: Shift/reduce conflict in state 366 on "false" with rule 498

ConstructorBody ::= LBRACE  .ExplicitConstructorInvocationopt 
                    BlockStatementsopt RBRACE 
ExplicitConstructorInvocationopt ::= . (498)

GJavaParser.g:1031:38:1031:47:32680:32689: Warning: Shift/reduce conflict in state 366 on "true" with rule 498

ConstructorBody ::= LBRACE  .ExplicitConstructorInvocationopt 
                    BlockStatementsopt RBRACE 
ExplicitConstructorInvocationopt ::= . (498)

GJavaParser.g:1031:38:1031:47:32680:32689: Warning: Shift/reduce conflict in state 366 on "IDENTIFIER" with rule 498

ConstructorBody ::= LBRACE  .ExplicitConstructorInvocationopt 
                    BlockStatementsopt RBRACE 
ExplicitConstructorInvocationopt ::= . (498)

GJavaParser.g:1031:38:1031:47:32680:32689: Warning: Shift/reduce conflict in state 366 on "double" with rule 498

ConstructorBody ::= LBRACE  .ExplicitConstructorInvocationopt 
                    BlockStatementsopt RBRACE 
ExplicitConstructorInvocationopt ::= . (498)

GJavaParser.g:1031:38:1031:47:32680:32689: Warning: Shift/reduce conflict in state 366 on "float" with rule 498

ConstructorBody ::= LBRACE  .ExplicitConstructorInvocationopt 
                    BlockStatementsopt RBRACE 
ExplicitConstructorInvocationopt ::= . (498)

GJavaParser.g:1031:38:1031:47:32680:32689: Warning: Shift/reduce conflict in state 366 on "char" with rule 498

ConstructorBody ::= LBRACE  .ExplicitConstructorInvocationopt 
                    BlockStatementsopt RBRACE 
ExplicitConstructorInvocationopt ::= . (498)

GJavaParser.g:1031:38:1031:47:32680:32689: Warning: Shift/reduce conflict in state 366 on "long" with rule 498

ConstructorBody ::= LBRACE  .ExplicitConstructorInvocationopt 
                    BlockStatementsopt RBRACE 
ExplicitConstructorInvocationopt ::= . (498)

GJavaParser.g:1031:38:1031:47:32680:32689: Warning: Shift/reduce conflict in state 366 on "int" with rule 498

ConstructorBody ::= LBRACE  .ExplicitConstructorInvocationopt 
                    BlockStatementsopt RBRACE 
ExplicitConstructorInvocationopt ::= . (498)

GJavaParser.g:1031:38:1031:47:32680:32689: Warning: Shift/reduce conflict in state 366 on "short" with rule 498

ConstructorBody ::= LBRACE  .ExplicitConstructorInvocationopt 
                    BlockStatementsopt RBRACE 
ExplicitConstructorInvocationopt ::= . (498)

GJavaParser.g:1031:38:1031:47:32680:32689: Warning: Shift/reduce conflict in state 366 on "byte" with rule 498

ConstructorBody ::= LBRACE  .ExplicitConstructorInvocationopt 
                    BlockStatementsopt RBRACE 
ExplicitConstructorInvocationopt ::= . (498)

GJavaParser.g:1031:38:1031:47:32680:32689: Warning: Shift/reduce conflict in state 366 on "boolean" with rule 498

ConstructorBody ::= LBRACE  .ExplicitConstructorInvocationopt 
                    BlockStatementsopt RBRACE 
ExplicitConstructorInvocationopt ::= . (498)

GJavaParser.g:1031:38:1031:47:32680:32689: Warning: Shift/reduce conflict in state 366 on "new" with rule 498

ConstructorBody ::= LBRACE  .ExplicitConstructorInvocationopt 
                    BlockStatementsopt RBRACE 
ExplicitConstructorInvocationopt ::= . (498)

GJavaParser.g:1088:22:1088:31:34116:34125: Warning: Shift/reduce conflict in state 366 on "super" with rule 536

ExplicitConstructorInvocation ::= .TypeArgumentsopt super LPAREN 
                                  ArgumentListopt RPAREN SEMICOLON 
TypeArgumentsopt ::= . (536)

GJavaParser.g:1031:38:1031:47:32680:32689: Warning: Shift/reduce conflict in state 366 on "super" with rule 498

ConstructorBody ::= LBRACE  .ExplicitConstructorInvocationopt 
                    BlockStatementsopt RBRACE 
ExplicitConstructorInvocationopt ::= . (498)

GJavaParser.g:1031:38:1031:47:32680:32689: Warning: Shift/reduce conflict in state 366 on "LPAREN" with rule 498

ConstructorBody ::= LBRACE  .ExplicitConstructorInvocationopt 
                    BlockStatementsopt RBRACE 
ExplicitConstructorInvocationopt ::= . (498)

GJavaParser.g:1088:22:1088:31:34116:34125: Warning: Shift/reduce conflict in state 366 on "this" with rule 536

ExplicitConstructorInvocation ::= .TypeArgumentsopt this LPAREN ArgumentListopt 
                                  RPAREN SEMICOLON 
TypeArgumentsopt ::= . (536)

GJavaParser.g:1031:38:1031:47:32680:32689: Warning: Shift/reduce conflict in state 366 on "this" with rule 498

ConstructorBody ::= LBRACE  .ExplicitConstructorInvocationopt 
                    BlockStatementsopt RBRACE 
ExplicitConstructorInvocationopt ::= . (498)

GJavaParser.g:1031:38:1031:47:32680:32689: Warning: Shift/reduce conflict in state 366 on "void" with rule 498

ConstructorBody ::= LBRACE  .ExplicitConstructorInvocationopt 
                    BlockStatementsopt RBRACE 
ExplicitConstructorInvocationopt ::= . (498)




STATE 387 ----------------------------------------------------------------------
( 366 )

ConstructorBody ::= LBRACE ExplicitConstructorInvocationopt  .
                    BlockStatementsopt RBRACE 

identifier ::= .IDENTIFIER 
Type ::= .PrimitiveType 
Type ::= .ReferenceType 
PrimitiveType ::= .NumericType 
PrimitiveType ::= .boolean 
NumericType ::= .IntegralType 
NumericType ::= .FloatingPointType 
IntegralType ::= .byte 
IntegralType ::= .short 
IntegralType ::= .int 
IntegralType ::= .long 
IntegralType ::= .char 
FloatingPointType ::= .float 
FloatingPointType ::= .double 
ReferenceType ::= .ClassOrInterfaceType 
ReferenceType ::= .TypeVariable 
ReferenceType ::= .ArrayType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= .identifier 
TypeName ::= .TypeName DOT identifier 
ClassName ::= .TypeName 
TypeVariable ::= .identifier 
ArrayType ::= .Type LBRACKET RBRACKET 
ExpressionName ::= .identifier 
ExpressionName ::= .AmbiguousName DOT identifier 
MethodName ::= .identifier 
MethodName ::= .AmbiguousName DOT identifier 
AmbiguousName ::= .identifier 
AmbiguousName ::= .AmbiguousName DOT identifier 
ClassDeclaration ::= .NormalClassDeclaration 
ClassDeclaration ::= .EnumDeclaration 
NormalClassDeclaration ::= .ClassModifiersopt class identifier 
                           TypeParametersopt Superopt Interfacesopt ClassBody 
ClassModifiers ::= .ClassModifier 
ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifier ::= .Annotation 
ClassModifier ::= .public 
ClassModifier ::= .protected 
ClassModifier ::= .private 
ClassModifier ::= .abstract 
ClassModifier ::= .static 
ClassModifier ::= .final 
ClassModifier ::= .strictfp 
VariableModifiers ::= .VariableModifier 
VariableModifiers ::= .VariableModifiers VariableModifier 
VariableModifier ::= .final 
VariableModifier ::= .Annotations 
EnumDeclaration ::= .ClassModifiersopt enum identifier Interfacesopt EnumBody 
Annotations ::= .Annotation 
Annotations ::= .Annotations Annotation 
Annotation ::= .NormalAnnotation 
Annotation ::= .MarkerAnnotation 
Annotation ::= .SingleElementAnnotation 
NormalAnnotation ::= .AT TypeName LPAREN ElementValuePairsopt RPAREN 
MarkerAnnotation ::= .AT TypeName 
SingleElementAnnotation ::= .AT TypeName LPAREN ElementValue RPAREN 
Block ::= .LBRACE BlockStatementsopt RBRACE 
BlockStatements ::= .BlockStatement 
BlockStatements ::= .BlockStatements BlockStatement 
BlockStatement ::= .LocalVariableDeclarationStatement 
BlockStatement ::= .ClassDeclaration 
BlockStatement ::= .Statement 
LocalVariableDeclarationStatement ::= .LocalVariableDeclaration SEMICOLON 
LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
Statement ::= .StatementWithoutTrailingSubstatement 
Statement ::= .LabeledStatement 
Statement ::= .IfThenStatement 
Statement ::= .IfThenElseStatement 
Statement ::= .WhileStatement 
Statement ::= .ForStatement 
StatementWithoutTrailingSubstatement ::= .Block 
StatementWithoutTrailingSubstatement ::= .EmptyStatement 
StatementWithoutTrailingSubstatement ::= .ExpressionStatement 
StatementWithoutTrailingSubstatement ::= .AssertStatement 
StatementWithoutTrailingSubstatement ::= .SwitchStatement 
StatementWithoutTrailingSubstatement ::= .DoStatement 
StatementWithoutTrailingSubstatement ::= .BreakStatement 
StatementWithoutTrailingSubstatement ::= .ContinueStatement 
StatementWithoutTrailingSubstatement ::= .ReturnStatement 
StatementWithoutTrailingSubstatement ::= .SynchronizedStatement 
StatementWithoutTrailingSubstatement ::= .ThrowStatement 
StatementWithoutTrailingSubstatement ::= .TryStatement 
IfThenStatement ::= .if LPAREN Expression RPAREN Statement 
IfThenElseStatement ::= .if LPAREN Expression RPAREN StatementNoShortIf else 
                        Statement 
EmptyStatement ::= .SEMICOLON 
LabeledStatement ::= .identifier COLON Statement 
ExpressionStatement ::= .StatementExpression SEMICOLON 
StatementExpression ::= .Assignment 
StatementExpression ::= .PreIncrementExpression 
StatementExpression ::= .PreDecrementExpression 
StatementExpression ::= .PostIncrementExpression 
StatementExpression ::= .PostDecrementExpression 
StatementExpression ::= .MethodInvocation 
StatementExpression ::= .ClassInstanceCreationExpression 
AssertStatement ::= .assert Expression SEMICOLON 
AssertStatement ::= .assert Expression COLON Expression SEMICOLON 
SwitchStatement ::= .switch LPAREN Expression RPAREN SwitchBlock 
WhileStatement ::= .while LPAREN Expression RPAREN Statement 
DoStatement ::= .do Statement while LPAREN Expression RPAREN SEMICOLON 
ForStatement ::= .BasicForStatement 
ForStatement ::= .EnhancedForStatement 
BasicForStatement ::= .for LPAREN ForInitopt SEMICOLON Expressionopt SEMICOLON 
                      ForUpdateopt RPAREN Statement 
EnhancedForStatement ::= .for LPAREN FormalParameter COLON Expression RPAREN 
                         Statement 
BreakStatement ::= .break identifieropt SEMICOLON 
ContinueStatement ::= .continue identifieropt SEMICOLON 
ReturnStatement ::= .return Expressionopt SEMICOLON 
ThrowStatement ::= .throw Expression SEMICOLON 
SynchronizedStatement ::= .synchronized LPAREN Expression RPAREN Block 
TryStatement ::= .try Block Catches 
TryStatement ::= .try Block Catchesopt Finally 
Primary ::= .PrimaryNoNewArray 
Primary ::= .ArrayCreationExpression 
PrimaryNoNewArray ::= .Literal 
PrimaryNoNewArray ::= .Type DOT class 
PrimaryNoNewArray ::= .void DOT class 
PrimaryNoNewArray ::= .this 
PrimaryNoNewArray ::= .ClassName DOT this 
PrimaryNoNewArray ::= .LPAREN Expression RPAREN 
PrimaryNoNewArray ::= .ClassInstanceCreationExpression 
PrimaryNoNewArray ::= .FieldAccess 
PrimaryNoNewArray ::= .MethodInvocation 
PrimaryNoNewArray ::= .ArrayAccess 
Literal ::= .IntegerLiteral 
Literal ::= .LongLiteral 
Literal ::= .FloatingPointLiteral 
Literal ::= .DoubleLiteral 
Literal ::= .BooleanLiteral 
Literal ::= .CharacterLiteral 
Literal ::= .StringLiteral 
Literal ::= .null 
BooleanLiteral ::= .true 
BooleanLiteral ::= .false 
ClassInstanceCreationExpression ::= .new TypeArgumentsopt ClassOrInterfaceType 
                                    TypeArgumentsopt LPAREN ArgumentListopt 
                                    RPAREN ClassBodyopt 
ClassInstanceCreationExpression ::= .Primary DOT new TypeArgumentsopt 
                                    identifier TypeArgumentsopt LPAREN 
                                    ArgumentListopt RPAREN ClassBodyopt 
ArrayCreationExpression ::= .new PrimitiveType DimExprs Dimsopt 
ArrayCreationExpression ::= .new ClassOrInterfaceType DimExprs Dimsopt 
ArrayCreationExpression ::= .new PrimitiveType Dims ArrayInitializer 
ArrayCreationExpression ::= .new ClassOrInterfaceType Dims ArrayInitializer 
FieldAccess ::= .Primary DOT identifier 
FieldAccess ::= .super DOT identifier 
FieldAccess ::= .ClassName DOT super DOT identifier 
MethodInvocation ::= .MethodName LPAREN ArgumentListopt RPAREN 
MethodInvocation ::= .Primary DOT TypeArgumentsopt identifier LPAREN 
                     ArgumentListopt RPAREN 
MethodInvocation ::= .super DOT TypeArgumentsopt identifier LPAREN 
                     ArgumentListopt RPAREN 
MethodInvocation ::= .ClassName DOT super DOT TypeArgumentsopt identifier 
                     LPAREN ArgumentListopt RPAREN 
MethodInvocation ::= .TypeName DOT TypeArguments identifier LPAREN 
                     ArgumentListopt RPAREN 
ArrayAccess ::= .ExpressionName LBRACKET Expression RBRACKET 
ArrayAccess ::= .PrimaryNoNewArray LBRACKET Expression RBRACKET 
PostfixExpression ::= .Primary 
PostfixExpression ::= .ExpressionName 
PostfixExpression ::= .PostIncrementExpression 
PostfixExpression ::= .PostDecrementExpression 
PostIncrementExpression ::= .PostfixExpression PLUS_PLUS 
PostDecrementExpression ::= .PostfixExpression MINUS_MINUS 
PreIncrementExpression ::= .PLUS_PLUS UnaryExpression 
PreDecrementExpression ::= .MINUS_MINUS UnaryExpression 
Assignment ::= .LeftHandSide AssignmentOperator AssignmentExpression 
LeftHandSide ::= .ExpressionName 
LeftHandSide ::= .FieldAccess 
LeftHandSide ::= .ArrayAccess 
VariableModifiersopt ::= . (462)
VariableModifiersopt ::= .VariableModifiers 
BlockStatementsopt ::= . (496)
BlockStatementsopt ::= .BlockStatements 
ClassModifiersopt ::= . (520)
ClassModifiersopt ::= .ClassModifiers 

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 387 on "double" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 387 on "float" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 387 on "char" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 387 on "long" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 387 on "int" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 387 on "short" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 387 on "byte" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 387 on "boolean" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 387 on "IDENTIFIER" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)




STATE 405 ----------------------------------------------------------------------
( 385 )

ArrayType ::= Type  .LBRACKET RBRACKET 
FormalParameter ::= VariableModifiersopt Type  .VariableDeclaratorId 
LastFormalParameter ::= VariableModifiersopt Type  .Ellipsisopt 
                        VariableDeclaratorId 

identifier ::= .IDENTIFIER 
VariableDeclaratorId ::= .identifier 
VariableDeclaratorId ::= .VariableDeclaratorId LBRACKET RBRACKET 
Ellipsisopt ::= . (502)
Ellipsisopt ::= .ELLIPSIS 

GJavaParser.g:1037:12:1037:21:32867:32876: Warning: Shift/reduce conflict in state 405 on "IDENTIFIER" with rule 502

LastFormalParameter ::= VariableModifiersopt Type  .Ellipsisopt 
                        VariableDeclaratorId 
Ellipsisopt ::= . (502)




STATE 408 ----------------------------------------------------------------------
( 389 )

ExplicitConstructorInvocation ::= Primary DOT  .TypeArgumentsopt super LPAREN 
                                  ArgumentListopt RPAREN SEMICOLON 
ClassInstanceCreationExpression ::= Primary DOT  .new TypeArgumentsopt 
                                    identifier TypeArgumentsopt LPAREN 
                                    ArgumentListopt RPAREN ClassBodyopt 
FieldAccess ::= Primary DOT  .identifier 
MethodInvocation ::= Primary DOT  .TypeArgumentsopt identifier LPAREN 
                     ArgumentListopt RPAREN 

identifier ::= .IDENTIFIER 
TypeArguments ::= .LESS ActualTypeArgumentList GREATER 
TypeArgumentsopt ::= . (536)
TypeArgumentsopt ::= .TypeArguments 

GJavaParser.g:1088:22:1088:31:34116:34125: Warning: Shift/reduce conflict in state 408 on "IDENTIFIER" with rule 536

MethodInvocation ::= Primary DOT  .TypeArgumentsopt identifier LPAREN 
                     ArgumentListopt RPAREN 
TypeArgumentsopt ::= . (536)




STATE 414 ----------------------------------------------------------------------
( 397 )

SwitchBlock ::= LBRACE  .SwitchBlockStatementGroupsopt SwitchLabelsopt RBRACE 

SwitchBlockStatementGroups ::= .SwitchBlockStatementGroup 
SwitchBlockStatementGroups ::= .SwitchBlockStatementGroups 
                               SwitchBlockStatementGroup 
SwitchBlockStatementGroup ::= .SwitchLabels BlockStatements 
SwitchLabels ::= .SwitchLabel 
SwitchLabels ::= .SwitchLabels SwitchLabel 
SwitchLabel ::= .case ConstantExpression COLON 
SwitchLabel ::= .case EnumConstant COLON 
SwitchLabel ::= .default COLON 
SwitchBlockStatementGroupsopt ::= . (460)
SwitchBlockStatementGroupsopt ::= .SwitchBlockStatementGroups 

GJavaParser.g:974:35:974:44:31093:31102: Warning: Shift/reduce conflict in state 414 on "default" with rule 460

SwitchBlock ::= LBRACE  .SwitchBlockStatementGroupsopt SwitchLabelsopt RBRACE 
SwitchBlockStatementGroupsopt ::= . (460)

GJavaParser.g:974:35:974:44:31093:31102: Warning: Shift/reduce conflict in state 414 on "case" with rule 460

SwitchBlock ::= LBRACE  .SwitchBlockStatementGroupsopt SwitchLabelsopt RBRACE 
SwitchBlockStatementGroupsopt ::= . (460)




STATE 420 ----------------------------------------------------------------------
( 399 441 463 464 471 473 )

TypeName ::= identifier . (27)
TypeVariable ::= identifier . (30)
ExpressionName ::= identifier . (47)
MethodName ::= identifier . (49)
AmbiguousName ::= identifier . (53)
LabeledStatement ::= identifier  .COLON Statement 
LabeledStatementNoShortIf ::= identifier  .COLON StatementNoShortIf 

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 420 on "LBRACKET" between rule 27 and rule 47 starting at line 275, column 20

ArrayType ::= .Type LBRACKET RBRACKET 
Type ::= .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
ArrayAccess ::= .ExpressionName LBRACKET Expression RBRACKET 
ExpressionName ::= identifier . (47)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 420 on "LBRACKET" between rule 27 and rule 30 starting at line 236, column 18

ArrayType ::= .Type LBRACKET RBRACKET 
Type ::= .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
ArrayType ::= .Type LBRACKET RBRACKET 
Type ::= .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 420 on "DOT" between rule 27 and rule 53 starting at line 284, column 19

PrimaryNoNewArray ::= .Type DOT class 
Type ::= .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
ExpressionName ::= .AmbiguousName DOT identifier 
AmbiguousName ::= identifier . (53)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 420 on "DOT" between rule 27 and rule 30 starting at line 236, column 18

PrimaryNoNewArray ::= .Type DOT class 
Type ::= .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
PrimaryNoNewArray ::= .Type DOT class 
Type ::= .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)




STATE 434 ----------------------------------------------------------------------
( 414 432 435 436 449 )

SwitchLabel ::= case  .ConstantExpression COLON 
SwitchLabel ::= case  .EnumConstant COLON 

identifier ::= .IDENTIFIER 
Type ::= .PrimitiveType 
Type ::= .ReferenceType 
PrimitiveType ::= .NumericType 
PrimitiveType ::= .boolean 
NumericType ::= .IntegralType 
NumericType ::= .FloatingPointType 
IntegralType ::= .byte 
IntegralType ::= .short 
IntegralType ::= .int 
IntegralType ::= .long 
IntegralType ::= .char 
FloatingPointType ::= .float 
FloatingPointType ::= .double 
ReferenceType ::= .ClassOrInterfaceType 
ReferenceType ::= .TypeVariable 
ReferenceType ::= .ArrayType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= .identifier 
TypeName ::= .TypeName DOT identifier 
ClassName ::= .TypeName 
TypeVariable ::= .identifier 
ArrayType ::= .Type LBRACKET RBRACKET 
ExpressionName ::= .identifier 
ExpressionName ::= .AmbiguousName DOT identifier 
MethodName ::= .identifier 
MethodName ::= .AmbiguousName DOT identifier 
AmbiguousName ::= .identifier 
AmbiguousName ::= .AmbiguousName DOT identifier 
EnumConstant ::= .Annotationsopt identifier Argumentsopt ClassBodyopt 
Annotations ::= .Annotation 
Annotations ::= .Annotations Annotation 
Annotation ::= .NormalAnnotation 
Annotation ::= .MarkerAnnotation 
Annotation ::= .SingleElementAnnotation 
NormalAnnotation ::= .AT TypeName LPAREN ElementValuePairsopt RPAREN 
MarkerAnnotation ::= .AT TypeName 
SingleElementAnnotation ::= .AT TypeName LPAREN ElementValue RPAREN 
EnumConstant ::= .identifier 
Primary ::= .PrimaryNoNewArray 
Primary ::= .ArrayCreationExpression 
PrimaryNoNewArray ::= .Literal 
PrimaryNoNewArray ::= .Type DOT class 
PrimaryNoNewArray ::= .void DOT class 
PrimaryNoNewArray ::= .this 
PrimaryNoNewArray ::= .ClassName DOT this 
PrimaryNoNewArray ::= .LPAREN Expression RPAREN 
PrimaryNoNewArray ::= .ClassInstanceCreationExpression 
PrimaryNoNewArray ::= .FieldAccess 
PrimaryNoNewArray ::= .MethodInvocation 
PrimaryNoNewArray ::= .ArrayAccess 
Literal ::= .IntegerLiteral 
Literal ::= .LongLiteral 
Literal ::= .FloatingPointLiteral 
Literal ::= .DoubleLiteral 
Literal ::= .BooleanLiteral 
Literal ::= .CharacterLiteral 
Literal ::= .StringLiteral 
Literal ::= .null 
BooleanLiteral ::= .true 
BooleanLiteral ::= .false 
ClassInstanceCreationExpression ::= .new TypeArgumentsopt ClassOrInterfaceType 
                                    TypeArgumentsopt LPAREN ArgumentListopt 
                                    RPAREN ClassBodyopt 
ClassInstanceCreationExpression ::= .Primary DOT new TypeArgumentsopt 
                                    identifier TypeArgumentsopt LPAREN 
                                    ArgumentListopt RPAREN ClassBodyopt 
ArrayCreationExpression ::= .new PrimitiveType DimExprs Dimsopt 
ArrayCreationExpression ::= .new ClassOrInterfaceType DimExprs Dimsopt 
ArrayCreationExpression ::= .new PrimitiveType Dims ArrayInitializer 
ArrayCreationExpression ::= .new ClassOrInterfaceType Dims ArrayInitializer 
FieldAccess ::= .Primary DOT identifier 
FieldAccess ::= .super DOT identifier 
FieldAccess ::= .ClassName DOT super DOT identifier 
MethodInvocation ::= .MethodName LPAREN ArgumentListopt RPAREN 
MethodInvocation ::= .Primary DOT TypeArgumentsopt identifier LPAREN 
                     ArgumentListopt RPAREN 
MethodInvocation ::= .super DOT TypeArgumentsopt identifier LPAREN 
                     ArgumentListopt RPAREN 
MethodInvocation ::= .ClassName DOT super DOT TypeArgumentsopt identifier 
                     LPAREN ArgumentListopt RPAREN 
MethodInvocation ::= .TypeName DOT TypeArguments identifier LPAREN 
                     ArgumentListopt RPAREN 
ArrayAccess ::= .ExpressionName LBRACKET Expression RBRACKET 
ArrayAccess ::= .PrimaryNoNewArray LBRACKET Expression RBRACKET 
PostfixExpression ::= .Primary 
PostfixExpression ::= .ExpressionName 
PostfixExpression ::= .PostIncrementExpression 
PostfixExpression ::= .PostDecrementExpression 
PostIncrementExpression ::= .PostfixExpression PLUS_PLUS 
PostDecrementExpression ::= .PostfixExpression MINUS_MINUS 
UnaryExpression ::= .PreIncrementExpression 
UnaryExpression ::= .PreDecrementExpression 
UnaryExpression ::= .PLUS UnaryExpression 
UnaryExpression ::= .MINUS UnaryExpression 
UnaryExpression ::= .UnaryExpressionNotPlusMinus 
PreIncrementExpression ::= .PLUS_PLUS UnaryExpression 
PreDecrementExpression ::= .MINUS_MINUS UnaryExpression 
UnaryExpressionNotPlusMinus ::= .PostfixExpression 
UnaryExpressionNotPlusMinus ::= .TWIDDLE UnaryExpression 
UnaryExpressionNotPlusMinus ::= .NOT UnaryExpression 
UnaryExpressionNotPlusMinus ::= .CastExpression 
CastExpression ::= .LPAREN PrimitiveType Dimsopt RPAREN UnaryExpression 
CastExpression ::= .LPAREN ReferenceType RPAREN UnaryExpressionNotPlusMinus 
MultiplicativeExpression ::= .UnaryExpression 
MultiplicativeExpression ::= .MultiplicativeExpression MULTIPLY UnaryExpression 
MultiplicativeExpression ::= .MultiplicativeExpression DIVIDE UnaryExpression 
MultiplicativeExpression ::= .MultiplicativeExpression REMAINDER 
                             UnaryExpression 
AdditiveExpression ::= .MultiplicativeExpression 
AdditiveExpression ::= .AdditiveExpression PLUS MultiplicativeExpression 
AdditiveExpression ::= .AdditiveExpression MINUS MultiplicativeExpression 
ShiftExpression ::= .AdditiveExpression 
ShiftExpression ::= .ShiftExpression LEFT_SHIFT AdditiveExpression 
ShiftExpression ::= .ShiftExpression GREATER GREATER AdditiveExpression 
ShiftExpression ::= .ShiftExpression GREATER GREATER GREATER AdditiveExpression 
RelationalExpression ::= .ShiftExpression 
RelationalExpression ::= .RelationalExpression LESS ShiftExpression 
RelationalExpression ::= .RelationalExpression GREATER ShiftExpression 
RelationalExpression ::= .RelationalExpression LESS_EQUAL ShiftExpression 
RelationalExpression ::= .RelationalExpression GREATER EQUAL ShiftExpression 
RelationalExpression ::= .RelationalExpression instanceof ReferenceType 
EqualityExpression ::= .RelationalExpression 
EqualityExpression ::= .EqualityExpression EQUAL_EQUAL RelationalExpression 
EqualityExpression ::= .EqualityExpression NOT_EQUAL RelationalExpression 
AndExpression ::= .EqualityExpression 
AndExpression ::= .AndExpression AND EqualityExpression 
ExclusiveOrExpression ::= .AndExpression 
ExclusiveOrExpression ::= .ExclusiveOrExpression XOR AndExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
InclusiveOrExpression ::= .InclusiveOrExpression OR ExclusiveOrExpression 
ConditionalAndExpression ::= .InclusiveOrExpression 
ConditionalAndExpression ::= .ConditionalAndExpression AND_AND 
                             InclusiveOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalOrExpression ::= .ConditionalOrExpression OR_OR 
                            ConditionalAndExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalExpression ::= .ConditionalOrExpression QUESTION Expression COLON 
                          ConditionalExpression 
AssignmentExpression ::= .ConditionalExpression 
AssignmentExpression ::= .Assignment 
Assignment ::= .LeftHandSide AssignmentOperator AssignmentExpression 
LeftHandSide ::= .ExpressionName 
LeftHandSide ::= .FieldAccess 
LeftHandSide ::= .ArrayAccess 
Expression ::= .AssignmentExpression 
ConstantExpression ::= .Expression 
Annotationsopt ::= . (522)
Annotationsopt ::= .Annotations 

GJavaParser.g:1067:20:1067:29:33568:33577: Warning: Shift/reduce conflict in state 434 on "IDENTIFIER" with rule 522

EnumConstant ::= .Annotationsopt identifier Argumentsopt ClassBodyopt 
Annotationsopt ::= . (522)




STATE 435 ----------------------------------------------------------------------
( 414 436 )

SwitchBlockStatementGroup ::= SwitchLabels  .BlockStatements 
SwitchLabels ::= SwitchLabels  .SwitchLabel 

identifier ::= .IDENTIFIER 
Type ::= .PrimitiveType 
Type ::= .ReferenceType 
PrimitiveType ::= .NumericType 
PrimitiveType ::= .boolean 
NumericType ::= .IntegralType 
NumericType ::= .FloatingPointType 
IntegralType ::= .byte 
IntegralType ::= .short 
IntegralType ::= .int 
IntegralType ::= .long 
IntegralType ::= .char 
FloatingPointType ::= .float 
FloatingPointType ::= .double 
ReferenceType ::= .ClassOrInterfaceType 
ReferenceType ::= .TypeVariable 
ReferenceType ::= .ArrayType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= .identifier 
TypeName ::= .TypeName DOT identifier 
ClassName ::= .TypeName 
TypeVariable ::= .identifier 
ArrayType ::= .Type LBRACKET RBRACKET 
ExpressionName ::= .identifier 
ExpressionName ::= .AmbiguousName DOT identifier 
MethodName ::= .identifier 
MethodName ::= .AmbiguousName DOT identifier 
AmbiguousName ::= .identifier 
AmbiguousName ::= .AmbiguousName DOT identifier 
ClassDeclaration ::= .NormalClassDeclaration 
ClassDeclaration ::= .EnumDeclaration 
NormalClassDeclaration ::= .ClassModifiersopt class identifier 
                           TypeParametersopt Superopt Interfacesopt ClassBody 
ClassModifiers ::= .ClassModifier 
ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifier ::= .Annotation 
ClassModifier ::= .public 
ClassModifier ::= .protected 
ClassModifier ::= .private 
ClassModifier ::= .abstract 
ClassModifier ::= .static 
ClassModifier ::= .final 
ClassModifier ::= .strictfp 
VariableModifiers ::= .VariableModifier 
VariableModifiers ::= .VariableModifiers VariableModifier 
VariableModifier ::= .final 
VariableModifier ::= .Annotations 
EnumDeclaration ::= .ClassModifiersopt enum identifier Interfacesopt EnumBody 
Annotations ::= .Annotation 
Annotations ::= .Annotations Annotation 
Annotation ::= .NormalAnnotation 
Annotation ::= .MarkerAnnotation 
Annotation ::= .SingleElementAnnotation 
NormalAnnotation ::= .AT TypeName LPAREN ElementValuePairsopt RPAREN 
MarkerAnnotation ::= .AT TypeName 
SingleElementAnnotation ::= .AT TypeName LPAREN ElementValue RPAREN 
Block ::= .LBRACE BlockStatementsopt RBRACE 
BlockStatements ::= .BlockStatement 
BlockStatements ::= .BlockStatements BlockStatement 
BlockStatement ::= .LocalVariableDeclarationStatement 
BlockStatement ::= .ClassDeclaration 
BlockStatement ::= .Statement 
LocalVariableDeclarationStatement ::= .LocalVariableDeclaration SEMICOLON 
LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
Statement ::= .StatementWithoutTrailingSubstatement 
Statement ::= .LabeledStatement 
Statement ::= .IfThenStatement 
Statement ::= .IfThenElseStatement 
Statement ::= .WhileStatement 
Statement ::= .ForStatement 
StatementWithoutTrailingSubstatement ::= .Block 
StatementWithoutTrailingSubstatement ::= .EmptyStatement 
StatementWithoutTrailingSubstatement ::= .ExpressionStatement 
StatementWithoutTrailingSubstatement ::= .AssertStatement 
StatementWithoutTrailingSubstatement ::= .SwitchStatement 
StatementWithoutTrailingSubstatement ::= .DoStatement 
StatementWithoutTrailingSubstatement ::= .BreakStatement 
StatementWithoutTrailingSubstatement ::= .ContinueStatement 
StatementWithoutTrailingSubstatement ::= .ReturnStatement 
StatementWithoutTrailingSubstatement ::= .SynchronizedStatement 
StatementWithoutTrailingSubstatement ::= .ThrowStatement 
StatementWithoutTrailingSubstatement ::= .TryStatement 
IfThenStatement ::= .if LPAREN Expression RPAREN Statement 
IfThenElseStatement ::= .if LPAREN Expression RPAREN StatementNoShortIf else 
                        Statement 
EmptyStatement ::= .SEMICOLON 
LabeledStatement ::= .identifier COLON Statement 
ExpressionStatement ::= .StatementExpression SEMICOLON 
StatementExpression ::= .Assignment 
StatementExpression ::= .PreIncrementExpression 
StatementExpression ::= .PreDecrementExpression 
StatementExpression ::= .PostIncrementExpression 
StatementExpression ::= .PostDecrementExpression 
StatementExpression ::= .MethodInvocation 
StatementExpression ::= .ClassInstanceCreationExpression 
AssertStatement ::= .assert Expression SEMICOLON 
AssertStatement ::= .assert Expression COLON Expression SEMICOLON 
SwitchStatement ::= .switch LPAREN Expression RPAREN SwitchBlock 
SwitchLabel ::= .case ConstantExpression COLON 
SwitchLabel ::= .case EnumConstant COLON 
SwitchLabel ::= .default COLON 
WhileStatement ::= .while LPAREN Expression RPAREN Statement 
DoStatement ::= .do Statement while LPAREN Expression RPAREN SEMICOLON 
ForStatement ::= .BasicForStatement 
ForStatement ::= .EnhancedForStatement 
BasicForStatement ::= .for LPAREN ForInitopt SEMICOLON Expressionopt SEMICOLON 
                      ForUpdateopt RPAREN Statement 
EnhancedForStatement ::= .for LPAREN FormalParameter COLON Expression RPAREN 
                         Statement 
BreakStatement ::= .break identifieropt SEMICOLON 
ContinueStatement ::= .continue identifieropt SEMICOLON 
ReturnStatement ::= .return Expressionopt SEMICOLON 
ThrowStatement ::= .throw Expression SEMICOLON 
SynchronizedStatement ::= .synchronized LPAREN Expression RPAREN Block 
TryStatement ::= .try Block Catches 
TryStatement ::= .try Block Catchesopt Finally 
Primary ::= .PrimaryNoNewArray 
Primary ::= .ArrayCreationExpression 
PrimaryNoNewArray ::= .Literal 
PrimaryNoNewArray ::= .Type DOT class 
PrimaryNoNewArray ::= .void DOT class 
PrimaryNoNewArray ::= .this 
PrimaryNoNewArray ::= .ClassName DOT this 
PrimaryNoNewArray ::= .LPAREN Expression RPAREN 
PrimaryNoNewArray ::= .ClassInstanceCreationExpression 
PrimaryNoNewArray ::= .FieldAccess 
PrimaryNoNewArray ::= .MethodInvocation 
PrimaryNoNewArray ::= .ArrayAccess 
Literal ::= .IntegerLiteral 
Literal ::= .LongLiteral 
Literal ::= .FloatingPointLiteral 
Literal ::= .DoubleLiteral 
Literal ::= .BooleanLiteral 
Literal ::= .CharacterLiteral 
Literal ::= .StringLiteral 
Literal ::= .null 
BooleanLiteral ::= .true 
BooleanLiteral ::= .false 
ClassInstanceCreationExpression ::= .new TypeArgumentsopt ClassOrInterfaceType 
                                    TypeArgumentsopt LPAREN ArgumentListopt 
                                    RPAREN ClassBodyopt 
ClassInstanceCreationExpression ::= .Primary DOT new TypeArgumentsopt 
                                    identifier TypeArgumentsopt LPAREN 
                                    ArgumentListopt RPAREN ClassBodyopt 
ArrayCreationExpression ::= .new PrimitiveType DimExprs Dimsopt 
ArrayCreationExpression ::= .new ClassOrInterfaceType DimExprs Dimsopt 
ArrayCreationExpression ::= .new PrimitiveType Dims ArrayInitializer 
ArrayCreationExpression ::= .new ClassOrInterfaceType Dims ArrayInitializer 
FieldAccess ::= .Primary DOT identifier 
FieldAccess ::= .super DOT identifier 
FieldAccess ::= .ClassName DOT super DOT identifier 
MethodInvocation ::= .MethodName LPAREN ArgumentListopt RPAREN 
MethodInvocation ::= .Primary DOT TypeArgumentsopt identifier LPAREN 
                     ArgumentListopt RPAREN 
MethodInvocation ::= .super DOT TypeArgumentsopt identifier LPAREN 
                     ArgumentListopt RPAREN 
MethodInvocation ::= .ClassName DOT super DOT TypeArgumentsopt identifier 
                     LPAREN ArgumentListopt RPAREN 
MethodInvocation ::= .TypeName DOT TypeArguments identifier LPAREN 
                     ArgumentListopt RPAREN 
ArrayAccess ::= .ExpressionName LBRACKET Expression RBRACKET 
ArrayAccess ::= .PrimaryNoNewArray LBRACKET Expression RBRACKET 
PostfixExpression ::= .Primary 
PostfixExpression ::= .ExpressionName 
PostfixExpression ::= .PostIncrementExpression 
PostfixExpression ::= .PostDecrementExpression 
PostIncrementExpression ::= .PostfixExpression PLUS_PLUS 
PostDecrementExpression ::= .PostfixExpression MINUS_MINUS 
PreIncrementExpression ::= .PLUS_PLUS UnaryExpression 
PreDecrementExpression ::= .MINUS_MINUS UnaryExpression 
Assignment ::= .LeftHandSide AssignmentOperator AssignmentExpression 
LeftHandSide ::= .ExpressionName 
LeftHandSide ::= .FieldAccess 
LeftHandSide ::= .ArrayAccess 
VariableModifiersopt ::= . (462)
VariableModifiersopt ::= .VariableModifiers 
ClassModifiersopt ::= . (520)
ClassModifiersopt ::= .ClassModifiers 

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 435 on "IDENTIFIER" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 435 on "boolean" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 435 on "char" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 435 on "long" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 435 on "int" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 435 on "short" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 435 on "byte" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 435 on "double" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 435 on "float" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)




STATE 436 ----------------------------------------------------------------------
( 414 )

SwitchBlockStatementGroups ::= SwitchBlockStatementGroups  .
                               SwitchBlockStatementGroup 
SwitchBlockStatementGroupsopt ::= SwitchBlockStatementGroups . (461)

SwitchBlockStatementGroup ::= .SwitchLabels BlockStatements 
SwitchLabels ::= .SwitchLabel 
SwitchLabels ::= .SwitchLabels SwitchLabel 
SwitchLabel ::= .case ConstantExpression COLON 
SwitchLabel ::= .case EnumConstant COLON 
SwitchLabel ::= .default COLON 

GJavaParser.g:975:37:975:64:31140:31167: Warning: Shift/reduce conflict in state 436 on "default" with rule 461

SwitchBlock ::= LBRACE  .SwitchBlockStatementGroupsopt SwitchLabelsopt RBRACE 
SwitchBlockStatementGroupsopt ::= SwitchBlockStatementGroups . (461)

GJavaParser.g:975:37:975:64:31140:31167: Warning: Shift/reduce conflict in state 436 on "case" with rule 461

SwitchBlock ::= LBRACE  .SwitchBlockStatementGroupsopt SwitchLabelsopt RBRACE 
SwitchBlockStatementGroupsopt ::= SwitchBlockStatementGroups . (461)




STATE 438 ----------------------------------------------------------------------
( 417 )

BasicForStatement ::= for LPAREN  .ForInitopt SEMICOLON Expressionopt SEMICOLON 
                      ForUpdateopt RPAREN Statement 
ForStatementNoShortIf ::= for LPAREN  .ForInitopt SEMICOLON Expressionopt 
                          SEMICOLON ForUpdateopt RPAREN StatementNoShortIf 
EnhancedForStatement ::= for LPAREN  .FormalParameter COLON Expression RPAREN 
                         Statement 

identifier ::= .IDENTIFIER 
Type ::= .PrimitiveType 
Type ::= .ReferenceType 
PrimitiveType ::= .NumericType 
PrimitiveType ::= .boolean 
NumericType ::= .IntegralType 
NumericType ::= .FloatingPointType 
IntegralType ::= .byte 
IntegralType ::= .short 
IntegralType ::= .int 
IntegralType ::= .long 
IntegralType ::= .char 
FloatingPointType ::= .float 
FloatingPointType ::= .double 
ReferenceType ::= .ClassOrInterfaceType 
ReferenceType ::= .TypeVariable 
ReferenceType ::= .ArrayType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= .identifier 
TypeName ::= .TypeName DOT identifier 
ClassName ::= .TypeName 
TypeVariable ::= .identifier 
ArrayType ::= .Type LBRACKET RBRACKET 
ExpressionName ::= .identifier 
ExpressionName ::= .AmbiguousName DOT identifier 
MethodName ::= .identifier 
MethodName ::= .AmbiguousName DOT identifier 
AmbiguousName ::= .identifier 
AmbiguousName ::= .AmbiguousName DOT identifier 
FormalParameter ::= .VariableModifiersopt Type VariableDeclaratorId 
VariableModifiers ::= .VariableModifier 
VariableModifiers ::= .VariableModifiers VariableModifier 
VariableModifier ::= .final 
VariableModifier ::= .Annotations 
Annotations ::= .Annotation 
Annotations ::= .Annotations Annotation 
Annotation ::= .NormalAnnotation 
Annotation ::= .MarkerAnnotation 
Annotation ::= .SingleElementAnnotation 
NormalAnnotation ::= .AT TypeName LPAREN ElementValuePairsopt RPAREN 
MarkerAnnotation ::= .AT TypeName 
SingleElementAnnotation ::= .AT TypeName LPAREN ElementValue RPAREN 
LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
StatementExpression ::= .Assignment 
StatementExpression ::= .PreIncrementExpression 
StatementExpression ::= .PreDecrementExpression 
StatementExpression ::= .PostIncrementExpression 
StatementExpression ::= .PostDecrementExpression 
StatementExpression ::= .MethodInvocation 
StatementExpression ::= .ClassInstanceCreationExpression 
ForInit ::= .StatementExpressionList 
ForInit ::= .LocalVariableDeclaration 
StatementExpressionList ::= .StatementExpression 
StatementExpressionList ::= .StatementExpressionList COMMA StatementExpression 
Primary ::= .PrimaryNoNewArray 
Primary ::= .ArrayCreationExpression 
PrimaryNoNewArray ::= .Literal 
PrimaryNoNewArray ::= .Type DOT class 
PrimaryNoNewArray ::= .void DOT class 
PrimaryNoNewArray ::= .this 
PrimaryNoNewArray ::= .ClassName DOT this 
PrimaryNoNewArray ::= .LPAREN Expression RPAREN 
PrimaryNoNewArray ::= .ClassInstanceCreationExpression 
PrimaryNoNewArray ::= .FieldAccess 
PrimaryNoNewArray ::= .MethodInvocation 
PrimaryNoNewArray ::= .ArrayAccess 
Literal ::= .IntegerLiteral 
Literal ::= .LongLiteral 
Literal ::= .FloatingPointLiteral 
Literal ::= .DoubleLiteral 
Literal ::= .BooleanLiteral 
Literal ::= .CharacterLiteral 
Literal ::= .StringLiteral 
Literal ::= .null 
BooleanLiteral ::= .true 
BooleanLiteral ::= .false 
ClassInstanceCreationExpression ::= .new TypeArgumentsopt ClassOrInterfaceType 
                                    TypeArgumentsopt LPAREN ArgumentListopt 
                                    RPAREN ClassBodyopt 
ClassInstanceCreationExpression ::= .Primary DOT new TypeArgumentsopt 
                                    identifier TypeArgumentsopt LPAREN 
                                    ArgumentListopt RPAREN ClassBodyopt 
ArrayCreationExpression ::= .new PrimitiveType DimExprs Dimsopt 
ArrayCreationExpression ::= .new ClassOrInterfaceType DimExprs Dimsopt 
ArrayCreationExpression ::= .new PrimitiveType Dims ArrayInitializer 
ArrayCreationExpression ::= .new ClassOrInterfaceType Dims ArrayInitializer 
FieldAccess ::= .Primary DOT identifier 
FieldAccess ::= .super DOT identifier 
FieldAccess ::= .ClassName DOT super DOT identifier 
MethodInvocation ::= .MethodName LPAREN ArgumentListopt RPAREN 
MethodInvocation ::= .Primary DOT TypeArgumentsopt identifier LPAREN 
                     ArgumentListopt RPAREN 
MethodInvocation ::= .super DOT TypeArgumentsopt identifier LPAREN 
                     ArgumentListopt RPAREN 
MethodInvocation ::= .ClassName DOT super DOT TypeArgumentsopt identifier 
                     LPAREN ArgumentListopt RPAREN 
MethodInvocation ::= .TypeName DOT TypeArguments identifier LPAREN 
                     ArgumentListopt RPAREN 
ArrayAccess ::= .ExpressionName LBRACKET Expression RBRACKET 
ArrayAccess ::= .PrimaryNoNewArray LBRACKET Expression RBRACKET 
PostfixExpression ::= .Primary 
PostfixExpression ::= .ExpressionName 
PostfixExpression ::= .PostIncrementExpression 
PostfixExpression ::= .PostDecrementExpression 
PostIncrementExpression ::= .PostfixExpression PLUS_PLUS 
PostDecrementExpression ::= .PostfixExpression MINUS_MINUS 
PreIncrementExpression ::= .PLUS_PLUS UnaryExpression 
PreDecrementExpression ::= .MINUS_MINUS UnaryExpression 
Assignment ::= .LeftHandSide AssignmentOperator AssignmentExpression 
LeftHandSide ::= .ExpressionName 
LeftHandSide ::= .FieldAccess 
LeftHandSide ::= .ArrayAccess 
ForInitopt ::= . (456)
ForInitopt ::= .ForInit 
VariableModifiersopt ::= . (462)
VariableModifiersopt ::= .VariableModifiers 

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 438 on "IDENTIFIER" with rule 462

FormalParameter ::= .VariableModifiersopt Type VariableDeclaratorId 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 438 on "boolean" with rule 462

FormalParameter ::= .VariableModifiersopt Type VariableDeclaratorId 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 438 on "char" with rule 462

FormalParameter ::= .VariableModifiersopt Type VariableDeclaratorId 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 438 on "long" with rule 462

FormalParameter ::= .VariableModifiersopt Type VariableDeclaratorId 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 438 on "int" with rule 462

FormalParameter ::= .VariableModifiersopt Type VariableDeclaratorId 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 438 on "short" with rule 462

FormalParameter ::= .VariableModifiersopt Type VariableDeclaratorId 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 438 on "byte" with rule 462

FormalParameter ::= .VariableModifiersopt Type VariableDeclaratorId 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 438 on "double" with rule 462

FormalParameter ::= .VariableModifiersopt Type VariableDeclaratorId 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 438 on "float" with rule 462

FormalParameter ::= .VariableModifiersopt Type VariableDeclaratorId 
VariableModifiersopt ::= . (462)




STATE 452 ----------------------------------------------------------------------
( 434 )

TypeName ::= identifier . (27)
TypeVariable ::= identifier . (30)
ExpressionName ::= identifier . (47)
MethodName ::= identifier . (49)
AmbiguousName ::= identifier . (53)
EnumConstant ::= identifier . (305)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 452 on "LESS" between rule 27 and rule 47 starting at line 275, column 20

ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
RelationalExpression ::= .RelationalExpression LESS ShiftExpression 
RelationalExpression ::= .ShiftExpression 
ShiftExpression ::= .AdditiveExpression 
AdditiveExpression ::= .MultiplicativeExpression 
MultiplicativeExpression ::= .UnaryExpression 
UnaryExpression ::= .UnaryExpressionNotPlusMinus 
UnaryExpressionNotPlusMinus ::= .PostfixExpression 
PostfixExpression ::= .ExpressionName 
ExpressionName ::= identifier . (47)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 452 on "LBRACKET" between rule 27 and rule 47 starting at line 275, column 20

ArrayType ::= .Type LBRACKET RBRACKET 
Type ::= .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
ArrayAccess ::= .ExpressionName LBRACKET Expression RBRACKET 
ExpressionName ::= identifier . (47)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 452 on "LBRACKET" between rule 27 and rule 30 starting at line 236, column 18

ArrayType ::= .Type LBRACKET RBRACKET 
Type ::= .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
ArrayType ::= .Type LBRACKET RBRACKET 
Type ::= .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 452 on "DOT" between rule 27 and rule 53 starting at line 284, column 19

PrimaryNoNewArray ::= .Type DOT class 
Type ::= .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
ExpressionName ::= .AmbiguousName DOT identifier 
AmbiguousName ::= identifier . (53)

GJavaParser.g:231:14:231:27:5968:5981: Warning: Reduce/reduce conflict in state 452 on "DOT" between rule 27 and rule 30 starting at line 236, column 18

PrimaryNoNewArray ::= .Type DOT class 
Type ::= .ReferenceType 
ReferenceType ::= .ClassOrInterfaceType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= identifier . (27)
------------------------------------------------------------------------------
PrimaryNoNewArray ::= .Type DOT class 
Type ::= .ReferenceType 
ReferenceType ::= .TypeVariable 
TypeVariable ::= identifier . (30)

GJavaParser.g:275:20:275:33:7022:7035: Warning: Reduce/reduce conflict in state 452 on "COLON" between rule 47 and rule 305 starting at line 721, column 18

SwitchLabel ::= case  .ConstantExpression COLON 
ConstantExpression ::= .Expression 
Expression ::= .AssignmentExpression 
AssignmentExpression ::= .ConditionalExpression 
ConditionalExpression ::= .ConditionalOrExpression 
ConditionalOrExpression ::= .ConditionalAndExpression 
ConditionalAndExpression ::= .InclusiveOrExpression 
InclusiveOrExpression ::= .ExclusiveOrExpression 
ExclusiveOrExpression ::= .AndExpression 
AndExpression ::= .EqualityExpression 
EqualityExpression ::= .RelationalExpression 
RelationalExpression ::= .ShiftExpression 
ShiftExpression ::= .AdditiveExpression 
AdditiveExpression ::= .MultiplicativeExpression 
MultiplicativeExpression ::= .UnaryExpression 
UnaryExpression ::= .UnaryExpressionNotPlusMinus 
UnaryExpressionNotPlusMinus ::= .PostfixExpression 
PostfixExpression ::= .ExpressionName 
ExpressionName ::= identifier . (47)
------------------------------------------------------------------------------
SwitchLabel ::= case  .EnumConstant COLON 
EnumConstant ::= identifier . (305)




STATE 453 ----------------------------------------------------------------------
( 435 )

BlockStatements ::= BlockStatements  .BlockStatement 
SwitchBlockStatementGroup ::= SwitchLabels BlockStatements . (299)

identifier ::= .IDENTIFIER 
Type ::= .PrimitiveType 
Type ::= .ReferenceType 
PrimitiveType ::= .NumericType 
PrimitiveType ::= .boolean 
NumericType ::= .IntegralType 
NumericType ::= .FloatingPointType 
IntegralType ::= .byte 
IntegralType ::= .short 
IntegralType ::= .int 
IntegralType ::= .long 
IntegralType ::= .char 
FloatingPointType ::= .float 
FloatingPointType ::= .double 
ReferenceType ::= .ClassOrInterfaceType 
ReferenceType ::= .TypeVariable 
ReferenceType ::= .ArrayType 
ClassOrInterfaceType ::= .ClassType 
ClassType ::= .TypeName TypeArgumentsopt 
TypeName ::= .identifier 
TypeName ::= .TypeName DOT identifier 
ClassName ::= .TypeName 
TypeVariable ::= .identifier 
ArrayType ::= .Type LBRACKET RBRACKET 
ExpressionName ::= .identifier 
ExpressionName ::= .AmbiguousName DOT identifier 
MethodName ::= .identifier 
MethodName ::= .AmbiguousName DOT identifier 
AmbiguousName ::= .identifier 
AmbiguousName ::= .AmbiguousName DOT identifier 
ClassDeclaration ::= .NormalClassDeclaration 
ClassDeclaration ::= .EnumDeclaration 
NormalClassDeclaration ::= .ClassModifiersopt class identifier 
                           TypeParametersopt Superopt Interfacesopt ClassBody 
ClassModifiers ::= .ClassModifier 
ClassModifiers ::= .ClassModifiers ClassModifier 
ClassModifier ::= .Annotation 
ClassModifier ::= .public 
ClassModifier ::= .protected 
ClassModifier ::= .private 
ClassModifier ::= .abstract 
ClassModifier ::= .static 
ClassModifier ::= .final 
ClassModifier ::= .strictfp 
VariableModifiers ::= .VariableModifier 
VariableModifiers ::= .VariableModifiers VariableModifier 
VariableModifier ::= .final 
VariableModifier ::= .Annotations 
EnumDeclaration ::= .ClassModifiersopt enum identifier Interfacesopt EnumBody 
Annotations ::= .Annotation 
Annotations ::= .Annotations Annotation 
Annotation ::= .NormalAnnotation 
Annotation ::= .MarkerAnnotation 
Annotation ::= .SingleElementAnnotation 
NormalAnnotation ::= .AT TypeName LPAREN ElementValuePairsopt RPAREN 
MarkerAnnotation ::= .AT TypeName 
SingleElementAnnotation ::= .AT TypeName LPAREN ElementValue RPAREN 
Block ::= .LBRACE BlockStatementsopt RBRACE 
BlockStatement ::= .LocalVariableDeclarationStatement 
BlockStatement ::= .ClassDeclaration 
BlockStatement ::= .Statement 
LocalVariableDeclarationStatement ::= .LocalVariableDeclaration SEMICOLON 
LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
Statement ::= .StatementWithoutTrailingSubstatement 
Statement ::= .LabeledStatement 
Statement ::= .IfThenStatement 
Statement ::= .IfThenElseStatement 
Statement ::= .WhileStatement 
Statement ::= .ForStatement 
StatementWithoutTrailingSubstatement ::= .Block 
StatementWithoutTrailingSubstatement ::= .EmptyStatement 
StatementWithoutTrailingSubstatement ::= .ExpressionStatement 
StatementWithoutTrailingSubstatement ::= .AssertStatement 
StatementWithoutTrailingSubstatement ::= .SwitchStatement 
StatementWithoutTrailingSubstatement ::= .DoStatement 
StatementWithoutTrailingSubstatement ::= .BreakStatement 
StatementWithoutTrailingSubstatement ::= .ContinueStatement 
StatementWithoutTrailingSubstatement ::= .ReturnStatement 
StatementWithoutTrailingSubstatement ::= .SynchronizedStatement 
StatementWithoutTrailingSubstatement ::= .ThrowStatement 
StatementWithoutTrailingSubstatement ::= .TryStatement 
IfThenStatement ::= .if LPAREN Expression RPAREN Statement 
IfThenElseStatement ::= .if LPAREN Expression RPAREN StatementNoShortIf else 
                        Statement 
EmptyStatement ::= .SEMICOLON 
LabeledStatement ::= .identifier COLON Statement 
ExpressionStatement ::= .StatementExpression SEMICOLON 
StatementExpression ::= .Assignment 
StatementExpression ::= .PreIncrementExpression 
StatementExpression ::= .PreDecrementExpression 
StatementExpression ::= .PostIncrementExpression 
StatementExpression ::= .PostDecrementExpression 
StatementExpression ::= .MethodInvocation 
StatementExpression ::= .ClassInstanceCreationExpression 
AssertStatement ::= .assert Expression SEMICOLON 
AssertStatement ::= .assert Expression COLON Expression SEMICOLON 
SwitchStatement ::= .switch LPAREN Expression RPAREN SwitchBlock 
WhileStatement ::= .while LPAREN Expression RPAREN Statement 
DoStatement ::= .do Statement while LPAREN Expression RPAREN SEMICOLON 
ForStatement ::= .BasicForStatement 
ForStatement ::= .EnhancedForStatement 
BasicForStatement ::= .for LPAREN ForInitopt SEMICOLON Expressionopt SEMICOLON 
                      ForUpdateopt RPAREN Statement 
EnhancedForStatement ::= .for LPAREN FormalParameter COLON Expression RPAREN 
                         Statement 
BreakStatement ::= .break identifieropt SEMICOLON 
ContinueStatement ::= .continue identifieropt SEMICOLON 
ReturnStatement ::= .return Expressionopt SEMICOLON 
ThrowStatement ::= .throw Expression SEMICOLON 
SynchronizedStatement ::= .synchronized LPAREN Expression RPAREN Block 
TryStatement ::= .try Block Catches 
TryStatement ::= .try Block Catchesopt Finally 
Primary ::= .PrimaryNoNewArray 
Primary ::= .ArrayCreationExpression 
PrimaryNoNewArray ::= .Literal 
PrimaryNoNewArray ::= .Type DOT class 
PrimaryNoNewArray ::= .void DOT class 
PrimaryNoNewArray ::= .this 
PrimaryNoNewArray ::= .ClassName DOT this 
PrimaryNoNewArray ::= .LPAREN Expression RPAREN 
PrimaryNoNewArray ::= .ClassInstanceCreationExpression 
PrimaryNoNewArray ::= .FieldAccess 
PrimaryNoNewArray ::= .MethodInvocation 
PrimaryNoNewArray ::= .ArrayAccess 
Literal ::= .IntegerLiteral 
Literal ::= .LongLiteral 
Literal ::= .FloatingPointLiteral 
Literal ::= .DoubleLiteral 
Literal ::= .BooleanLiteral 
Literal ::= .CharacterLiteral 
Literal ::= .StringLiteral 
Literal ::= .null 
BooleanLiteral ::= .true 
BooleanLiteral ::= .false 
ClassInstanceCreationExpression ::= .new TypeArgumentsopt ClassOrInterfaceType 
                                    TypeArgumentsopt LPAREN ArgumentListopt 
                                    RPAREN ClassBodyopt 
ClassInstanceCreationExpression ::= .Primary DOT new TypeArgumentsopt 
                                    identifier TypeArgumentsopt LPAREN 
                                    ArgumentListopt RPAREN ClassBodyopt 
ArrayCreationExpression ::= .new PrimitiveType DimExprs Dimsopt 
ArrayCreationExpression ::= .new ClassOrInterfaceType DimExprs Dimsopt 
ArrayCreationExpression ::= .new PrimitiveType Dims ArrayInitializer 
ArrayCreationExpression ::= .new ClassOrInterfaceType Dims ArrayInitializer 
FieldAccess ::= .Primary DOT identifier 
FieldAccess ::= .super DOT identifier 
FieldAccess ::= .ClassName DOT super DOT identifier 
MethodInvocation ::= .MethodName LPAREN ArgumentListopt RPAREN 
MethodInvocation ::= .Primary DOT TypeArgumentsopt identifier LPAREN 
                     ArgumentListopt RPAREN 
MethodInvocation ::= .super DOT TypeArgumentsopt identifier LPAREN 
                     ArgumentListopt RPAREN 
MethodInvocation ::= .ClassName DOT super DOT TypeArgumentsopt identifier 
                     LPAREN ArgumentListopt RPAREN 
MethodInvocation ::= .TypeName DOT TypeArguments identifier LPAREN 
                     ArgumentListopt RPAREN 
ArrayAccess ::= .ExpressionName LBRACKET Expression RBRACKET 
ArrayAccess ::= .PrimaryNoNewArray LBRACKET Expression RBRACKET 
PostfixExpression ::= .Primary 
PostfixExpression ::= .ExpressionName 
PostfixExpression ::= .PostIncrementExpression 
PostfixExpression ::= .PostDecrementExpression 
PostIncrementExpression ::= .PostfixExpression PLUS_PLUS 
PostDecrementExpression ::= .PostfixExpression MINUS_MINUS 
PreIncrementExpression ::= .PLUS_PLUS UnaryExpression 
PreDecrementExpression ::= .MINUS_MINUS UnaryExpression 
Assignment ::= .LeftHandSide AssignmentOperator AssignmentExpression 
LeftHandSide ::= .ExpressionName 
LeftHandSide ::= .FieldAccess 
LeftHandSide ::= .ArrayAccess 
VariableModifiersopt ::= . (462)
VariableModifiersopt ::= .VariableModifiers 
ClassModifiersopt ::= . (520)
ClassModifiersopt ::= .ClassModifiers 

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 453 on "double" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 453 on "float" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 453 on "char" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 453 on "long" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 453 on "int" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 453 on "short" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 453 on "byte" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 453 on "boolean" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)

GJavaParser.g:977:26:977:35:31195:31204: Warning: Shift/reduce conflict in state 453 on "IDENTIFIER" with rule 462

LocalVariableDeclaration ::= .VariableModifiersopt Type VariableDeclarators 
VariableModifiersopt ::= . (462)



GJavaParser.g:163:5:163:19:4248:4262: Warning: Grammar is not LALR(1) - it contains 535 reduce/reduce conflicts and 133 shift/reduce conflicts.

Number of Terminals: 117
Number of Nonterminals: 248
Number of Productions: 538
Number of Items: 1507
Number of Scopes: 84
Number of States: 473
Number of Shift actions: 1432
Number of Goto actions: 2121
Number of Shift/Reduce actions: 2150
Number of Goto/Reduce actions: 3030
Number of Reduce actions: 3710
Number of Shift-Reduce conflicts: 133
Number of Reduce-Reduce conflicts: 535
Number of Keyword/Identifier Shift conflicts: 0
Number of Keyword/Identifier Shift-Reduce conflicts: 0
Number of Keyword/Identifier Reduce-Reduce conflicts: 0

Number of entries in base Action Table: 5624
Additional space required for compaction of Action Table: 13.6%

Number of unique terminal states: 332
Number of Shift actions saved by merging: 2294
Number of Conflict points saved by merging: 21
Number of Reduce actions saved by merging: 160
Number of Reduce saved by default: 2315

Number of entries in Terminal Action Table: 2166
Additional space required for compaction of Terminal Table: 6.6%

Actions in Compressed Tables:
     Number of Shifts: 567
     Number of Shift/Reduces: 592
     Number of conflict points: 511
     Number of Gotos: 2121
     Number of Goto/Reduces: 3030
     Number of Reduces: 164
     Number of Defaults: 163

Parsing Tables storage:
    Storage required for BASE_CHECK: 13916 Bytes
    Storage required for BASE_ACTION: 14772 Bytes
    Storage required for TERM_CHECK: 2360 Bytes
    Storage required for TERM_ACTION: 4620 Bytes

Error maps storage:
    Storage required for ACTION_SYMBOLS_BASE map: 948 Bytes
    Storage required for ACTION_SYMBOLS_RANGE map: 812 Bytes
    Storage required for NACTION_SYMBOLS_BASE map: 948 Bytes
    Storage required for NACTION_SYMBOLS_RANGE map: 424 Bytes
    Storage required for TERMINAL_INDEX map: 236 Bytes
    Storage required for NON_TERMINAL_INDEX map: 500 Bytes

    Storage required for SCOPE_PREFIX map: 168 Bytes
    Storage required for SCOPE_SUFFIX map: 168 Bytes
    Storage required for SCOPE_LHS_SYMBOL map: 168 Bytes
    Storage required for SCOPE_LOOK_AHEAD map: 84 Bytes
    Storage required for SCOPE_STATE_SET map: 168 Bytes
    Storage required for SCOPE_RIGHT_SIDE map: 928 Bytes
    Storage required for SCOPE_STATE map: 584 Bytes
    Storage required for IN_SYMB map: 948 Bytes

    Number of names: 251
    Number of characters in name: 2682
