--
-- The Java KeyWord Lexer
--
%Options fp=JavaKWLexer,states
%options package=LpgJava
%options template=KeywordTemplateF.gi

%Include
    KWLexerFoldedCaseMapF.gi
%End

%Export
    abstract
    assert
    boolean
    break
    byte
    case
    catch
    char
    class
    const
    continue
    default
    do
    double
    enum
    else
    extends
    false
    final
    finally
    float
    for
    goto
    if
    implements
    import
    instanceof
    int
    interface
    long
    native
    new
    null
    package
    private
    protected
    public
    return
    short
    static
    strictfp
    super
    switch
    synchronized
    this
    throw
    throws
    transient
    true
    try
    void
    volatile
    while
    
    BeginAction
    BeginJava
    EndAction
    EndJava
    NoAction
    NullAction
    BadAction
%End

%Terminals
    a    b    c    d    e    f    g    h    i    j    k    l    m
    n    o    p    q    r    s    t    u    v    w    x    y    z
%End

%Start
    KeyWord
%End

%Notice
/.
////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2007 IBM Corporation.
// All rights reserved. This program and the accompanying materials
// are made available under the terms of the Eclipse Public License v1.0
// which accompanies this distribution, and is available at
// http://www.eclipse.org/legal/epl-v10.html
//
//Contributors:
//    Philippe Charles (pcharles@us.ibm.com) - initial API and implementation

////////////////////////////////////////////////////////////////////////////////
./
%End

