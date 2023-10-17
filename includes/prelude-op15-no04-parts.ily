%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"
\language "english"

\include "global-variables.ily"

%%% Posistions and shapes %%%

slurShapeA = \shape #'((0 . -2) (0 . 0) (0 . 0) (0 . 0)) \etc
slurShapeB = \shape #'((0 . -2) (0 . 0) (0 . 0) (0 . 0)) \etc
slurShapeC = \shape #'((0 . 0) (0 . -1) (0 . -1) (0 . 0)) \etc
slurShapeD = \shape #'((-0.5 . 1.5) (0 . 1.5) (0 . 0.5) (0 . 0)) \etc
slurShapeE = \shape #'((0 . -2) (0 . 0) (0 . 0) (0 . 0)) \etc
slurShapeF = \shape #'((-0.5 . 2.5) (0 . 1.5) (0 . 0) (0 . 0)) \etc

%%% Music %%%

global = {
  \time 3/4
  \key e \major
  \accidentalStyle piano
  % Group eight-notes in twos
  \set Timing.beamExceptions = #'()
  \set Timing.baseMoment = #(ly:make-moment 1/4)
  \set Timing.beatStructure = 1,1,1
}

rightHand = \relative {
  \global
  \override Beam.auto-knee-gap = ##f
  \partial 8 r8
  r8 b'( cs gs' fs cs |
  b'8 cs, ds e b) b[( |
  e8]) a,[( cs]) fs,[-\slurShapeA ( e'']) a,,[( |
  e'8]) gs,[( b]) e,[-\slurShapeB ( e'']) r |
  r8 b,( cs gs' fs cs |
  b'8 cs, ds e b) b[( |
  ds8]) gs,[( cs]) e,[( fs']) ds,-\slurShapeD ( |
  cs8[ b cs ds] b') r |
  
  \barNumberCheck 9
  r8 b-\slurShapeE ( cs[ d fs cs'] |
  << 
    { \voiceOne b8[ fs g gs d cs]) } 
    \new Voice { \voiceTwo r8 b~ <b es>4 <es, gs> } 
  >> |
  \oneVoice r8 fs-\slurShapeF ( gs[ a cs gs'] |
  <<
    { \voiceOne fs8[ cs d ds a gs] }
    \new Voice { \voiceTwo r8 fs~ <fs bs>4 <bs, ds>8~ <bs fs'> }
  >> |
  \oneVoice <b fs' gs>8) gs'(\noBeam cs[ b d gs,] |
  d'8[ cs bs b a gs]) |
  r8 fs( b[ a c gs] |
  cs[ fs, ds' ds, fs' b,]) |
  
  \barNumberCheck 17
  r8 b( cs gs' fs cs |
  b'8 cs, ds e b) b[( |
  e8]) a,[( cs]) fs,[-\slurShapeA ( e'']) a,,[( |
  e'8]) gs,[( b]) e,[-\slurShapeB ( e'']) r |
  r8 e,(^\dolciss fs cs' b fs |
  e'8 fs, gs a e) e[( |
  gs8]) cs,[( fs]) a,[( b']) gs,( |
  fs8[ e gs as] gs')\fermata e[( |
  
  \barNumberCheck 25
  gs8]) cs,[( fs]) a,[( b']) gs,( |
  fs[ e^\rit fs gs] e'4) |
  \bar "|."
}

leftHand = \relative {
  \global
  \clef bass
  \partial 8 b,8[(\pp 
  e,8]) << { <e'' fs>4 } \\ { b8[( a]) } >> b,[( <a' e' fs>]) b,[( |
  % second eight note, upper note s/b gs?  see measures 6, 18
  e,8]) << { <gs' e'>4 } \\ { cs8[( b]) } >> b,[( <gs' e' gs>]) b,[( |
  e,8]) <cs'' e>[( fs,]) a[( b,]) b[( |
  e,8]) <b'' e>[( e,]) gs[( b,]) b[( |
  e,8]) << { <e'' fs>4 } \\ { b8[(\pp a]) } >> b,[( <a' e' fs>]) b,[( |
  e,8]) << { <gs' gs'>4 } \\ { cs8[( b]) } >> cs,[( <b' e gs>]) e,[( |
  fs,8]) <b' cs>[( e,]) gs[( fs,]) fs'-\slurShapeC ( |
  e8[ ds fs fs,] b,) fs''[( |
  
  \barNumberCheck 9
  b,8]) <d' fs>[( gs,]) r r cs,[( |
  gs'8]) d'4 cs8[ b] cs,[( |
  fs,8]) <a' cs>[( ds,]) r r gs,[( |
  ds'8]) a'4 gs8[ fs] ds[ |
  d8] <b' fs'>[( gs]) r r <b es>[( |
  cs,8]) r r4 r8 cs[ |
  c8] <a' e'>[( fs]) r r <a ds>[( |
  b,8]) r r4 r8 b[(\pp |
  
  \barNumberCheck 17
  % no "a" in fifth eight note chord, error? see measures 1, 5
  e,8]) << { <e'' fs>4 } \\ { b8[( a]) } >> b,[( <e' fs>]) b,[( |
  e,8]) << { <gs' gs'>4 } \\ { cs8[( b]) } >> b,[( <gs' e' gs>]) b,[( |
  e,8]) <cs'' e>[( fs,]) a[( b,]) b[( |
  e,8]) <b'' e>[( e,]) gs[( b,]) b[( |
  e,8]) \clef treble << { <b'' a'>4 } \\ { e8[( d]) } >> e,[( <b' d a'>])
    \clef bass e,[( |
  a,8]) \clef treble << { <cs' cs'>4 } \\ { fs8[( e]) } >> fs,[( <e' a cs>])
    \clef bass fs,[( |
  b,8]) <e' fs>[( a,]) cs[( b,]) b'( |
  a[ gs cs, fs,] <cs' as' e'>)\fermata fs,[( |
  
  \barNumberCheck 25
  <b, b'>8]) <e'' fs>[( a,]) cs[( b,]) b'( |
  a[ gs b b,] e,4) |
}

dynamics = {
  \override DynamicTextSpanner.style = #'none
  \override TextScript.Y-offset = -0.5
  \partial 8 s8
  s8 s-\tweak X-offset -1 \mf s2 |
  s2 s8 s\pp |
  s2. * 2 |
  s8 s-\tweak X-offset -1 \mf s2 |
  s2\cresc s8 s\pp |
  s2 s8 s\> |
  s2 s4\! |
  
  \barNumberCheck 9
  s8 s\mf\< s2 |
  s2.\> <>\! |
  s8 s\< s2 <>\! |
  s8 s\> s4 s8\! s^\crescWhiteout |
  s8 s\< s\> s\< s s <>\! |
  s8 s\> s2 <>\! |
  s8 s\dim s2 |
  s2.\p |
  
  \barNumberCheck 17
  s8 s-\tweak X-offset -1 \mf s2 |
  s2 s8 s\pp |
  s2. * 5 |
  s4.\> s\! |
  
  \barNumberCheck 25
  s2. |
  s2 s4-\tweak Y-offset -2 \ppp |
}

pedal = {
  \partial 8 s8
  \tag layout {
    s2. |
    s2 s8 s\sd |
    s2. |
    s8\su s\sd s2 |
    s2. |
    s2 s8 s\sd |
    s4 s\su s\sd |
    s2. |
  }
  \tag midi { 
    s2.\sd  |
    s2\su\sd s8 s\su\sd |
    s2. |
    s4\su\sd s4. s8\su |
    s2.\sd |
    s4\su\sd s8 s\su\sd s s\su\sd |
    s2 s8 s\su\sd |
    s8 s\su\sd s4 s8 s\su\sd |
  }
  
  \barNumberCheck 9
  \tag midi {
    s4\sd s\su s8 s\sd |
    s4. s8\su\sd s s\su |
    s4\sd s\su s8 s\sd |
    s4. s8\su\sd s s\su |
    s4\sd s4\su s8 s\sd |
    s8 s\su s2 |
    s4\sd s4\su s8 s\sd |
    s8 s\su s2 |
  
    \barNumberCheck 17
    s2.\sd  |
    s2\su\sd s8 s\su\sd |
    s2. |
    s4\su\sd s4. s8\su |
    s2.\sd |
    s4\su\sd s8 s\su\sd s s\su\sd |
    s2 s8 s\su\sd |
    s8 s\su\sd s4. s8\su\sd |
    
    \barNumberCheck 25
    s2 s8 s\su\sd |
    s8 s\su\sd s2 <>\su |
  }
}

tempi = {
  \set Score.tempoHideNote = ##t
  \textMark \markup \tempo-markup Andantino #2 #0 58-60
  \tempo 4 = 60
  \partial 8 s8
  s2. * 8 |
  
  \barNumberCheck 9
  s2. * 8 |
  
  \barNumberCheck 17
  s2. * 7 |
  s2 \tempo 4 = 20 s8 \tempo 4 = 60 s |
  
  \barNumberCheck 25
  s2.
  s8 \tempo 4 = 56 s s \tempo 4 = 52 s \tempo 4 = 30 s4 |
}

% Not used
forceBreaks = {
  \partial 8 s8
  s2. * 4 s2. \break
  s2. * 5 s2. \break
  s2. * 4 s2. \break
  s2. * 4 s2. \break
}

preludeFourNotes =
\score {
  \header {
    title = "4."
    composer = "Alexander Scriabin"
    opus = "Opus 15, No. 4"
  }
  \keepWithTag layout  
  \new PianoStaff \with {
    \override Beam.breakable = ##t
  } <<
    \new Staff = "upper" \rightHand
    \new Dynamics \dynamics
    \new Staff = "lower" \leftHand
    \new Dynamics \pedal
    \new Devnull \tempi
    % \new Devnull \forceBreaks % Not used
  >>
  \layout {}
}

\include "articulate.ly"

preludeFourMidi =
\book {
  \bookOutputName "prelude-op15-no04"
  \score {
    \keepWithTag midi
    \articulate <<
      \new Staff = "upper" << \rightHand \dynamics \pedal \tempi >>
      \new Staff = "lower" << \leftHand \dynamics \pedal \tempi >>
    >>
    \midi {
      \context {
        \Staff
        \remove "Dynamic_performer"
      }
      \context {
        \Voice
        \consists "Dynamic_performer"
      } 
    }
  }
}
