
Options in effect for GJavaKWLexer.gi:

    ACTION-BLOCK=("JavaKWLexer.rs","/.","./")

    AST-DIRECTORY=""  AST-TYPE="Ast"  NOATTRIBUTES  NOAUTOMATIC-AST  NOBACKTRACK
    BYTE  CONFLICTS  DAT-DIRECTORY=""  DAT-FILE="JavaKWLexerdcl.data"  
    DCL-FILE="JavaKWLexerdcl.rs"  NODEBUG  DEF-FILE="JavaKWLexerdef.rs"  
    DIRECTORY-PREFIX=""  NOEDIT  NOERROR-MAPS  ESCAPE='$'  
    EXPORT-TERMINALS=("JavaParsersym.rs","TK_","")  EXTENDS-PARSETABLE  
    FACTORY=""  FILE-PREFIX="JavaKWLexer"  NOFIRST  NOFOLLOW  NOGLR  
    NOGOTO-DEFAULT  GRM-FILE="GJavaKWLexer.gi"  IMP-FILE="JavaKWLexerimp.rs"  
    INCLUDE-DIRECTORY="/Users/kuafu/workspace/lpg-project/LPG2/lpg2/../lpg-generator-templates-2.1.00/include/rust"
    LALR=1  LEGACY  NOLIST  MARGIN=4  MAX-CASES=1024  NAMES=OPTIMIZED  
    NONT-CHECK  OR_MARKER='|'  OUT-DIRECTORY=""  PACKAGE="java"  NOPARENT-SAVE
    PARSETABLE-INTERFACES="ParseTable"  PREFIX="Char_"  PRIORITY  
    PROGRAMMING_LANGUAGE=RUST  PRS-FILE="JavaKWLexerprs.rs"  NOQUIET  
    READ-REDUCE  REMAP-TERMINALS  RULE_CLASSNAMES=SEQUENTIAL  NOSCOPES  
    NOSERIALIZE  NOSHIFT-DEFAULT  SINGLE-PRODUCTIONS  NOSOFT-KEYWORDS  STATES  
    SUFFIX=""  SYM-FILE="JavaKWLexersym.rs"  TAB-FILE="GJavaKWLexer.t"  TABLE  
    TEMPLATE="KeywordTemplateF.gi"  TRACE=CONFLICTS  NOVARIABLES  NOVERBOSE  
    NOVISITOR  VISITOR-TYPE="Visitor"  WARNINGS  NOXREF  

GJavaKWLexer.gi:9:5:9:28:141:164: Warning: Some options may have been imported from the included file "/Users/kuafu/workspace/lpg-project/LPG2/lpg2/../lpg-generator-templates-2.1.00/include/rust/KWLexerFoldedCaseMapF.gi"
/Users/kuafu/workspace/lpg-project/LPG2/lpg2/../lpg-generator-templates-2.1.00/include/rust/KWLexerFoldedCaseMapF.gi:19:22:19:22:533:533: Warning: The macro "$" is undefined. No substitution made
/Users/kuafu/workspace/lpg-project/LPG2/lpg2/../lpg-generator-templates-2.1.00/include/rust/KWLexerFoldedCaseMapF.gi:3:5:3:11:39:45: Informative: The terminal Percent is useless.
/Users/kuafu/workspace/lpg-project/LPG2/lpg2/../lpg-generator-templates-2.1.00/include/rust/KWLexerFoldedCaseMapF.gi:4:5:4:5:59:59: Informative: The terminal _ is useless.
/Users/kuafu/workspace/lpg-project/LPG2/lpg2/../lpg-generator-templates-2.1.00/include/rust/KWLexerFoldedCaseMapF.gi:5:37:5:37:97:97: Informative: The terminal q is useless.
/Users/kuafu/workspace/lpg-project/LPG2/lpg2/../lpg-generator-templates-2.1.00/include/rust/KWLexerFoldedCaseMapF.gi:6:5:6:5:121:121: Informative: The terminal 0 is useless.
/Users/kuafu/workspace/lpg-project/LPG2/lpg2/../lpg-generator-templates-2.1.00/include/rust/KWLexerFoldedCaseMapF.gi:6:10:6:10:126:126: Informative: The terminal 1 is useless.
/Users/kuafu/workspace/lpg-project/LPG2/lpg2/../lpg-generator-templates-2.1.00/include/rust/KWLexerFoldedCaseMapF.gi:6:15:6:15:131:131: Informative: The terminal 2 is useless.
/Users/kuafu/workspace/lpg-project/LPG2/lpg2/../lpg-generator-templates-2.1.00/include/rust/KWLexerFoldedCaseMapF.gi:6:20:6:20:136:136: Informative: The terminal 3 is useless.
/Users/kuafu/workspace/lpg-project/LPG2/lpg2/../lpg-generator-templates-2.1.00/include/rust/KWLexerFoldedCaseMapF.gi:6:25:6:25:141:141: Informative: The terminal 4 is useless.
/Users/kuafu/workspace/lpg-project/LPG2/lpg2/../lpg-generator-templates-2.1.00/include/rust/KWLexerFoldedCaseMapF.gi:6:30:6:30:146:146: Informative: The terminal 5 is useless.
/Users/kuafu/workspace/lpg-project/LPG2/lpg2/../lpg-generator-templates-2.1.00/include/rust/KWLexerFoldedCaseMapF.gi:6:35:6:35:151:151: Informative: The terminal 6 is useless.
/Users/kuafu/workspace/lpg-project/LPG2/lpg2/../lpg-generator-templates-2.1.00/include/rust/KWLexerFoldedCaseMapF.gi:6:40:6:40:156:156: Informative: The terminal 7 is useless.
/Users/kuafu/workspace/lpg-project/LPG2/lpg2/../lpg-generator-templates-2.1.00/include/rust/KWLexerFoldedCaseMapF.gi:6:45:6:45:161:161: Informative: The terminal 8 is useless.
/Users/kuafu/workspace/lpg-project/LPG2/lpg2/../lpg-generator-templates-2.1.00/include/rust/KWLexerFoldedCaseMapF.gi:6:50:6:50:166:166: Informative: The terminal 9 is useless.


GJavaKWLexer.gi:82:5:82:11:1016:1022: Informative: Grammar is  LALR(1).

Number of Terminals: 40
Number of Nonterminals: 1
Number of Productions: 61
Number of Single Productions: 0
Number of Items: 434
Number of States: 242
Number of Shift actions: 240
Number of Goto actions: 1
Number of Shift/Reduce actions: 56
Number of Goto/Reduce actions: 0
Number of Reduce actions: 5
Number of Shift-Reduce conflicts: 0
Number of Reduce-Reduce conflicts: 0


 The LALR Parser Generator              2.2.03 (Jul 14 2026)

Shift STATES: 


STATE 1 ------------------------------------------------------------------------
( )

'$accept' ::= .KeyWord 

