\version "2.24.0"

%
% Scheme functions
%

#(define-markup-command (tempo-markup layout props tempo dur dots mm) 
                        (markup? integer? integer? markup?)
  "\tempo emulator, but with no parens around MM"
  ; tempo = the text of the tempo, so Allegro, Lento, etc.
  ; dur   = log 2 of the duration, so 0 = whole, 1 = half, 2 = quarter, ..."
  ; dots  = the number of dots after the duration
  ; mm    = the metronome mark, so 100 or 63-76
  ; example: \textMark \markup \tempo-markup Vivace #2 #1 63-76 c'1
  (interpret-markup layout props
    (let ((dura (ly:make-duration dur dots)))
      #{\markup {
        \hspace #1.5 \bold #tempo
        \teeny "M.M."
        \raise #0.4 \tiny \note { #dura } #UP
        \small { "=" #mm }
      }#})))

%
% Redefine
%

staffUp   = \change Staff = "upper"
staffDown = \change Staff = "lower"

sd = \sustainOn
su = \sustainOff

lhMark = \markup { 
  \path #0.1 #'((moveto -1 0)(rlineto 0 1.5)(rlineto 0.5 0))
}
rhMark = \markup { 
  \path #0.1 #'((moveto -1 0)(rlineto 0 -1.5)(rlineto 0.5 0))
}

fingerLeft = \set fingeringOrientations = #'(left)

% Example of using left hand mark indicator
% \fingerLeft c4\finger\lhMark

insideSlur = \tweak avoid-slur #'inside \etc

hideNoteHead = {
  \once {
    \omit Stem
    \omit Dots
    \omit Flag
    \hideNotes
  }
}

%
% Markup
%

rubato = \markup \large \italic "rubato"
legato = \markup \large \italic "legato"
rit = \markup \large \italic "rit."
ms = \markup \large \italic "m.s."
accel = \markup \large \italic "accel."
rubatoEAccel = \markup \large \italic "rubato e accel."
aTempo = \markup \large \italic "a tempo"
simile = \markup \large \italic "simile"
dolciss = \markup \large \italic "dolciss."
crescWhiteout = \markup \large \italic \whiteout \pad-markup #0.5 "cresc."
