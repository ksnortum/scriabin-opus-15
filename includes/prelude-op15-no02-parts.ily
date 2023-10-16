%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"
\language "english"

\include "global-variables.ily"

%%% Posistions and shapes %%%

slurShapeA = \shape #'(
                        ()
                        ()
                        ((0.5 . 0) (0 . 0) (0 . 0) (0 . 0))
                        ) \etc
slurShapeB = \shape #'(
                        ()
                        ((0.5 . 0) (0 . 0) (0 . 0) (0 . 0))
                        ((0.5 . 0) (0 . 0) (0 . 0) (0 . 0))
                        ((0.5 . 0) (0 . 0) (0 . 0) (0 . 0))
                        ) \etc
slurShapeC = \shape #'(
                         ()
                         ((0.5 . 0) (0 . 0) (0 . 0) (0 . 0))
                         ) \etc
slurShapeD = \shape #'(
                        ()
                        ((0.5 . 0) (0 . 0) (0 . 0) (0 . 0))
                        ((0.5 . 0) (0 . 0) (0 . 0) (0 . 0))
                        ) \etc

%%% Music %%%

global = {
  \time 3/4
  \key fs \minor
  \accidentalStyle piano
}

rightHand = \relative {
  \global
  e''16-\slurShapeA ( es fs a  gs b, bs cs  e d cs b |
  a16 b cs d  fs cs ds es  fs gs b a |
  e16 es fs a  gs b, bs cs  e d cs b |
  a16 b cs d  fs cs ds es  fs gs b a |
  e16 es fs a  gs b, cs d  fs fs, e' d |
  bs16 cs d fs  e fs, gs a  d a cs bs |
  b16 cs d a'  gs d fs cs  e b d a |
  cs16 fss, gs d' cs4) r |
  
  \barNumberCheck 9
  e16-\slurShapeB ( es fs a  gs b, bs cs  e d cs b |
  a16 b cs d  fs cs ds es  fs gs b a |
  e16 es fs a  gs b, bs cs  e d cs b |
  a16 b cs d  fs cs ds es  fs gs b a |
  b,16 bs cs e  ds fs, gs a  cs cs, b' a |
  fss gs a cs  b cs, ds e  a e gs fss |
  fs16 gs a e'  ds a cs gs  b fs a e |
  gs16 css, ds a' gs4 cs,) |
  
  \barNumberCheck 17
  b16( e g fs  e fs g fs-1  b-\insideSlur -3 g cs g |
  cs16-- as d-- g,  cs-- as d-- fs,  b4) |
  a,16-\slurShapeC ( d fs e  d e fs e  a fs b b, |
  a'16 fs b b,  a' fs b es,  cs'8.) b16(\noBeam |
  a'16 fs b b,  a' fs b es, cs'4) |
  e,16-\slurShapeD ( es fs a  gs b, bs cs  e d cs b |
  a16 b cs d  fs cs ds es  fs gs b a |
  e16 es fs a  gs b, bs cs  e d cs b |
  
  \barNumberCheck 25
  a16 b cs d  fs cs ds es  fs gs b a |
  e16 es fs a  gs b, cs d  fs fs, e' d |
  bs16 cs d fs  e fs, gs a  d a cs bs |
  b16 cs d a'  gs d fs cs  e d b fs |
  b,16 cs d a'  gs d fs cs  e b d a |
  cs16 fs, g d' cs4) <fs, b> |
  a16( es fs b  a4) <d, fs> |
  a''16( es fs b  a4-.) <d, fs>-. |
  
  \barNumberCheck 33
  a'16( es fs b  a4) <d, fs> |
  a'16( es fs b  a4) <b, cs es gs> |
  <a cs fs>4 r r |
  \bar "|."
}

leftHand = \relative {
  \global
  \clef bass
  cs''8( cs, b es gs, cs,) |
  fs'8( a, cs, cs'' fs, a,) |
  cs'8( cs, b es gs, cs,) |
  fs'8( a, cs, cs'' fs, a,) |
  b'8( fs gs, fs' gs, b,) |
  a''8( fs a, fs' a, cs,) |
  fs'8( gs, cs, gs' fs' b,) |
  es8( b cs, b' es cs') |
  
  \barNumberCheck 9
  cs8( cs, b es gs, cs,) |
  fs'8( a, cs, cs'' fs, a,) |
  cs'8( cs, b es gs, cs,) |
  fs'8( a, cs, cs'' fs, a,) |
  fs'8( cs ds, cs' ds, fs,) |
  e''8( cs e, cs' e, gs,) |
  cs'8( ds, gs, ds' cs' fs,) |
  bs8( fs gs, e' gs, cs,) |
  
  \barNumberCheck 17
  g''8( g, cs,) e''( g, cs,) |
  e'8( fs, fs,) d''( fs, b,) |
  fs'8( fs, b,) d''( fs, b,) |
  fs'8( gs, d) es'( gs, cs,) |
  fs''8( gs, d) es'( gs, cs,) |
  cs''8( cs, b es gs, cs,) |
  fs'8( a, cs, cs'' fs, a,) |
  cs'8( cs, b es gs, cs,) |
  
  \barNumberCheck 25
  fs'8( a, cs, cs'' fs, a,) |
  b'8( fs gs, fs' gs, b,) |
  a''8( fs a, fs' a, cs,) |
  fs'8( gs, cs, fs' gs, cs,) |
  fs8( gs, cs, fs' gs, cs,) |
  e'8( as, cs, d' b cs,) |
  cs'8( fs, cs) bs'( fs cs) |
  cs''8( fs, cs) bs'( fs cs) |
  
  \barNumberCheck 33
  cs'8([ fs, cs) bs'( fs cs16)] r\fermata |
  <<
    { cs'8. d16 cs4 cs,, | fs4 fs, }
    \\
    { <cs'' fs>4~ cs2~ | cs2 }
  >> r4 |
}

dynamics = {
  \override DynamicTextSpanner.style = #'none
  s2.\p |
  s4 s16 s8.\< s8 s16\> s\! |
  s2. |
  s4 s16 s8.\< s8 s16\> s\! |
  s4 s2\cresc |
  s2. |
  s4 s2\dim |
  s4\> s2\! |
  
  \barNumberCheck 9
  s2.\p |
  s4 s16 s8.\< s8 s16\> s\! |
  s2. |
  s4 s16 s8.\< s8 s16\> s\! |
  s4 s2\cresc |
  s2. |
  s16 s8.\dim s2 |
  s2. |
  
  \barNumberCheck 17
  s2.\mf |
  s2. |
  s2.-\tweak X-offset 0 \mp |
  s2 s4\dim |
  s2. |
  s2.\pp |
  s4 s16 s8.\< s8 s16\> s\! |
  s2. |
  
  \barNumberCheck 25
  s4 s16 s8.\< s8 s16\> s\! |
  s8 s\cresc s2 |
  s2. |
  s2.\mf |
  s2. * 2 |
  s2.\dim |
  s2.\dim |
  
  \barNumberCheck 33
  s2.\! |
  s2. * 2 |
}

% MIDI only
pedal = {
  s4.\sd s\su\sd |
  s4.\su\sd s \su\sd |
  s4.\su\sd s \su\sd |
  s4.\su\sd s \su\sd |
  s4.\su\sd s \su\sd |
  s4.\su\sd s \su\sd |
  s4.\su\sd s \su\sd |
  s4\su\sd s2\su\sd |
  
  \barNumberCheck 9
  s4.\su\sd s\su\sd |
  s4.\su\sd s \su\sd |
  s4.\su\sd s \su\sd |
  s4.\su\sd s \su\sd |
  s4.\su\sd s \su\sd |
  s4.\su\sd s \su\sd |
  s4.\su\sd s \su\sd |
  s4\su\sd s\su\sd s\su\sd |
  
  \barNumberCheck 17
  s4.\su\sd s\su\sd |
  s4.\su\sd s \su\sd |
  s4.\su\sd s \su\sd |
  s4.\su\sd s \su\sd |
  s4.\su\sd s \su\sd |
  s4.\su\sd s \su\sd |
  s4.\su\sd s \su\sd |
  s4.\su\sd s \su\sd |
  
  \barNumberCheck 25
  s4.\su\sd s \su\sd |
  s4.\su\sd s \su\sd |
  s4.\su\sd s \su\sd |
  s4.\su\sd s \su\sd |
  s4.\su\sd s \su\sd |
  s4\su\sd s\su\sd s\su\sd |
  s4\su\sd s\su\sd s\su\sd |
  s4\su\sd s\su\sd s\su\sd |
  
  \barNumberCheck 33
  s4\su\sd s\su\sd s8.\su\sd s16\su |
  s4\sd s\su\sd s\su\sd |
  s2\su\sd s4\su |
}

tempi = {
  \set Score.tempoHideNote = ##t
  \textMark \markup \tempo-markup Vivo #2 #0 138
  \tempo 4 = 138
  s2. * 8 |
  
  \barNumberCheck 9
  s2. * 8 |
  
  \barNumberCheck 17
  s2. * 5 |
  \textMark \markup \tempo-markup "" #2 #0 152
  \tempo 4 = 152
  s2. * 3 |
  
  \barNumberCheck 25
  s2. * 8 |
  
  \barNumberCheck 33
  s2 s8. \tempo 4 = 30 s16 |
  \tempo 4 = 152 
  s2. * 2 |  
}

% Not used
forceBreaks = {
  s2. * 2 s2. \break
  s2. * 2 s2. \break
  s2. * 2 s2. \break
  s2. * 2 s2. \break
  s2. * 2 s2. \pageBreak
  
  s2. * 3 s2. \break
  s2. * 3 s2. \break
  s2. * 2 s2. \break
  s2. * 3 s2. \break
}

preludeTwoNotes =
\score {
  \header {
    title = "2."
    composer = "Alexander Scriabin"
    opus = "Opus 15, No. 2"
  }
  \keepWithTag layout  
  \new PianoStaff <<
    \new Staff = "upper" \rightHand
    \new Dynamics \dynamics
    \new Staff = "lower" \leftHand
    \new Devnull \tempi
    % \new Devnull \forceBreaks % Not used
  >>
  \layout {}
}

\include "articulate.ly"

preludeTwoMidi =
\book {
  \bookOutputName "prelude-op11-no02"
  \score {
    \keepWithTag midi
    \articulate <<
      \new Staff = "upper" << \rightHand \dynamics \pedal \tempi >>
      \new Staff = "lower" << \leftHand \dynamics \pedal \tempi >>
    >>
    \midi {}
  }
}
