include util.praat

procedure isClicked: .rectangle#, .x, .y
    # validation check
    assert size(.rectangle#) >= 4

    if (.x <= .rectangle#[1]) || (.x >= .rectangle#[2])
        .return = false
    elsif (.y <= .rectangle#[3]) || (.y >= .rectangle#[4])
        .return = false
    else
        .return = true
    endif
endproc

procedure clickedRectangle: .rectangles##, .x, .y
    # .rectangles## is list of {xFrom, xTo, yFrom, yTo, layer}
    # layer represent the order of overlapping rectangles (larger one overlaps another)
    assert numberOfColumns(.rectangles##) == 5

    .found = -1 ; index of found rectangle (-1 means not found)
    .foundLayer = -1 ; layer of found rectangle

    for .i to numberOfRows(.rectangles##)
        @nth: .rectangles##, .i
        @isClicked: nth.return#, .x, .y

        if isClicked.return
            # if a new rectangle overlays the previous one, return it instead
            .layer = .rectangles##[.i, 5]
            if .layer > .foundLayer
                .found = .i
                .foundLayer = .layer
            endif
        endif
    endfor

    .return = .found
endproc
