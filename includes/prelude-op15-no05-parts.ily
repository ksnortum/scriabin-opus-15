%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"
\language "english"

\include "global-variables.ily"

%%% Posistions and shapes %%%

slurShapeA = \shape #'(
                        ()
                        ((0.25 . 0) (0 . 0) (0 . 0) (0 . 0))
                        ) \etc
slurShapeB = \shape #'(
                        ()
                        ((0 . 0) (0 . 0.75) (0 . 0.75) (0 . -3))
                        ) \etc
slurShapeC = \shape #'((0 . 0) (3 . 2) (1 . 2) (0 . -0.25)) \etc
tieShapeA = \shape #'((0 . 0.25) (0 . 0.25) (0 . 0) (0 . 0)) \etc
tieShapeB = \shape #'((0.5 . 0.75) (0 . 1.25) (0 . 1.25) (0 . 0.5)) \etc

beamPositionsA = \once \override Beam.positions = #'(-4 . -5)
beamPositionsB = \once \override Beam.positions = #'(-4.5 . -5)

hShiftA = \once \override NoteColumn.force-hshift = 1
hShiftB = \once \override NoteColumn.force-hshift = 0.3
hShiftC = \once \override NoteColumn.force-hshift = 1
hShiftD = \once \override NoteColumn.force-hshift = 0.3

%%% Music %%%

global = {
  \time 6/8
  \key cs \minor
  \accidentalStyle piano
}

rightHandUpper = \relative {
  \set Score.tempoHideNote = ##t
  \textMark \markup \tempo-markup Andante #3 #0 160-152
  \tempo 8 = 160
  r8^\rubato ds''( css e ds fss, |
  gs fss b a gs cs, |
  \voiceOne fs4. fss4 ds'8 |
  cs4. bs) |
  \oneVoice r8 gs'-\slurShapeA ( fss a gs bs, |
  cs8 bs e d cs fs, |
  \voiceOne b4. bs4 gs'8 | 
  fs4. \oneVoice es8 d cs |
  
  \barNumberCheck 9
  e4.~ e8) ds-\slurShapeB ( e |
  c8 cs g' fs es e |
  d4.~ d8 cs d |
  as8 b f' e ds d |
  cs8 e ds e fs fss |
  gs8-_^\rubato cs-\insideSlur -_ bs-_ b-- a-- gs |
  a8 gs fss gs css, ds |
  fs e ds e ds cs |
  
  \barNumberCheck 17
  e4.~ e8) ds( e |
  c8 cs g' fs es e |
  d4.~ d8 cs d |
  as8 b f' e ds d |
  cs e ds e fs fss |
  gs8 cs^\rubato bs b a gs |
  a gs fss gs css, ds |
  fs e ds e ds cs) |
  
  \barNumberCheck 25
  r8 ds( css e ds fss, |
  gs8 fss b a gs cs,~ |
  <cs e>4. ds |
  <cs e>4. <e cs'>) |
  \bar "|."
}

rightHandLower = \relative {
  \voiceTwo
  s2. |
  s2 s8 \hideNoteHead cs'~ |
  <<
    { cs4. cs8. fss | fs4.-\tieShapeA ~ fs | }
    \new Voice { \voiceFour \hShiftA cs2. | \hShiftB ds4. s | }
  >> 
  s2. |
  s2 s8 \hideNoteHead fs~ |
  <<
    { fs4. fs8. bs | b4. }
    \new Voice { \voiceFour \hShiftC fs2. | \hShiftD gs4. }
  >> s4. |
  
  \barNumberCheck 9
  s2. * 8 |
  
  \barNumberCheck 17
  s2. * 8 |
  
  \barNumberCheck 25
  s2. * 2 |
  s4. cs,8. bs |
  s2. |
}

rightHand = {
  \global
  <<
    \new Voice \rightHandUpper
    \new Voice \rightHandLower
  >>
}