%Rules

    -- The Goal for the parser is a single Keyword

    KeyWord ::= a b s t r a c t
        /.$BeginJava
            $setResult($_abstract)
          $EndJava
        ./

              | a s s e r t
        /.$BeginJava
            $setResult($_assert)
          $EndJava
        ./

              | b o o l e a n
        /.$BeginJava
            $setResult($_boolean)
          $EndJava
        ./

              | b r e a k
        /.$BeginJava
            $setResult($_break)
          $EndJava
        ./

              | b y t e
        /.$BeginJava
            $setResult($_byte)
          $EndJava
        ./

              | c a s e
        /.$BeginJava
            $setResult($_case)
          $EndJava
        ./

              | c a t c h
        /.$BeginJava
            $setResult($_catch)
          $EndJava
        ./

              | c h a r
        /.$BeginJava
            $setResult($_char)
          $EndJava
        ./

              | c l a s s
        /.$BeginJava
            $setResult($_class)
          $EndJava
        ./

              | c o n s t
        /.$BeginJava
            $setResult($_const)
          $EndJava
        ./

              | c o n t i n u e
        /.$BeginJava
            $setResult($_continue)
          $EndJava
        ./

              | d e f a u l t
        /.$BeginJava
            $setResult($_default)
          $EndJava
        ./

              | d o
        /.$BeginJava
            $setResult($_do)
          $EndJava
        ./

              | d o u b l e
        /.$BeginJava
            $setResult($_double)
          $EndJava
        ./

              | e l s e
        /.$BeginJava
            $setResult($_else)
          $EndJava
        ./

              | e n u m
        /.$BeginJava
            $setResult($_enum)
          $EndJava
        ./

              | e x t e n d s
        /.$BeginJava
            $setResult($_extends)
          $EndJava
        ./

              | f a l s e
        /.$BeginJava
            $setResult($_false)
          $EndJava
        ./

              | f i n a l
        /.$BeginJava
            $setResult($_final)
          $EndJava
        ./

              | f i n a l l y
        /.$BeginJava
            $setResult($_finally)
          $EndJava
        ./

              | f l o a t
        /.$BeginJava
            $setResult($_float)
          $EndJava
        ./

              | f o r
        /.$BeginJava
            $setResult($_for)
          $EndJava
        ./

              | g o t o
        /.$BeginJava
            $setResult($_goto)
          $EndJava
        ./

              | i f
        /.$BeginJava
            $setResult($_if)
          $EndJava
        ./

              | i m p l e m e n t s
        /.$BeginJava
            $setResult($_implements)
          $EndJava
        ./

              | i m p o r t
        /.$BeginJava
            $setResult($_import)
          $EndJava
        ./

              | i n s t a n c e o f
        /.$BeginJava
            $setResult($_instanceof)
          $EndJava
        ./

              | i n t
        /.$BeginJava
            $setResult($_int)
          $EndJava
        ./

              | i n t e r f a c e
        /.$BeginJava
            $setResult($_interface)
          $EndJava
        ./

              | l o n g
        /.$BeginJava
            $setResult($_long)
          $EndJava
        ./

              | n a t i v e
        /.$BeginJava
            $setResult($_native)
          $EndJava
        ./

              | n e w
        /.$BeginJava
            $setResult($_new)
          $EndJava
        ./

              | n u l l
        /.$BeginJava
            $setResult($_null)
          $EndJava
        ./

              | p a c k a g e
        /.$BeginJava
            $setResult($_package)
          $EndJava
        ./

              | p r i v a t e
        /.$BeginJava
            $setResult($_private)
          $EndJava
        ./

              | p r o t e c t e d
        /.$BeginJava
            $setResult($_protected)
          $EndJava
        ./

              | p u b l i c
        /.$BeginJava
            $setResult($_public)
          $EndJava
        ./

              | r e t u r n
        /.$BeginJava
            $setResult($_return)
          $EndJava
        ./

              | s h o r t
        /.$BeginJava
            $setResult($_short)
          $EndJava
        ./

              | s t a t i c
        /.$BeginJava
            $setResult($_static)
          $EndJava
        ./

              | s t r i c t f p
        /.$BeginJava
            $setResult($_strictfp)
          $EndJava
        ./

              | s u p e r
        /.$BeginJava
            $setResult($_super)
          $EndJava
        ./

              | s w i t c h
        /.$BeginJava
            $setResult($_switch)
          $EndJava
        ./

              | s y n c h r o n i z e d
        /.$BeginJava
            $setResult($_synchronized)
          $EndJava
        ./

              | t h i s
        /.$BeginJava
            $setResult($_this)
          $EndJava
        ./

              | t h r o w
        /.$BeginJava
            $setResult($_throw)
          $EndJava
        ./

              | t h r o w s
        /.$BeginJava
            $setResult($_throws)
          $EndJava
        ./

              | t r a n s i e n t
        /.$BeginJava
            $setResult($_transient)
          $EndJava
        ./

              | t r u e
        /.$BeginJava
            $setResult($_true)
          $EndJava
        ./

              | t r y
        /.$BeginJava
            $setResult($_try)
          $EndJava
        ./

              | v o i d
        /.$BeginJava
            $setResult($_void)
          $EndJava
        ./

              | v o l a t i l e
        /.$BeginJava
            $setResult($_volatile)
          $EndJava
        ./

              | w h i l e
        /.$BeginJava
            $setResult($_while)
          $EndJava
        ./

    KeyWord ::= '$' b e g i n a c t i o n
        /.$BeginJava
            $setResult($_BeginAction)
          $EndJava
        ./
              | '$' b e g i n j a v a
        /.$BeginJava
            $setResult($_BeginJava)
          $EndJava
        ./

    KeyWord ::= '$' e n d a c t i o n
        /.$BeginJava
            $setResult($_EndAction)
          $EndJava
        ./
              | '$' e n d j a v a
        /.$BeginJava
            $setResult($_EndJava)
          $EndJava
        ./

    KeyWord ::= '$' n o a c t i o n
        /.$BeginJava
            $setResult($_NoAction)
          $EndJava
        ./
    KeyWord ::= '$' n u l l a c t i o n
        /.$BeginJava
            $setResult($_NullAction)
          $EndJava
        ./
    KeyWord ::= '$' b a d a c t i o n
        /.$BeginJava
            $setResult($_BadAction)
          $EndJava
        ./
%End