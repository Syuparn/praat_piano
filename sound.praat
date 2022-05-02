# generate frequencies of each piano key
procedure pianoFrequencies: .size
    assert .size >= 0

    .frequencies# = zero#(.size)
    # NOTE: first frequency is C4 (A4 = 440Hz)
    .frequencies# ~ 440 * (2 ^ ((col - 10) / 12))

    .return# = .frequencies#
endproc

# generate sound objects of each piano key (first one is C4)
procedure generatePianoSounds: .size, .timeSec
    assert .size >= 0

    @pianoFrequencies: .size
    .frequencies# = pianoFrequencies.return#

    .soundObjIDs# = zero#(.size)
    for .i to .size
        @generateSound: .frequencies#[.i], .timeSec
        .soundObjIDs#[.i] = generateSound.return
    endfor

    .return# = .soundObjIDs#
endproc

procedure generateSound: .frequencyHz, .timeSec
    .name$ = "sound"
    .channels = 1 ; monoral
    .startSec = 0
    .endSec = .timeSec
    .samplingRateHz = 44100
    .amplitude = 0.2
    .fadeInDurationSec = 0.01
    .fadeOutDurationSec = 0.01

    .id = Create Sound as pure tone: .name$, .channels, .startSec, .endSec,
    ...                              .samplingRateHz, .frequencyHz, .amplitude,
    ...                              .fadeInDurationSec, .fadeOutDurationSec

    .return = .id
endproc