leftHandUpper = \relative {
  \voiceThree fss'4.~ fss8. ds |
  e4. cs |
  \oneVoice r8 ds,( e d ds a' |
  gs a fss gs e' ds |
  \clef treble \voiceThree bs'4.~ bs8.) gs |
  a4. fs |
  \oneVoice  r8 gs, a g gs d' |
  cs8 d bs \voiceThree b'4.~ |
  
  \barNumberCheck 9
  b8 a gs g4. |
  g8. cs cs4. |
  b4. b8. f |
  f8. b b4. |
  cs4. cs |
  cs2. |
  bs2. |
  cs4. gs |
  
  \barNumberCheck 17
  b8 a gs g4. |
  g8. cs cs4. |
  b4. b8. f |
  f8. b b4. |
  cs4. cs |
  cs2. |
  bs2. |
  cs2. |
  
  \barNumberCheck 25
  fss,4.~ fss8. ds |
  e4. s4. |
  s4. s8 gs,4~ |
  gs4. s |
}

leftHandMiddle = \relative {
  \voiceFour cs'2. | 
  cs2. |
  s2. * 2 |
  fs2. | 
  fs2. |
  s2. |
  s4. \beamPositionsA gs8 fs es |
    
  \barNumberCheck 9
  e2.-\tieShapeB ~ |
  e4. fs8. g~ |
  g4. f4. |
  d4. e8. f8. |
  e4. e8. ds |
  e2. |
  fs4.~ fs8. a |
  gs2. |
  
  \barNumberCheck 17
  e2.-\tieShapeB ~ |
  e4. fs8. g~ |
  \beamPositionsB g8 g fs f4. |
  d4. e8. f |
  e4. e8. ds |
  e2. |
  fs2. |
  fs4. fss |
  
  \barNumberCheck 25
  cs2. |
  cs4. s |
  s2. * 2 |
}

leftHandLower = \relative {
  \voiceTwo as4. a |
  gs4. e | 
  s2. * 2 |
  ds'4. d | 
  cs4. a |
  s2. |
  s4. cs4. |
  
  \barNumberCheck 9
  cs4. b |
  as2. |
  b8 g' fs a,4. |
  gs2. |
  a2. |
  gs2. |
  gs2. |
  cs2.~ |
  
  \barNumberCheck 17
  cs4. b |
  as2. |
  b4. a |
  gs2. |
  a2. |
  gs2. |
  gs2. |
  a2. |
  
  \barNumberCheck 25
  as4. a4. |
  gs4. \oneVoice r4 r8 |
  \clef bass r8 \voiceFour gs-\slurShapeC ( fss a gs gs, |
  cs8 gs cs, <cs' gs' gs'>4.) |
}

leftHand = {
  \global
  \clef bass
  <<
    \new Voice \leftHandUpper
    \new Voice \leftHandMiddle
    \new Voice \leftHandLower
  >>
}

dynamics = {
  \override DynamicTextSpanner.style = #'none
  s2.-\tweak Y-offset 1 \p |
  s2. |
  s4. s4.\< |
  s4.\> s8 s4\! |
  s2. * 2 |
  s8 s4\< s4. <>\! |
  s8 s4\> s4. |
  
  \barNumberCheck 9
  s2.\p |
  s2. * 3 |
  s2.\< |
  s2.\f\> <>\! |
  s4. s\dim |
  s2. |
  
  \barNumberCheck 17
  s2.\pp |
  s4\< s8\! s4.\> <>\! |
  s2. |
  s4\< s8\! s4.\> <>\! |
  s2.\< <>\! |
  s2.-\tweak X-offset 0 \ff |
  s4. s\cresc |
  s2. |
  
  \barNumberCheck 25
  s2.\ff |
  s8 s4\dim s4. |
  s8 s4\p s4. 
  s4. s-\tweak Y-offset 1 \pp |
}

% Not used
forceBreaks = {
  s2. * 4 s2. \break
  s2. * 4 s2. \break
  s2. * 5 s2. \break
  s2. * 5 s2. \break
}

preludeFiveNotes =
\score {
  \header {
    title = "5."
    composer = "Alexander Scriabin"
    opus = "Opus 15, No. 5"
  }
  \keepWithTag layout  
  \new PianoStaff <<
    \new Staff = "upper" \rightHand
    \new Dynamics \dynamics
    \new Staff = "lower" \leftHand
    % \new Devnull \forceBreaks % Not used
  >>
  \layout {}
}

\include "articulate.ly"

preludeFiveMidi =
\book {
  \bookOutputName "prelude-op15-no05"
  \score {
    \keepWithTag midi
    \articulate <<
      \new Staff = "upper" << \rightHand \dynamics >>
      \new Staff = "lower" << \leftHand \dynamics >>
    >>
    \midi{}
  }
}
