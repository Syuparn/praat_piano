include click.praat
include keyboard.praat
include sound.praat
include util.praat

procedure main:
    # initialize viewport
    demo Erase all
    demo Select inner viewport: 0, 100, 0, 100

    # draw keyboard shape
    @drawKeyboard:

    # prepare piano sounds
    @generatePianoSounds: 13, 1

    # wait for click and play sounds
    
endproc

@main:

