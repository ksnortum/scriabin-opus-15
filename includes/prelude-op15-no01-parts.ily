%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"
\language "english"

\include "global-variables.ily"

%%% Posistions and shapes %%%

moveTupletNumberA = \once \override TupletNumber.Y-offset = 5.25
forceHShiftA = \once \override NoteColumn.force-hshift = 1.75

slurShapeA = \shape #'(
                        ()
                        ((0 . 0) (0 . 0) (0 . 0) (0 . 0.5))
                        ) \etc

%%% Music %%%

global = {
  \time 3/4
  \key a \major
  \accidentalStyle piano
  % Group eight-notes in twos
  \set Timing.beamExceptions = #'()
  \set Timing.baseMoment = #(ly:make-moment 1/4)
  \set Timing.beatStructure = 1,1,1
}

rightHandUpper = \relative {
  \voiceOne
  \partial 4 \moveTupletNumberA 
    \tuplet 5/4 { cs''16-.(^\rubato d-. cs-. b-. cs-. }
  \tuplet 3/2 { e8 fs, a } gs4) \omit TupletNumber \omit TupletBracket
    \tuplet 5/4 { cs16( a b cs fs } |
  \tuplet 3/2 { e8 fs, a } gs4) \tuplet 5/4 { b16( cs b as b } |
  \tuplet 3/2 { a'8 b,8. d16  d8 cs fs  e cs a } |
  \tuplet 3/2 { d8 cs d } b4) \tuplet 5/4 { cs16( d cs b cs } |
  \tuplet 3/2 { e8 fs, a } gs4) \tuplet 5/4 { cs16([ a b cs r32 b'] } |
  \tuplet 3/2 { b8 b, d } cs4) \tuplet 5/4 { fs16( gs fs es fs } |
  \tuplet 3/2 { a8 bs,8. d16  d8 cs fs  e d b } |
  \tuplet 3/2 { a8 gs a } fs4) \tuplet 5/4 { a16( b a gs a } |
  
  \barNumberCheck 9
  \tuplet 3/2 { cs8 ds, fs } es4) <fs a> |
  \oneVoice <a, e' g a>2 \tuplet 5/4 { fs'16( g fs e fs } |
  \tuplet 3/2 { a8 b, d } cs4) <fs, d' fs>4 |
  <fs cs' fs>4~ <fs bs ds fs> \voiceOne \tuplet 5/4 { gs'16( a gs fss gs } |
  \tuplet 3/2 { 
    \oneVoice d'8 fss, a  gs cs gs  bs gs d |
    b'8 d, fs  e a d,  gs d fs |
    es8 cs gs  d' gs, cs  es gs cs |
    cs8 gs cs  cs a cs)
  } \voiceOne \tuplet 5/4 { cs16( d cs b cs } |
  
  \barNumberCheck 17
  \tuplet 3/2 { e8 fs, a } gs4) \tuplet 5/4 { cs16( a b cs fs } |
  \tuplet 3/2 { e8 fs, a } gs4) \tuplet 5/4 { b16( cs b as b } |
  \tuplet 3/2 { a'8 b, d  d cs fs) } \tuplet 5/4 { e16( fs e ds e } |
  \tuplet 3/2 { d'8 e,8. g16  g8 fs b) } \oneVoice <d,, b' d>4 |
  <d as' d>2 \voiceOne \tuplet 5/4 { d'16( e d cs d } |
  \tuplet 3/2 { a'8^\rit cs, e } d4) \oneVoice <d, gs c d>4~^\aTempo |
  \time 2/4 
  q4 \voiceOne \tuplet 5/4 { d'16( e d cs d } |
  \tuplet 3/2 { gs8 cs, e } \oneVoice <d, d'> <cs cs'>~ |
  \time 3/4
  q4) \voiceOne \tuplet 5/4 { cs'16( d cs bs cs } \tuplet 3/2 { gs'8 bs, d } |
  \time 2/4
  cs4)^\rubatoEAccel \tuplet 5/4 { cs16( bs cs d cs } |
  cs4) \tuplet 5/4 { cs16( bs cs d cs } |
  b4) \tuplet 5/4 { b16( as b cs b } |
  \time 3/4
  \tuplet 5/4 { a^\rit gs a b a } a'4) \tuplet 5/4 { cs,16( d cs b cs } |
  \tuplet 3/2 { e8 fs,8. a16 } gs4 \tuplet 3/2 { cs8 b8. cs16 } |
  <cs, a' e'>2) 
  \bar "|."
}

rightHandLower = \relative {
  \voiceTwo
  \omit TupletNumber
  \omit TupletBracket
  \partial 4 e'4~
  e4. d8 cs4 |
  d2 fs4 |
  fs2 \tuplet 3/2 { gs4 a8 } |
  a4~ \tuplet 3/2 { a8 gs fs } e4~ |
  e4. d8 cs g' |
  g4 g fs |
  fs2 fs4 |
  es4 \tuplet 3/2 { fs8 e d } cs4 |
  
  \barNumberCheck 9
  cs2 a4 |
  s2. * 2 |
  s2 <fs bs ds>4 |
  s2. * 3 |
  s2 e'4~ |
  
  \barNumberCheck 17
  e4. d8 cs4 |
  d2 fs4 |
  fs2 b4 |
  b2 s4 |
  s2 <d, b'>4 |
  <d c'>2 s4 |
  % 2/4
  s4 <d gs c> |
  % here we use fingering markup for the left-hand indicator
  \fingerLeft
  <d\finger\lhMark b'>4 <gs b>~ |
  
  \barNumberCheck 25
  % 3/4
  \forceHShiftA q4 <cs, gs' b>4 <cs\finger\lhMark b'> |
  % 2/4
  <cs g' b>4 g' |
  g4 g |
  fs4 fs |
  % 3/4
  fs8 f r4 e~ |
  e4. d8~ <d gs>4 |
  s2
}

rightHand = {
  \global
  <<
    \new Voice \rightHandUpper
    \new Voice \rightHandLower
  >>
}

leftHand = \relative {
  \global
  \clef bass
  \omit TupletNumber
  \partial 4 e'4_\legato
  d8 cs b fs e a, |
  e8 b' fs' e \tuplet 3/2 { d gs fs' } |
  cs,8 b' fs' a, fs cs' |
  b4 e e |
  d8 cs b fs e a, |
  d,8 a' b' a a d, |
  cs8 a' fs' a, b gs |
  cs4 fs r |
  
  \barNumberCheck 9
  b,8 a gs cs, \tuplet 5/4 { cs16( d cs bs cs } |
  \tuplet 3/2 { a'8 b, d } cs8) a a'4 |
  g8 fs e a, \tuplet 5/4 { a16 b a gs a } |
  \tuplet 3/2 { fs'8 gs, b } a gs gs4 |
  cs,8 gs' es' b es es' |
  cs,,8 fs fs' a, d a' |
  cs,, gs' es' gs, cs gs' |
  es'2 e4 |
  
  \barNumberCheck 17
  d8 cs b fs e a, |
  e8 b' fs' e \tuplet 3/2 { d gs fs' } |
  cs,8 b' fs' a, \tuplet 3/2 { g cs b' } |
  fs,8 e' b' d, \tuplet 5/4 { fs,16( g fs es fs } |
  \tuplet 3/2 { d'8 es,-- g-- } fs2--~ |
  fs2) \tuplet 5/4 { fs16( gs fs es fs } |
  % 2/4
  \tuplet 3/2 { d'8 es, gs } fs4~ |
  fs4) \tuplet 5/4 { es16-\slurShapeA ( fs es e es } |
  
  \barNumberCheck 25
  % 3/4
  \tuplet 3/2 { cs'8 ds, fs } es4~ es) |
  % 2/4
  \tuplet 5/4 { es16( fss es e es~ } <es cs'>4) |
  \tuplet 5/4 { e16( fs e ds e~ } <e as>4) |
  \tuplet 5/4 { d16( e d cs d~ } <d b'>4) |
  % 3/4
  << { bs'4 f' e } \\ { ds,2 e8 r } >> |
  % brackets are necessary because time changes have cancelled beat structure
  d'8[ cs] b[ fs] e e, |
  <a, a'>8 e'' <cs' a'>4
}

dynamics = {
  \override DynamicTextSpanner.style = #'none
  \partial 4 s4\< 
  \tuplet 3/2 { s4\> s8\! } s2 |
  s2 \tuplet 3/2 { s8 s4\cresc } |
  s2. |
  s4\> s\! s\< |
  \tuplet 3/2 { s4\> s8\! } s4. s8\cresc |
  s2 s8 s\dim |
  s2.\p |
  s2. |
  
  \barNumberCheck 9
  \tuplet 3/2 { s8\> s4\! } s4 s\> |
  s2.\pp |
  s2 s8 s\cresc |
  s2. |
  s2.\mf |
  s4 s2\cresc |
  s2.\f |
  s2\> s4\pp |
  
  \barNumberCheck 17
  s4 s2\cresc |
  s2. |
  s2 s4\dim |
  s4 s\> s4\p\< <>\! |
  s2 s4\> |
  s2.\p |
  % 2/4
  s4 s\cresc |
  s2^\ms |
  
  \barNumberCheck 25
  % 3/4
  s2 s4^\ms |
  % 2/4
  s4\f \tuplet 5/4 { s16 s4\dim } |
  s2 * 2 |
  % 3/4
  \tuplet 5/4 { s8 s8.\dim } s4 s\pp |
  s2. |
  s2
}

% MIDI only
pedal = {
  \partial 4 s4\sd
  s4\su\sd s\su\sd s\su\sd |
  s2\su\sd s4\su\sd |
  s2\su\sd s4\su\sd |
  s4\su\sd s\su\sd s\su\sd |
  s4\su\sd s\su\sd s\su\sd |
  s2\su\sd s4\su\sd |
  s2\su\sd s4\su\sd |
  s4\su\sd s\su\sd s\su\sd |
  
  \barNumberCheck 9
  s4\su\sd s\su\sd s\su |
  s4\sd s\su\sd s\su\sd |
  s4\su\sd s\su\sd s\su |
  s4\sd s\su\sd s\su\sd |
  s2.\su\sd |
  s2.\su\sd |
  s2.\su\sd |
  s4 s\su\sd s\su\sd |
  
  \barNumberCheck 17
  s4\su\sd s\su\sd s\su\sd |
  s2\su\sd s4\su\sd |
  s2\su\sd s4\su\sd |
  s2\su\sd s4\su |
  s2. * 2 |
  s2 * 2 |
  
  \barNumberCheck 25
  s2. |
  s2 * 3 |
  s2 s4\sd |
  s4\su\sd s\su\sd s\su\sd |
  s2.\su\sd <>\su |
}

% Not used
forceBreaks = {
  \partial 4 s4
  s2. * 2 s2. \break
  s2. * 2 s2. \break
  s2. * 2 s2. \break
  s2. * 2 s2. \break
  s2. * 2 s2. \pageBreak
  
  s2. * 2 s2. \break
  s2. * 2 s2. \break
  s2. s2 * 2 \break
  s2. s2 * 2 \break
}

tempi = {
  \set Score.tempoHideNote = ##t
  \textMark \markup \tempo-markup Andante #2 #0 72
  \partial 4 \tempo 4 = 66 s4
  \tempo 4 = 72 s2 \tempo 4 = 66 s4 |
  \tempo 4 = 72 s2 \tempo 4 = 66 s4 |
  \tempo 4 = 72 s2. |
  s2 \tempo 4 = 66 s4 |
  \tempo 4 = 72 s2 \tempo 4 = 60 s4 |
  \tempo 4 = 72 s2 \tempo 4 = 66 s4 |
  \tempo 4 = 72 s2. |
  s2 \tempo 4 = 66 s4 |
  
  \barNumberCheck 9
  \tempo 4 = 72 s2 \tempo 4 = 66 s4 |
  \tempo 4 = 72 s2 \tempo 4 = 66 s4 |
  \tempo 4 = 72 s2 \tempo 4 = 66 s4 |
  \tempo 4 = 72 s2 \tempo 4 = 66 s4 |
  \tempo 4 = 72 s2. * 3 |
  \tempo 4 = 72 s2 \tempo 4 = 66 s4 |
  
  \barNumberCheck 17
  \tempo 4 = 72 s2 \tempo 4 = 66 s4 |
  \tempo 4 = 72 s2 \tempo 4 = 66 s4 |
  \tempo 4 = 72 s2 \tempo 4 = 66 s4 |
  \tempo 4 = 72 s2 \tempo 4 = 66 s4 |
  \tempo 4 = 72 s2 \tempo 4 = 66 s4 |
  \tempo 4 = 60 s2 \tempo 4 = 66 s4 |
  \tempo 4 = 72 s2 * 2 |
  
  \barNumberCheck 25
  s2. |
  \tempo 4 = 80 s2 |
  \tempo 4 = 84 s2 |
  \tempo 4 = 88 s2 |
  \tempo 4 = 66 s4 \tempo 4 = 56 s \tempo 4 = 66 s |
  \tempo 4 = 72 s2 \tempo 4 = 66 s4 |
  \tempo 4 = 56 s2
}

preludeOneNotes =
\score {
  \header {
    title = "1."
    composer = "Alexander Scriabin"
    opus = "Opus 15, No. 1"
  }
  \keepWithTag layout  
  \new PianoStaff <<
    \new Staff = "upper" \rightHand
    \new Dynamics \dynamics
    \new Staff = "lower" \leftHand
    % \new Devnull \forceBreaks % not used
    \new Devnull \tempi
  >>
  \layout {}
}

\include "articulate.ly"

preludeOneMidi =
\book {
  \bookOutputName "prelude-op11-no01"
  \score {
    \keepWithTag midi
    \articulate <<
      \new Staff = "upper" << \rightHand \dynamics \pedal \tempi >>
      \new Staff = "lower" << \leftHand \dynamics \pedal \tempi >>
    >>
    \midi {}
  }
}