KeyWord ::= .a b s t r a c t 
KeyWord ::= .a s s e r t 
KeyWord ::= .b o o l e a n 
KeyWord ::= .b r e a k 
KeyWord ::= .b y t e 
KeyWord ::= .c a s e 
KeyWord ::= .c a t c h 
KeyWord ::= .c h a r 
KeyWord ::= .c l a s s 
KeyWord ::= .c o n s t 
KeyWord ::= .c o n t i n u e 
KeyWord ::= .d e f a u l t 
KeyWord ::= .d o 
KeyWord ::= .d o u b l e 
KeyWord ::= .e l s e 
KeyWord ::= .e n u m 
KeyWord ::= .e x t e n d s 
KeyWord ::= .f a l s e 
KeyWord ::= .f i n a l 
KeyWord ::= .f i n a l l y 
KeyWord ::= .f l o a t 
KeyWord ::= .f o r 
KeyWord ::= .g o t o 
KeyWord ::= .i f 
KeyWord ::= .i m p l e m e n t s 
KeyWord ::= .i m p o r t 
KeyWord ::= .i n s t a n c e o f 
KeyWord ::= .i n t 
KeyWord ::= .i n t e r f a c e 
KeyWord ::= .l o n g 
KeyWord ::= .n a t i v e 
KeyWord ::= .n e w 
KeyWord ::= .n u l l 
KeyWord ::= .p a c k a g e 
KeyWord ::= .p r i v a t e 
KeyWord ::= .p r o t e c t e d 
KeyWord ::= .p u b l i c 
KeyWord ::= .r e t u r n 
KeyWord ::= .s h o r t 
KeyWord ::= .s t a t i c 
KeyWord ::= .s t r i c t f p 
KeyWord ::= .s u p e r 
KeyWord ::= .s w i t c h 
KeyWord ::= .s y n c h r o n i z e d 
KeyWord ::= .t h i s 
KeyWord ::= .t h r o w 
KeyWord ::= .t h r o w s 
KeyWord ::= .t r a n s i e n t 
KeyWord ::= .t r u e 
KeyWord ::= .t r y 
KeyWord ::= .v o i d 
KeyWord ::= .v o l a t i l e 
KeyWord ::= .w h i l e 
KeyWord ::= .DollarSign b e g i n a c t i o n 
KeyWord ::= .DollarSign b e g i n j a v a 
KeyWord ::= .DollarSign e n d a c t i o n 
KeyWord ::= .DollarSign e n d j a v a 
KeyWord ::= .DollarSign n o a c t i o n 
KeyWord ::= .DollarSign n u l l a c t i o n 
KeyWord ::= .DollarSign b a d a c t i o n 

DollarSign    Shift  3
w             Shift  4
v             Shift  5
t             Shift  6
s             Shift  7
r             Shift  8
p             Shift  9
n             Shift  10
l             Shift  11
i             Shift  12
g             Shift  13
f             Shift  14
e             Shift  15
d             Shift  16
c             Shift  17
b             Shift  18
a             Shift  19

KeyWord       Goto   2



STATE 2 ------------------------------------------------------------------------
( 1 )

'$accept' ::= KeyWord . (0)

EOF    Accept


STATE 3 ------------------------------------------------------------------------
( 1 )

KeyWord ::= DollarSign  .b e g i n a c t i o n 
KeyWord ::= DollarSign  .b e g i n j a v a 
KeyWord ::= DollarSign  .e n d a c t i o n 
KeyWord ::= DollarSign  .e n d j a v a 
KeyWord ::= DollarSign  .n o a c t i o n 
KeyWord ::= DollarSign  .n u l l a c t i o n 
KeyWord ::= DollarSign  .b a d a c t i o n 

n    Shift  20
e    Shift  21
b    Shift  22



STATE 4 ------------------------------------------------------------------------
( 1 )

KeyWord ::= w  .h i l e 

h    Shift  23



STATE 5 ------------------------------------------------------------------------
( 1 )

KeyWord ::= v  .o i d 
KeyWord ::= v  .o l a t i l e 

o    Shift  24



STATE 6 ------------------------------------------------------------------------
( 1 )

KeyWord ::= t  .h i s 
KeyWord ::= t  .h r o w 
KeyWord ::= t  .h r o w s 
KeyWord ::= t  .r a n s i e n t 
KeyWord ::= t  .r u e 
KeyWord ::= t  .r y 

r    Shift  25
h    Shift  26



STATE 7 ------------------------------------------------------------------------
( 1 )

KeyWord ::= s  .h o r t 
KeyWord ::= s  .t a t i c 
KeyWord ::= s  .t r i c t f p 
KeyWord ::= s  .u p e r 
KeyWord ::= s  .w i t c h 
KeyWord ::= s  .y n c h r o n i z e d 

y    Shift  27
w    Shift  28
u    Shift  29
t    Shift  30
h    Shift  31



STATE 8 ------------------------------------------------------------------------
( 1 )

KeyWord ::= r  .e t u r n 

e    Shift  32



STATE 9 ------------------------------------------------------------------------
( 1 )

KeyWord ::= p  .a c k a g e 
KeyWord ::= p  .r i v a t e 
KeyWord ::= p  .r o t e c t e d 
KeyWord ::= p  .u b l i c 

u    Shift  33
r    Shift  34
a    Shift  35



STATE 10 -----------------------------------------------------------------------
( 1 )

KeyWord ::= n  .a t i v e 
KeyWord ::= n  .e w 
KeyWord ::= n  .u l l 

u    Shift  36
e    Shift  37
a    Shift  38



STATE 11 -----------------------------------------------------------------------
( 1 )

KeyWord ::= l  .o n g 

o    Shift  39



STATE 12 -----------------------------------------------------------------------
( 1 )

KeyWord ::= i  .f 
KeyWord ::= i  .m p l e m e n t s 
KeyWord ::= i  .m p o r t 
KeyWord ::= i  .n s t a n c e o f 
KeyWord ::= i  .n t 
KeyWord ::= i  .n t e r f a c e 

n    Shift  40
m    Shift  41
f    Sh/Rd  24



STATE 13 -----------------------------------------------------------------------
( 1 )

KeyWord ::= g  .o t o 

o    Shift  42



STATE 14 -----------------------------------------------------------------------
( 1 )

KeyWord ::= f  .a l s e 
KeyWord ::= f  .i n a l 
KeyWord ::= f  .i n a l l y 
KeyWord ::= f  .l o a t 
KeyWord ::= f  .o r 

o    Shift  43
l    Shift  44
i    Shift  45
a    Shift  46



STATE 15 -----------------------------------------------------------------------
( 1 )

KeyWord ::= e  .l s e 
KeyWord ::= e  .n u m 
KeyWord ::= e  .x t e n d s 

x    Shift  47
n    Shift  48
l    Shift  49



