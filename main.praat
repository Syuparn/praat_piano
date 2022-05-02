include click.praat
include keyboard.praat
include sound.praat
include util.praat

@main:

procedure main:
    # initialize viewport
    demo Erase all
    demo Select inner viewport: 0, 100, 0, 100
    demoWindowTitle: "Praat Piano"

    # draw keyboard shape
    @drawKeyboard:

    # prepare piano sounds
    @generatePianoSounds: 13, 1
    .soundIDs# = generatePianoSounds.return#

    # wait for click and play sounds
    while demoWaitForInput()
        if demoClicked()
            @handleClickEvent: .soundIDs#
        endif
    endwhile
endproc

procedure handleClickEvent: .soundIDs#
    @keyboardRectangles:
    @clickedRectangle: keyboardRectangles.return##, demoX(), demoY()

    # return if no keys are clicked
    if clickedRectangle.return == -1
        'endproc$'
    endif

    # play sound of clicked key
    selectObject: .soundIDs#[clickedRectangle.return]
    # NOTE: play should be asynchronously, otherwise demo windows freezes until sound ends
    asynchronous Play
endproc
