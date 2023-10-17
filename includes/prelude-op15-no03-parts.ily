%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"
\language "english"

\include "global-variables.ily"

%%% Posistions and shapes %%%

beamPositionsA = \once \override Beam.positions = #'(3 . 6.5)
beamPositionsB = \once \override Beam.positions = #'(3 . 6)

%%% Music %%%

global = {
  \time 6/8
  \key e \major
  \accidentalStyle piano
}

rightHand = \relative {
  \global
  \set Score.tempoHideNote = ##t
  \textMark \markup \tempo-markup "Allegro assai" #2 #1 120-126
  % Is it possible that Scriabin wrote or meant eighth = 120-126?  This
  % tempo seems more reasonable, even though it's not really Allegro.
  % I have heard one performance where this (the below) was the tempo.
  % https://www.youtube.com/watch?v=tC64ZU7Nr8w
  \tempo 8 = 120
  r8 <b' e gs e'>\arpeggio <b e gs ds'>\arpeggio <b e gs cs>\arpeggio
    <b e gs>\arpeggio <b e a>\arpeggio |
  r8 <e, e' b'>\arpeggio <gs e'>\arpeggio <gs e' gs b>\arpeggio
    <gs e' gs cs>\arpeggio <b e gs>\arpeggio |
  <a cs e a>8\arpeggio <e' a cs gs'>\arpeggio <e a cs fs>\arpeggio
    <cs a' cs e>\arpeggio <a e' cs'>\arpeggio <cs e a>\arpeggio |
  <a ds gs>\arpeggio < a ds es>\arpeggio <a ds fs>\arpeggio 
    <b fs' cs'>\arpeggio <a ds b'>\arpeggio <a ds gs>\arpeggio |
  <gs e'>8 <b e gs e'>\arpeggio <b e gs ds'>\arpeggio <b e gs cs>\arpeggio
    <b e gs>\arpeggio <b e a>\arpeggio |
  r8^\simile <e, e' b'> <gs e'> <gs e' gs b> <b e as> <b e gs> |
  <b e fs>8 <b fs' e'> <b fs' ds'> <as fs' cs'> <fs cs' as'> <cs as' fs'>|
  <cs fs e'> <cs fs cs'> <b fs' ds'> <ds b' gs'> <ds b' fs'> <ds b' ds> |
  
  \barNumberCheck 9
  r8 <d b' fs'> <fs b d> r <fs d' fs> <e d' gs> |
  r8 <e d' a'> <e d' e> <e d' b'> <cs a' e'> <cs a' es'> |
  <d a' fs'> <fs d' a'> <a d fs> r <a fs' a> <gs fs' b> |
  r8 <gs fs' cs'> <gs fs' gs> <gs fs' d'> <e cs' fss> <es cs' gs'> |
  <fs cs' as'> <as fs' cs'> <as fs' d'> r <a fs' cs'> <a d fs> |
  r8 <a e' b'> <gs e' cs'> <gs e' b'> <a cs a'> <e cs'> |
  ds'8 <e, cs' e> <e cs' fs> fss' <b, e gs> <b e b'> |
  ds'8 <b, gs' cs> <a cs fs> <a e' a> <e a cs> <ds a' ds> |
  
  \barNumberCheck 17
  <b e gs e'> <b' e gs e'> <b e gs ds'> <b e gs cs> <b e gs> <b e a> |
  r8 <a e' b'> <a e' fs> <a e' b' > <a e' cs'> <a ds b'> |
  r8 <b, e gs e'> <b e gs ds'> <b e gs cs> <b e gs> <b e a> |
  r8 <a e' b'> <a e' fs> <a e' b' > <a e' cs'> <a ds b'> |
  r8 <b gs'> <b gs' b> <b gs' e'> <e b' gs'> <gs e' b'> |
  <b gs' e'>4. r4 r8 |
  \bar "|."
}