STATE 16 -----------------------------------------------------------------------
( 1 )

KeyWord ::= d  .e f a u l t 
KeyWord ::= d  .o 
KeyWord ::= d  .o u b l e 

o    Shift  50
e    Shift  51



STATE 17 -----------------------------------------------------------------------
( 1 )

KeyWord ::= c  .a s e 
KeyWord ::= c  .a t c h 
KeyWord ::= c  .h a r 
KeyWord ::= c  .l a s s 
KeyWord ::= c  .o n s t 
KeyWord ::= c  .o n t i n u e 

o    Shift  52
l    Shift  53
h    Shift  54
a    Shift  55



STATE 18 -----------------------------------------------------------------------
( 1 )

KeyWord ::= b  .o o l e a n 
KeyWord ::= b  .r e a k 
KeyWord ::= b  .y t e 

y    Shift  56
r    Shift  57
o    Shift  58



STATE 19 -----------------------------------------------------------------------
( 1 )

KeyWord ::= a  .b s t r a c t 
KeyWord ::= a  .s s e r t 

s    Shift  59
b    Shift  60



STATE 20 -----------------------------------------------------------------------
( 3 )

KeyWord ::= DollarSign n  .o a c t i o n 
KeyWord ::= DollarSign n  .u l l a c t i o n 

u    Shift  61
o    Shift  62



STATE 21 -----------------------------------------------------------------------
( 3 )

KeyWord ::= DollarSign e  .n d a c t i o n 
KeyWord ::= DollarSign e  .n d j a v a 

n    Shift  63



STATE 22 -----------------------------------------------------------------------
( 3 )

KeyWord ::= DollarSign b  .e g i n a c t i o n 
KeyWord ::= DollarSign b  .e g i n j a v a 
KeyWord ::= DollarSign b  .a d a c t i o n 

a    Shift  64
e    Shift  65



STATE 23 -----------------------------------------------------------------------
( 4 )

KeyWord ::= w h  .i l e 

i    Shift  66



STATE 24 -----------------------------------------------------------------------
( 5 )

KeyWord ::= v o  .i d 
KeyWord ::= v o  .l a t i l e 

l    Shift  67
i    Shift  68



STATE 25 -----------------------------------------------------------------------
( 6 )

KeyWord ::= t r  .a n s i e n t 
KeyWord ::= t r  .u e 
KeyWord ::= t r  .y 

y    Sh/Rd  50
u    Shift  69
a    Shift  70



STATE 26 -----------------------------------------------------------------------
( 6 )

KeyWord ::= t h  .i s 
KeyWord ::= t h  .r o w 
KeyWord ::= t h  .r o w s 

r    Shift  71
i    Shift  72



STATE 27 -----------------------------------------------------------------------
( 7 )

KeyWord ::= s y  .n c h r o n i z e d 

n    Shift  73



STATE 28 -----------------------------------------------------------------------
( 7 )

KeyWord ::= s w  .i t c h 

i    Shift  74



STATE 29 -----------------------------------------------------------------------
( 7 )

KeyWord ::= s u  .p e r 

p    Shift  75



STATE 30 -----------------------------------------------------------------------
( 7 )

KeyWord ::= s t  .a t i c 
KeyWord ::= s t  .r i c t f p 

r    Shift  76
a    Shift  77



STATE 31 -----------------------------------------------------------------------
( 7 )

KeyWord ::= s h  .o r t 

o    Shift  78



STATE 32 -----------------------------------------------------------------------
( 8 )

KeyWord ::= r e  .t u r n 

t    Shift  79



STATE 33 -----------------------------------------------------------------------
( 9 )

KeyWord ::= p u  .b l i c 

b    Shift  80



STATE 34 -----------------------------------------------------------------------
( 9 )

KeyWord ::= p r  .i v a t e 
KeyWord ::= p r  .o t e c t e d 

o    Shift  81
i    Shift  82



STATE 35 -----------------------------------------------------------------------
( 9 )

KeyWord ::= p a  .c k a g e 

c    Shift  83



STATE 36 -----------------------------------------------------------------------
( 10 )

KeyWord ::= n u  .l l 

l    Shift  84



STATE 37 -----------------------------------------------------------------------
( 10 )

KeyWord ::= n e  .w 

w    Sh/Rd  32



STATE 38 -----------------------------------------------------------------------
( 10 )

KeyWord ::= n a  .t i v e 

t    Shift  85



STATE 39 -----------------------------------------------------------------------
( 11 )

KeyWord ::= l o  .n g 

n    Shift  86



STATE 40 -----------------------------------------------------------------------
( 12 )

KeyWord ::= i n  .s t a n c e o f 
KeyWord ::= i n  .t 
KeyWord ::= i n  .t e r f a c e 

t    Shift  87
s    Shift  88



STATE 41 -----------------------------------------------------------------------
( 12 )

KeyWord ::= i m  .p l e m e n t s 
KeyWord ::= i m  .p o r t 

p    Shift  89



STATE 42 -----------------------------------------------------------------------
( 13 )

KeyWord ::= g o  .t o 

t    Shift  90



STATE 43 -----------------------------------------------------------------------
( 14 )

KeyWord ::= f o  .r 

r    Sh/Rd  22



STATE 44 -----------------------------------------------------------------------
( 14 )

KeyWord ::= f l  .o a t 

o    Shift  91



STATE 45 -----------------------------------------------------------------------
( 14 )

KeyWord ::= f i  .n a l 
KeyWord ::= f i  .n a l l y 

n    Shift  92



STATE 46 -----------------------------------------------------------------------
( 14 )

KeyWord ::= f a  .l s e 

l    Shift  93



STATE 47 -----------------------------------------------------------------------
( 15 )

KeyWord ::= e x  .t e n d s 

t    Shift  94



STATE 48 -----------------------------------------------------------------------
( 15 )

KeyWord ::= e n  .u m 

u    Shift  95



STATE 49 -----------------------------------------------------------------------
( 15 )

KeyWord ::= e l  .s e 

s    Shift  96



STATE 50 -----------------------------------------------------------------------
( 16 )

KeyWord ::= d o . (13)
KeyWord ::= d o  .u b l e 

u      Shift  97

EOF    Reduce 13

Default reduction to rule  13


STATE 51 -----------------------------------------------------------------------
( 16 )

KeyWord ::= d e  .f a u l t 

f    Shift  98



STATE 52 -----------------------------------------------------------------------
( 17 )

KeyWord ::= c o  .n s t 
KeyWord ::= c o  .n t i n u e 

n    Shift  99



STATE 53 -----------------------------------------------------------------------
( 17 )

KeyWord ::= c l  .a s s 

a    Shift  100



STATE 54 -----------------------------------------------------------------------
( 17 )

KeyWord ::= c h  .a r 

a    Shift  101



STATE 55 -----------------------------------------------------------------------
( 17 )

KeyWord ::= c a  .s e 
KeyWord ::= c a  .t c h 

t    Shift  102
s    Shift  103



STATE 56 -----------------------------------------------------------------------
( 18 )

KeyWord ::= b y  .t e 

t    Shift  104



STATE 57 -----------------------------------------------------------------------
( 18 )

KeyWord ::= b r  .e a k 

e    Shift  105



STATE 58 -----------------------------------------------------------------------
( 18 )

KeyWord ::= b o  .o l e a n 

o    Shift  106



STATE 59 -----------------------------------------------------------------------
( 19 )

KeyWord ::= a s  .s e r t 

s    Shift  107



STATE 60 -----------------------------------------------------------------------
( 19 )

KeyWord ::= a b  .s t r a c t 

s    Shift  108



STATE 61 -----------------------------------------------------------------------
( 20 )

KeyWord ::= DollarSign n u  .l l a c t i o n 

l    Shift  109



STATE 62 -----------------------------------------------------------------------
( 20 )

KeyWord ::= DollarSign n o  .a c t i o n 

a    Shift  110



STATE 63 -----------------------------------------------------------------------
( 21 )

KeyWord ::= DollarSign e n  .d a c t i o n 
KeyWord ::= DollarSign e n  .d j a v a 

d    Shift  111



STATE 64 -----------------------------------------------------------------------
( 22 )

KeyWord ::= DollarSign b a  .d a c t i o n 

d    Shift  112



STATE 65 -----------------------------------------------------------------------
( 22 )

KeyWord ::= DollarSign b e  .g i n a c t i o n 
KeyWord ::= DollarSign b e  .g i n j a v a 

g    Shift  113



STATE 66 -----------------------------------------------------------------------
( 23 )

KeyWord ::= w h i  .l e 

l    Shift  114



STATE 67 -----------------------------------------------------------------------
( 24 )

KeyWord ::= v o l  .a t i l e 

a    Shift  115



STATE 68 -----------------------------------------------------------------------
( 24 )

KeyWord ::= v o i  .d 

d    Sh/Rd  51



STATE 69 -----------------------------------------------------------------------
( 25 )

KeyWord ::= t r u  .e 

e    Sh/Rd  49



STATE 70 -----------------------------------------------------------------------
( 25 )

KeyWord ::= t r a  .n s i e n t 

n    Shift  116



STATE 71 -----------------------------------------------------------------------
( 26 )

KeyWord ::= t h r  .o w 
KeyWord ::= t h r  .o w s 

o    Shift  117



STATE 72 -----------------------------------------------------------------------
( 26 )

KeyWord ::= t h i  .s 

s    Sh/Rd  45



STATE 73 -----------------------------------------------------------------------
( 27 )

KeyWord ::= s y n  .c h r o n i z e d 

c    Shift  118



STATE 74 -----------------------------------------------------------------------
( 28 )

KeyWord ::= s w i  .t c h 

t    Shift  119



STATE 75 -----------------------------------------------------------------------
( 29 )

KeyWord ::= s u p  .e r 

e    Shift  120



STATE 76 -----------------------------------------------------------------------
( 30 )

KeyWord ::= s t r  .i c t f p 

i    Shift  121



STATE 77 -----------------------------------------------------------------------
( 30 )

KeyWord ::= s t a  .t i c 

t    Shift  122



STATE 78 -----------------------------------------------------------------------
( 31 )

KeyWord ::= s h o  .r t 

r    Shift  123



STATE 79 -----------------------------------------------------------------------
( 32 )

KeyWord ::= r e t  .u r n 

u    Shift  124



STATE 80 -----------------------------------------------------------------------
( 33 )

KeyWord ::= p u b  .l i c 

l    Shift  125



STATE 81 -----------------------------------------------------------------------
( 34 )

KeyWord ::= p r o  .t e c t e d 

t    Shift  126



STATE 82 -----------------------------------------------------------------------
( 34 )

KeyWord ::= p r i  .v a t e 

v    Shift  127



STATE 83 -----------------------------------------------------------------------
( 35 )

KeyWord ::= p a c  .k a g e 

k    Shift  128



STATE 84 -----------------------------------------------------------------------
( 36 )

KeyWord ::= n u l  .l 

l    Sh/Rd  33



STATE 85 -----------------------------------------------------------------------
( 38 )

KeyWord ::= n a t  .i v e 

i    Shift  129



STATE 86 -----------------------------------------------------------------------
( 39 )

KeyWord ::= l o n  .g 

g    Sh/Rd  30



STATE 87 -----------------------------------------------------------------------
( 40 )

KeyWord ::= i n t . (28)
KeyWord ::= i n t  .e r f a c e 

e      Shift  130

EOF    Reduce 28

Default reduction to rule  28


STATE 88 -----------------------------------------------------------------------
( 40 )

KeyWord ::= i n s  .t a n c e o f 

t    Shift  131



STATE 89 -----------------------------------------------------------------------
( 41 )

KeyWord ::= i m p  .l e m e n t s 
KeyWord ::= i m p  .o r t 

o    Shift  132
l    Shift  133



STATE 90 -----------------------------------------------------------------------
( 42 )

KeyWord ::= g o t  .o 

o    Sh/Rd  23



STATE 91 -----------------------------------------------------------------------
( 44 )

KeyWord ::= f l o  .a t 

a    Shift  134



STATE 92 -----------------------------------------------------------------------
( 45 )

KeyWord ::= f i n  .a l 
KeyWord ::= f i n  .a l l y 

a    Shift  135



STATE 93 -----------------------------------------------------------------------
( 46 )

KeyWord ::= f a l  .s e 

s    Shift  136



STATE 94 -----------------------------------------------------------------------
( 47 )

KeyWord ::= e x t  .e n d s 

e    Shift  137



STATE 95 -----------------------------------------------------------------------
( 48 )

KeyWord ::= e n u  .m 

m    Sh/Rd  16



STATE 96 -----------------------------------------------------------------------
( 49 )

KeyWord ::= e l s  .e 

e    Sh/Rd  15



STATE 97 -----------------------------------------------------------------------
( 50 )

KeyWord ::= d o u  .b l e 

b    Shift  138



STATE 98 -----------------------------------------------------------------------
( 51 )

KeyWord ::= d e f  .a u l t 

a    Shift  139



STATE 99 -----------------------------------------------------------------------
( 52 )

KeyWord ::= c o n  .s t 
KeyWord ::= c o n  .t i n u e 

t    Shift  140
s    Shift  141



STATE 100 ----------------------------------------------------------------------
( 53 )

KeyWord ::= c l a  .s s 

s    Shift  142



STATE 101 ----------------------------------------------------------------------
( 54 )

KeyWord ::= c h a  .r 

r    Sh/Rd  8



STATE 102 ----------------------------------------------------------------------
( 55 )

KeyWord ::= c a t  .c h 

c    Shift  143



STATE 103 ----------------------------------------------------------------------
( 55 )

KeyWord ::= c a s  .e 

e    Sh/Rd  6



STATE 104 ----------------------------------------------------------------------
( 56 )

KeyWord ::= b y t  .e 

e    Sh/Rd  5



STATE 105 ----------------------------------------------------------------------
( 57 )

KeyWord ::= b r e  .a k 

a    Shift  144



STATE 106 ----------------------------------------------------------------------
( 58 )

KeyWord ::= b o o  .l e a n 

l    Shift  145



STATE 107 ----------------------------------------------------------------------
( 59 )

KeyWord ::= a s s  .e r t 

e    Shift  146



STATE 108 ----------------------------------------------------------------------
( 60 )

KeyWord ::= a b s  .t r a c t 

t    Shift  147



STATE 109 ----------------------------------------------------------------------
( 61 )

KeyWord ::= DollarSign n u l  .l a c t i o n 

l    Shift  148



STATE 110 ----------------------------------------------------------------------
( 62 )

KeyWord ::= DollarSign n o a  .c t i o n 

c    Shift  149



STATE 111 ----------------------------------------------------------------------
( 63 )

KeyWord ::= DollarSign e n d  .a c t i o n 
KeyWord ::= DollarSign e n d  .j a v a 

j    Shift  150
a    Shift  151



STATE 112 ----------------------------------------------------------------------
( 64 )

KeyWord ::= DollarSign b a d  .a c t i o n 

a    Shift  152



STATE 113 ----------------------------------------------------------------------
( 65 )

KeyWord ::= DollarSign b e g  .i n a c t i o n 
KeyWord ::= DollarSign b e g  .i n j a v a 

i    Shift  153



STATE 114 ----------------------------------------------------------------------
( 66 )

KeyWord ::= w h i l  .e 

e    Sh/Rd  53



STATE 115 ----------------------------------------------------------------------
( 67 )

KeyWord ::= v o l a  .t i l e 

t    Shift  154



STATE 116 ----------------------------------------------------------------------
( 70 )

KeyWord ::= t r a n  .s i e n t 

s    Shift  155



STATE 117 ----------------------------------------------------------------------
( 71 )

KeyWord ::= t h r o  .w 
KeyWord ::= t h r o  .w s 

w    Shift  156



STATE 118 ----------------------------------------------------------------------
( 73 )

KeyWord ::= s y n c  .h r o n i z e d 

h    Shift  157



STATE 119 ----------------------------------------------------------------------
( 74 )

KeyWord ::= s w i t  .c h 

c    Shift  158



STATE 120 ----------------------------------------------------------------------
( 75 )

KeyWord ::= s u p e  .r 

r    Sh/Rd  42



STATE 121 ----------------------------------------------------------------------
( 76 )

KeyWord ::= s t r i  .c t f p 

c    Shift  159



STATE 122 ----------------------------------------------------------------------
( 77 )

KeyWord ::= s t a t  .i c 

i    Shift  160



STATE 123 ----------------------------------------------------------------------
( 78 )

KeyWord ::= s h o r  .t 

t    Sh/Rd  39



STATE 124 ----------------------------------------------------------------------
( 79 )

KeyWord ::= r e t u  .r n 

r    Shift  161



STATE 125 ----------------------------------------------------------------------
( 80 )

KeyWord ::= p u b l  .i c 

i    Shift  162



STATE 126 ----------------------------------------------------------------------
( 81 )

KeyWord ::= p r o t  .e c t e d 

e    Shift  163



STATE 127 ----------------------------------------------------------------------
( 82 )

KeyWord ::= p r i v  .a t e 

a    Shift  164



STATE 128 ----------------------------------------------------------------------
( 83 )

KeyWord ::= p a c k  .a g e 

a    Shift  165



STATE 129 ----------------------------------------------------------------------
( 85 )

KeyWord ::= n a t i  .v e 

v    Shift  166



STATE 130 ----------------------------------------------------------------------
( 87 )

KeyWord ::= i n t e  .r f a c e 

r    Shift  167



STATE 131 ----------------------------------------------------------------------
( 88 )

KeyWord ::= i n s t  .a n c e o f 

a    Shift  168



STATE 132 ----------------------------------------------------------------------
( 89 )

KeyWord ::= i m p o  .r t 

r    Shift  169



STATE 133 ----------------------------------------------------------------------
( 89 )

KeyWord ::= i m p l  .e m e n t s 

e    Shift  170



STATE 134 ----------------------------------------------------------------------
( 91 )

KeyWord ::= f l o a  .t 

t    Sh/Rd  21



STATE 135 ----------------------------------------------------------------------
( 92 )

KeyWord ::= f i n a  .l 
KeyWord ::= f i n a  .l l y 

l    Shift  171



STATE 136 ----------------------------------------------------------------------
( 93 )

KeyWord ::= f a l s  .e 

e    Sh/Rd  18



STATE 137 ----------------------------------------------------------------------
( 94 )

KeyWord ::= e x t e  .n d s 

n    Shift  172



STATE 138 ----------------------------------------------------------------------
( 97 )

KeyWord ::= d o u b  .l e 

l    Shift  173



STATE 139 ----------------------------------------------------------------------
( 98 )

KeyWord ::= d e f a  .u l t 

u    Shift  174



STATE 140 ----------------------------------------------------------------------
( 99 )

KeyWord ::= c o n t  .i n u e 

i    Shift  175



STATE 141 ----------------------------------------------------------------------
( 99 )

KeyWord ::= c o n s  .t 

t    Sh/Rd  10



STATE 142 ----------------------------------------------------------------------
( 100 )

KeyWord ::= c l a s  .s 

s    Sh/Rd  9



STATE 143 ----------------------------------------------------------------------
( 102 )

KeyWord ::= c a t c  .h 

h    Sh/Rd  7



STATE 144 ----------------------------------------------------------------------
( 105 )

KeyWord ::= b r e a  .k 

k    Sh/Rd  4



STATE 145 ----------------------------------------------------------------------
( 106 )

KeyWord ::= b o o l  .e a n 

e    Shift  176



STATE 146 ----------------------------------------------------------------------
( 107 )

KeyWord ::= a s s e  .r t 

r    Shift  177



STATE 147 ----------------------------------------------------------------------
( 108 )

KeyWord ::= a b s t  .r a c t 

r    Shift  178



STATE 148 ----------------------------------------------------------------------
( 109 )

KeyWord ::= DollarSign n u l l  .a c t i o n 

a    Shift  179



STATE 149 ----------------------------------------------------------------------
( 110 )

KeyWord ::= DollarSign n o a c  .t i o n 

t    Shift  180



STATE 150 ----------------------------------------------------------------------
( 111 )

KeyWord ::= DollarSign e n d j  .a v a 

a    Shift  181



STATE 151 ----------------------------------------------------------------------
( 111 )

