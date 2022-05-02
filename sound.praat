# generate frequencies of each piano key
procedure pianoFrequencies: .size
    assert .size >= 0

    .frequencies# = zero#(.size)
    # NOTE: first frequency is C4 (A4 = 440Hz)
    .frequencies# ~ 440 * (2 ^ ((col - 10) / 12))

    .return# = .frequencies#
endproc


procedure generateSound: .frequency, .time
    .name$ = "sound"
    .channels = 1 ; monoral
    .startSec = 0
    .endSec = .time
    .samplingRateHz = 44100
    .amplitude = 0.2
    .fadeInDurationSec = 0.01
    .fadeOutDurationSec = 0.01

    .id = Create Sound as pure tone: .name$, .channels, .startSec, .endSec,
    ...                              .samplingRateHz, .frequency, .amplitude,
    ...                              .fadeInDurationSec, .fadeOutDurationSec

    .return = .id
endproc
