include util.praat

procedure isClicked: .rectangle#, .x, .y
    # validation check
    assert size(.rectangle#) == 4

    if (.x <= .rectangle#[1]) || (.x >= .rectangle#[2])
        .return = false
    elsif (.y <= .rectangle#[3]) || (.y >= .rectangle#[4])
        .return = false
    else
        .return = true
    endif
endproc

procedure clickedRectangle: .rectangles##, .x, .y
    for .i to numberOfRows(.rectangles##)
        @nth: .rectangles##, .i
        @isClicked: nth.return#, .x, .y

        if isClicked.return
            .return = .i
            # HACK: early return
            'endproc$'
        endif
    endfor

    # if no rectangles found, return -1
    .return = -1
endproc