KeyWord ::= DollarSign e n d a  .c t i o n 

c    Shift  182



STATE 152 ----------------------------------------------------------------------
( 112 )

KeyWord ::= DollarSign b a d a  .c t i o n 

c    Shift  183



STATE 153 ----------------------------------------------------------------------
( 113 )

KeyWord ::= DollarSign b e g i  .n a c t i o n 
KeyWord ::= DollarSign b e g i  .n j a v a 

n    Shift  184



STATE 154 ----------------------------------------------------------------------
( 115 )

KeyWord ::= v o l a t  .i l e 

i    Shift  185



STATE 155 ----------------------------------------------------------------------
( 116 )

KeyWord ::= t r a n s  .i e n t 

i    Shift  186



STATE 156 ----------------------------------------------------------------------
( 117 )

KeyWord ::= t h r o w . (46)
KeyWord ::= t h r o w  .s 

s      Sh/Rd  47

EOF    Reduce 46

Default reduction to rule  46


STATE 157 ----------------------------------------------------------------------
( 118 )

KeyWord ::= s y n c h  .r o n i z e d 

r    Shift  187



STATE 158 ----------------------------------------------------------------------
( 119 )

KeyWord ::= s w i t c  .h 

h    Sh/Rd  43



STATE 159 ----------------------------------------------------------------------
( 121 )

KeyWord ::= s t r i c  .t f p 

t    Shift  188



STATE 160 ----------------------------------------------------------------------
( 122 )

KeyWord ::= s t a t i  .c 

c    Sh/Rd  40



STATE 161 ----------------------------------------------------------------------
( 124 )

KeyWord ::= r e t u r  .n 

n    Sh/Rd  38



STATE 162 ----------------------------------------------------------------------
( 125 )

KeyWord ::= p u b l i  .c 

c    Sh/Rd  37



STATE 163 ----------------------------------------------------------------------
( 126 )

KeyWord ::= p r o t e  .c t e d 

c    Shift  189



STATE 164 ----------------------------------------------------------------------
( 127 )

KeyWord ::= p r i v a  .t e 

t    Shift  190



STATE 165 ----------------------------------------------------------------------
( 128 )

KeyWord ::= p a c k a  .g e 

g    Shift  191



STATE 166 ----------------------------------------------------------------------
( 129 )

KeyWord ::= n a t i v  .e 

e    Sh/Rd  31



STATE 167 ----------------------------------------------------------------------
( 130 )

KeyWord ::= i n t e r  .f a c e 

f    Shift  192



STATE 168 ----------------------------------------------------------------------
( 131 )

KeyWord ::= i n s t a  .n c e o f 

n    Shift  193



STATE 169 ----------------------------------------------------------------------
( 132 )

KeyWord ::= i m p o r  .t 

t    Sh/Rd  26



STATE 170 ----------------------------------------------------------------------
( 133 )

KeyWord ::= i m p l e  .m e n t s 

m    Shift  194



STATE 171 ----------------------------------------------------------------------
( 135 )

KeyWord ::= f i n a l . (19)
KeyWord ::= f i n a l  .l y 

l      Shift  195

EOF    Reduce 19

Default reduction to rule  19


STATE 172 ----------------------------------------------------------------------
( 137 )

KeyWord ::= e x t e n  .d s 

d    Shift  196



STATE 173 ----------------------------------------------------------------------
( 138 )

KeyWord ::= d o u b l  .e 

e    Sh/Rd  14



STATE 174 ----------------------------------------------------------------------
( 139 )

KeyWord ::= d e f a u  .l t 

l    Shift  197



STATE 175 ----------------------------------------------------------------------
( 140 )

KeyWord ::= c o n t i  .n u e 

n    Shift  198



STATE 176 ----------------------------------------------------------------------
( 145 )

KeyWord ::= b o o l e  .a n 

a    Shift  199



STATE 177 ----------------------------------------------------------------------
( 146 )

KeyWord ::= a s s e r  .t 

t    Sh/Rd  2



STATE 178 ----------------------------------------------------------------------
( 147 )

KeyWord ::= a b s t r  .a c t 

a    Shift  200



STATE 179 ----------------------------------------------------------------------
( 148 )

KeyWord ::= DollarSign n u l l a  .c t i o n 

c    Shift  201



STATE 180 ----------------------------------------------------------------------
( 149 )

KeyWord ::= DollarSign n o a c t  .i o n 

i    Shift  202



STATE 181 ----------------------------------------------------------------------
( 150 )

KeyWord ::= DollarSign e n d j a  .v a 

v    Shift  203



STATE 182 ----------------------------------------------------------------------
( 151 )

KeyWord ::= DollarSign e n d a c  .t i o n 

t    Shift  204



STATE 183 ----------------------------------------------------------------------
( 152 )

KeyWord ::= DollarSign b a d a c  .t i o n 

t    Shift  205



STATE 184 ----------------------------------------------------------------------
( 153 )

KeyWord ::= DollarSign b e g i n  .a c t i o n 
KeyWord ::= DollarSign b e g i n  .j a v a 

j    Shift  206
a    Shift  207



STATE 185 ----------------------------------------------------------------------
( 154 )

KeyWord ::= v o l a t i  .l e 

l    Shift  208



STATE 186 ----------------------------------------------------------------------
( 155 )

KeyWord ::= t r a n s i  .e n t 

e    Shift  209



STATE 187 ----------------------------------------------------------------------
( 157 )

KeyWord ::= s y n c h r  .o n i z e d 

o    Shift  210



STATE 188 ----------------------------------------------------------------------
( 159 )

KeyWord ::= s t r i c t  .f p 

f    Shift  211



STATE 189 ----------------------------------------------------------------------
( 163 )

KeyWord ::= p r o t e c  .t e d 

t    Shift  212



STATE 190 ----------------------------------------------------------------------
( 164 )

KeyWord ::= p r i v a t  .e 

e    Sh/Rd  35



STATE 191 ----------------------------------------------------------------------
( 165 )

KeyWord ::= p a c k a g  .e 

e    Sh/Rd  34



STATE 192 ----------------------------------------------------------------------
( 167 )

KeyWord ::= i n t e r f  .a c e 

a    Shift  213



STATE 193 ----------------------------------------------------------------------
( 168 )

KeyWord ::= i n s t a n  .c e o f 

c    Shift  214



STATE 194 ----------------------------------------------------------------------
( 170 )

KeyWord ::= i m p l e m  .e n t s 

e    Shift  215



STATE 195 ----------------------------------------------------------------------
( 171 )

KeyWord ::= f i n a l l  .y 

y    Sh/Rd  20



STATE 196 ----------------------------------------------------------------------
( 172 )

KeyWord ::= e x t e n d  .s 

s    Sh/Rd  17



STATE 197 ----------------------------------------------------------------------
( 174 )

KeyWord ::= d e f a u l  .t 

t    Sh/Rd  12



