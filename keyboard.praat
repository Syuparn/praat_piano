include graphic.praat
include util.praat

procedure keyboardRectangles:
    # rectangle: {xFrom, xTo, yFrom, yTo, layer}
    # NOTE: layer is necessary because black keys overlays white ones
    .c#      = {10%, 20%, 10%, 70%, 0}
    .cSharp# = {17%, 23%, 30%, 70%, 1}
    .d#      = {20%, 30%, 10%, 70%, 0}
    .dSharp# = {27%, 33%, 30%, 70%, 1}
    .e#      = {30%, 40%, 10%, 70%, 0}
    .f#      = {40%, 50%, 10%, 70%, 0}
    .fSharp# = {47%, 53%, 30%, 70%, 1}
    .g#      = {50%, 60%, 10%, 70%, 0}
    .gSharp# = {57%, 63%, 30%, 70%, 1}
    .a#      = {60%, 70%, 10%, 70%, 0}
    .aSharp# = {67%, 73%, 30%, 70%, 1}
    .b#      = {70%, 80%, 10%, 70%, 0}
    .cHigh#  = {80%, 90%, 10%, 70%, 0}

    .return## = {
        ....c#,
        ....cSharp#,
        ....d#,
        ....dSharp#,
        ....e#,
        ....f#,
        ....fSharp#,
        ....g#,
        ....gSharp#,
        ....a#,
        ....aSharp#,
        ....b#,
        ....cHigh#
    ...}
endproc

procedure keyboardColors:
    .return$# = {
        ..."white",
        ..."black",
        ..."white",
        ..."black",
        ..."white",
        ..."white",
        ..."black",
        ..."white",
        ..."black",
        ..."white",
        ..."black",
        ..."white",
        ..."white"
    ...}
endproc

procedure drawKeyboard:
    @keyboardRectangles:
    .rectangles## = keyboardRectangles.return##
    @keyboardColors:
    .colors$# = keyboardColors.return$#
    .size = 13

    for .i to .size
        @nth: .rectangles##, .i
        @drawRectangle: .colors$#[.i], nth.return#
    endfor
endproc