leftHand = \relative {
  \global
  \clef bass
  e,,8 <b'' gs' e'>\arpeggio <gs' e' b'>\arpeggio \clef treble 
    <b gs' e'>\arpeggio \clef bass <e, b' b'>\arpeggio <b e e'>\arpeggio |
  <cs,, cs'>8 <cs'' b' gs'>\arpeggio <gs' e' b'>\arpeggio \clef treble 
    <e' b' e>\arpeggio <gs, e' b'>\arpeggio \clef bass <cs, b' e>\arpeggio |
  <fs,, fs'>8 <cs'' a' e'>\arpeggio <a' fs' cs'>\arpeggio \clef treble
    <cs a' e'>\arpeggio <fs, cs' a'>\arpeggio \clef bass <cs a' e'>\arpeggio |
  <b, b'>8 <b' a' ds>\arpeggio <fs' ds' b'>\arpeggio \clef treble 
    <a fs' ds'>\arpeggio \clef bass <fs ds' b'>\arpeggio <b, a' ds>\arpeggio |
  <e,, e'>8 <b'' gs' e'>\arpeggio <gs' e' b'>\arpeggio \clef treble 
    <b gs' e'>\arpeggio \clef bass <e, b' b'>\arpeggio <b e e'>\arpeggio |
  <cs,, cs'> <cs'' b' gs'> <gs' e' b'> \clef treble <e' b' e> <gs, e' b'>
    \clef bass <cs, b' e> |
  <fs,, fs'>8 <cs'' b' fs'> q <e cs' fs> <cs as' e'> <fs, e' as> |
  <b,, b'> <fs'' e' as> <fs ds' b'> <ds' b' fs'>4 <fs, fs'>8 |
  
  \barNumberCheck 9
  <b, b'>8 <b' fs' d'> <fs' d' a'> <b,, b'> <e' d' a'> <e d' gs> |
  <a,, a'>8 <e'' d' g> q <g d' g> <a, g' cs> <g' cs a'> |
  <d, d'>8 <d' a' fs'> <a' fs' cs'> <d,, d'> <gs' fs' cs'> <gs fs' b> |
  <cs,, cs'>8 <gs'' fs' b> q <b fs' b> <cs, b' e> <b' es> |
  <fs, fs'>8 <fs' e' as> q <b,, b'> <fs'' e' a> <fs d' a'> |
  <e, e'>8 <e' d' a'> <e d' gs> <a,, a'> <e'' cs' a'> q |
  <as,, as'> <e'' cs' gs'> < e cs' fs> <b, b'> <e' b' e> <b gs' e'> |
  \ottava -1 <b,, b'> \ottava 0 <fs''' e' b'> <fs e' a> <fs cs' a'>
    <b, fs' cs'> <b fs' b> |
    
  \barNumberCheck 17
  <e,, e'> <b'' gs' e'> <gs' e' b'> \clef treble <b gs' e'>4 \clef bass
    <b, b'>8 |
  <e,, e'>8 <b'' fs' e'> <fs' e' a> \clef treble <cs' fs cs'> \clef bass
    <fs, e' a> <b, a' ds> |
  \beamPositionsA <e,, e'>8 \acciaccatura { b''^> } b \acciaccatura { gs'^> } 
    gs \acciaccatura { e'^> } e4 b,8 |
  \beamPositionsB <e,, e'>8 \acciaccatura { b''^> } b \acciaccatura { fs'^> } 
    fs \acciaccatura { cs'^> } cs fs, b, |
  <e, e'> <e' gs e'> <ds gs e'> <cs gs' e'> <b gs' e'> <gs e' b'> |
  <e b' gs'>4. r4 r8 |
}

dynamics = {
  \override DynamicTextSpanner.style = #'none
  s2.\mf |
  s4. s\cresc |
  s2.\f |
  s2.\dim |
  s2.\mf |
  s4. s\cresc |
  s2.\f |
  s2 s8 s\p |
  
  \barNumberCheck 9
  s4 s8\cresc s4. |
  s4. s4\> s8\! |
  s2.\cresc |
  s4. s4\> s8\! |
  s2.\mf |
  s2. |
  s2.\cresc |
  s4.\ff s8 s4\dim |
  
  \barNumberCheck 17
  s2. * 2 |
  s2.\dim |
  s2. * 2 |
  s2.\! |
}

% MIDI only
pedal = {
  s2.\sd |
  s2.\su\sd |
  s2.\su\sd |
  s2.\su\sd |
  s2.\su\sd |
  s2.\su\sd |
  s4.\su\sd s\su\sd |
  s4\su\sd s2\su\sd |
  
  \barNumberCheck 9
  s4.\su\sd s\su\sd |
  s2.\su\sd |
  s4.\su\sd s\su\sd |
  s2.\su\sd |
  s4.\su\sd s\su\sd |
  s4.\su\sd s\su\sd |
  s4.\su\sd s\su\sd |
  s4.\su\sd s\su\sd |
  
  \barNumberCheck 17
  s2.\su\sd |
  s2.\su\sd |
  s2.\su\sd |
  s2.\su\sd |
  s4.\su\sd s\su\sd |
  s4.\su\sd s\su |
}

% Not used
forceBreaks = {
  s2. * 2 s2. \break
  s2. * 3 s2. \break
  s2. * 4 s2. \break
  s2. * 4 s2. \break
}

preludeThreeNotes =
\score {
  \header {
    title = "3."
    composer = "Alexander Scriabin"
    opus = "Opus 15, No. 3"
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

preludeThreeMidi =
\book {
  \bookOutputName "prelude-op15-no03"
  \score {
    \keepWithTag midi
    \articulate <<
      \new Staff = "upper" << \rightHand \dynamics \pedal >>
      \new Staff = "lower" << \leftHand \dynamics \pedal >>
    >>
    \midi {}
  }
}