STATE 198 ----------------------------------------------------------------------
( 175 )

KeyWord ::= c o n t i n  .u e 

u    Shift  216



STATE 199 ----------------------------------------------------------------------
( 176 )

KeyWord ::= b o o l e a  .n 

n    Sh/Rd  3



STATE 200 ----------------------------------------------------------------------
( 178 )

KeyWord ::= a b s t r a  .c t 

c    Shift  217



STATE 201 ----------------------------------------------------------------------
( 179 )

KeyWord ::= DollarSign n u l l a c  .t i o n 

t    Shift  218



STATE 202 ----------------------------------------------------------------------
( 180 )

KeyWord ::= DollarSign n o a c t i  .o n 

o    Shift  219



STATE 203 ----------------------------------------------------------------------
( 181 )

KeyWord ::= DollarSign e n d j a v  .a 

a    Sh/Rd  57



STATE 204 ----------------------------------------------------------------------
( 182 )

KeyWord ::= DollarSign e n d a c t  .i o n 

i    Shift  220



STATE 205 ----------------------------------------------------------------------
( 183 )

KeyWord ::= DollarSign b a d a c t  .i o n 

i    Shift  221



STATE 206 ----------------------------------------------------------------------
( 184 )

KeyWord ::= DollarSign b e g i n j  .a v a 

a    Shift  222



STATE 207 ----------------------------------------------------------------------
( 184 )

KeyWord ::= DollarSign b e g i n a  .c t i o n 

c    Shift  223



STATE 208 ----------------------------------------------------------------------
( 185 )

KeyWord ::= v o l a t i l  .e 

e    Sh/Rd  52



STATE 209 ----------------------------------------------------------------------
( 186 )

KeyWord ::= t r a n s i e  .n t 

n    Shift  224



STATE 210 ----------------------------------------------------------------------
( 187 )

KeyWord ::= s y n c h r o  .n i z e d 

n    Shift  225



STATE 211 ----------------------------------------------------------------------
( 188 )

KeyWord ::= s t r i c t f  .p 

p    Sh/Rd  41



STATE 212 ----------------------------------------------------------------------
( 189 )

KeyWord ::= p r o t e c t  .e d 

e    Shift  226



STATE 213 ----------------------------------------------------------------------
( 192 )

KeyWord ::= i n t e r f a  .c e 

c    Shift  227



STATE 214 ----------------------------------------------------------------------
( 193 )

KeyWord ::= i n s t a n c  .e o f 

e    Shift  228



STATE 215 ----------------------------------------------------------------------
( 194 )

KeyWord ::= i m p l e m e  .n t s 

n    Shift  229



STATE 216 ----------------------------------------------------------------------
( 198 )

KeyWord ::= c o n t i n u  .e 

e    Sh/Rd  11



STATE 217 ----------------------------------------------------------------------
( 200 )

KeyWord ::= a b s t r a c  .t 

t    Sh/Rd  1



STATE 218 ----------------------------------------------------------------------
( 201 )

KeyWord ::= DollarSign n u l l a c t  .i o n 

i    Shift  230



STATE 219 ----------------------------------------------------------------------
( 202 )

KeyWord ::= DollarSign n o a c t i o  .n 

n    Sh/Rd  58



STATE 220 ----------------------------------------------------------------------
( 204 )

KeyWord ::= DollarSign e n d a c t i  .o n 

o    Shift  231



STATE 221 ----------------------------------------------------------------------
( 205 )

KeyWord ::= DollarSign b a d a c t i  .o n 

o    Shift  232



STATE 222 ----------------------------------------------------------------------
( 206 )

KeyWord ::= DollarSign b e g i n j a  .v a 

v    Shift  233



STATE 223 ----------------------------------------------------------------------
( 207 )

KeyWord ::= DollarSign b e g i n a c  .t i o n 

t    Shift  234



STATE 224 ----------------------------------------------------------------------
( 209 )

KeyWord ::= t r a n s i e n  .t 

t    Sh/Rd  48



STATE 225 ----------------------------------------------------------------------
( 210 )

KeyWord ::= s y n c h r o n  .i z e d 

i    Shift  235



STATE 226 ----------------------------------------------------------------------
( 212 )

KeyWord ::= p r o t e c t e  .d 

d    Sh/Rd  36



STATE 227 ----------------------------------------------------------------------
( 213 )

KeyWord ::= i n t e r f a c  .e 

e    Sh/Rd  29



STATE 228 ----------------------------------------------------------------------
( 214 )

KeyWord ::= i n s t a n c e  .o f 

o    Shift  236



STATE 229 ----------------------------------------------------------------------
( 215 )

KeyWord ::= i m p l e m e n  .t s 

t    Shift  237



STATE 230 ----------------------------------------------------------------------
( 218 )

KeyWord ::= DollarSign n u l l a c t i  .o n 

o    Shift  238



STATE 231 ----------------------------------------------------------------------
( 220 )

KeyWord ::= DollarSign e n d a c t i o  .n 

n    Sh/Rd  56



STATE 232 ----------------------------------------------------------------------
( 221 )

KeyWord ::= DollarSign b a d a c t i o  .n 

n    Sh/Rd  60



STATE 233 ----------------------------------------------------------------------
( 222 )

KeyWord ::= DollarSign b e g i n j a v  .a 

a    Sh/Rd  55



STATE 234 ----------------------------------------------------------------------
( 223 )

KeyWord ::= DollarSign b e g i n a c t  .i o n 

i    Shift  239



STATE 235 ----------------------------------------------------------------------
( 225 )

KeyWord ::= s y n c h r o n i  .z e d 

z    Shift  240



STATE 236 ----------------------------------------------------------------------
( 228 )

KeyWord ::= i n s t a n c e o  .f 

f    Sh/Rd  27



STATE 237 ----------------------------------------------------------------------
( 229 )

KeyWord ::= i m p l e m e n t  .s 

s    Sh/Rd  25



STATE 238 ----------------------------------------------------------------------
( 230 )

KeyWord ::= DollarSign n u l l a c t i o  .n 

n    Sh/Rd  59



STATE 239 ----------------------------------------------------------------------
( 234 )

KeyWord ::= DollarSign b e g i n a c t i  .o n 

o    Shift  241



STATE 240 ----------------------------------------------------------------------
( 235 )

KeyWord ::= s y n c h r o n i z  .e d 

e    Shift  242



STATE 241 ----------------------------------------------------------------------
( 239 )

KeyWord ::= DollarSign b e g i n a c t i o  .n 

n    Sh/Rd  54



STATE 242 ----------------------------------------------------------------------
( 240 )

KeyWord ::= s y n c h r o n i z e  .d 

d    Sh/Rd  44


Number of entries in base Action Table: 243
Additional space required for compaction of Action Table: 0.4%

Number of unique terminal states: 242
Number of Shift actions saved by merging: 0
Number of Conflict points saved by merging: 0
Number of Reduce actions saved by merging: 0
Number of Reduce saved by default: 4

Number of entries in Terminal Action Table: 539
Additional space required for compaction of Terminal Table: 1.4%


 The LALR Parser Generator              2.2.03 (Jul 14 2026)


Mapping of new state numbers into original numbers:

   61  ==>>      1
   63  ==>>      2
   64  ==>>      3
   65  ==>>      4
   66  ==>>      5
   67  ==>>      6
   68  ==>>      7
   69  ==>>      8
   70  ==>>      9
   71  ==>>     10
   72  ==>>     11
   73  ==>>     12
   74  ==>>     13
   75  ==>>     14
   76  ==>>     15
   77  ==>>     16
   78  ==>>     17
   79  ==>>     18
   80  ==>>     19
   81  ==>>     20
   82  ==>>     21
   83  ==>>     22
   84  ==>>     23
   85  ==>>     24
   86  ==>>     25
   87  ==>>     26
   88  ==>>     27
   89  ==>>     28
   90  ==>>     29
   91  ==>>     30
   92  ==>>     31
   93  ==>>     32
   94  ==>>     33
   95  ==>>     34
   96  ==>>     35
   97  ==>>     36
   98  ==>>     37
   99  ==>>     38
  100  ==>>     39
  101  ==>>     40
  102  ==>>     41
  103  ==>>     42
  104  ==>>     43
  105  ==>>     44
  106  ==>>     45
  107  ==>>     46
  108  ==>>     47
  109  ==>>     48
  110  ==>>     49
  111  ==>>     50
  112  ==>>     51
  113  ==>>     52
  114  ==>>     53
  115  ==>>     54
  116  ==>>     55
  117  ==>>     56
  118  ==>>     57
  119  ==>>     58
  120  ==>>     59
  121  ==>>     60
  122  ==>>     61
  123  ==>>     62
  124  ==>>     63
  125  ==>>     64
  126  ==>>     65
  127  ==>>     66
  128  ==>>     67
  129  ==>>     68
  130  ==>>     69
  131  ==>>     70
  132  ==>>     71
  133  ==>>     72
  134  ==>>     73
  135  ==>>     74
  136  ==>>     75
  137  ==>>     76
  138  ==>>     77
  139  ==>>     78
  140  ==>>     79
  141  ==>>     80
  142  ==>>     81
  143  ==>>     82
  144  ==>>     83
  145  ==>>     84
  146  ==>>     85
  147  ==>>     86
  148  ==>>     87
  149  ==>>     88
  150  ==>>     89
  151  ==>>     90
  152  ==>>     91
  153  ==>>     92
  154  ==>>     93
  155  ==>>     94
  156  ==>>     95
  157  ==>>     96
  158  ==>>     97
  159  ==>>     98
  160  ==>>     99
  161  ==>>    100
  162  ==>>    101
  163  ==>>    102
  164  ==>>    103
  165  ==>>    104
  166  ==>>    105
  167  ==>>    106
  168  ==>>    107
  169  ==>>    108
  170  ==>>    109
  171  ==>>    110
  172  ==>>    111
  173  ==>>    112
  174  ==>>    113
  175  ==>>    114
  176  ==>>    115
  177  ==>>    116
  178  ==>>    117
  179  ==>>    118
  180  ==>>    119
  181  ==>>    120
  182  ==>>    121
  183  ==>>    122
  184  ==>>    123
  185  ==>>    124
  186  ==>>    125
  187  ==>>    126
  188  ==>>    127
  189  ==>>    128
  190  ==>>    129
  191  ==>>    130
  192  ==>>    131
  193  ==>>    132
  194  ==>>    133
  195  ==>>    134
  196  ==>>    135
  197  ==>>    136
  198  ==>>    137
  199  ==>>    138
  200  ==>>    139
  201  ==>>    140
  202  ==>>    141
  203  ==>>    142
  204  ==>>    143
  205  ==>>    144
  206  ==>>    145
  207  ==>>    146
  208  ==>>    147
  209  ==>>    148
  210  ==>>    149
  211  ==>>    150
  212  ==>>    151
  213  ==>>    152
  214  ==>>    153
  215  ==>>    154
  216  ==>>    155
  217  ==>>    156
  218  ==>>    157
  219  ==>>    158
  220  ==>>    159
  221  ==>>    160
  222  ==>>    161
  223  ==>>    162
  224  ==>>    163
  225  ==>>    164
  226  ==>>    165
  227  ==>>    166
  228  ==>>    167
  229  ==>>    168
  230  ==>>    169
  231  ==>>    170
  232  ==>>    171
  233  ==>>    172
  234  ==>>    173
  235  ==>>    174
  236  ==>>    175
  237  ==>>    176
  238  ==>>    177
  239  ==>>    178
  240  ==>>    179
  241  ==>>    180
  242  ==>>    181
  243  ==>>    182
  244  ==>>    183
  245  ==>>    184
  246  ==>>    185
  247  ==>>    186
  248  ==>>    187
  249  ==>>    188
  250  ==>>    189
  251  ==>>    190
  252  ==>>    191
  253  ==>>    192
  254  ==>>    193
  255  ==>>    194
  256  ==>>    195
  257  ==>>    196
  258  ==>>    197
  259  ==>>    198
  260  ==>>    199
  261  ==>>    200
  262  ==>>    201
  263  ==>>    202
  264  ==>>    203
  265  ==>>    204
  266  ==>>    205
  267  ==>>    206
  268  ==>>    207
  269  ==>>    208
  270  ==>>    209
  271  ==>>    210
  272  ==>>    211
  273  ==>>    212
  274  ==>>    213
  275  ==>>    214
  276  ==>>    215
  277  ==>>    216
  278  ==>>    217
  279  ==>>    218
  280  ==>>    219
  281  ==>>    220
  282  ==>>    221
  283  ==>>    222
  284  ==>>    223
  285  ==>>    224
  286  ==>>    225
  287  ==>>    226
  288  ==>>    227
  289  ==>>    228
  290  ==>>    229
  291  ==>>    230
  292  ==>>    231
  293  ==>>    232
  294  ==>>    233
  295  ==>>    234
  296  ==>>    235
  297  ==>>    236
  298  ==>>    237
  299  ==>>    238
  300  ==>>    239
  301  ==>>    240
  302  ==>>    241
  303  ==>>    242

Actions in Compressed Tables:
     Number of Shifts: 240
     Number of Shift/Reduces: 56
     Number of Gotos: 1
     Number of Goto/Reduces: 0
     Number of Reduces: 1
     Number of Defaults: 4

Parsing Tables storage:
    Storage required for BASE_CHECK: 61 Bytes
    Storage required for BASE_ACTION: 612 Bytes
    Storage required for TERM_CHECK: 585 Bytes
    Storage required for TERM_ACTION: 1096 Bytes
