include sound.praat

procedure testPianoFrequencies:
    @pianoFrequencies: 3
    #                                   C4                 , C#4                , D4
    assert pianoFrequencies.return# == {440 * 2 ^ (-9 / 12), 440 * 2 ^ (-8 / 12), 440 * 2 ^ (-7 / 12)}
endproc

@testPianoFrequencies:

procedure testGenerateSound:
    @generateSound: 440, 1
    # check whether the object is actually generated by removing it
    removeObject: generateSound.return

    # TODO: check sound's frequency
endproc

@testGenerateSound:
