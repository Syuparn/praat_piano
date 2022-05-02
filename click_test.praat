include click.praat
include util.praat

procedure testIsClicked:
    # rectangle is clicked
    @isClicked: {10%, 20%, 30%, 40%, 0}, 15%, 35%
    assert isClicked.return == true

    # rectangle is not clicked (x is out of range)
    @isClicked: {10%, 20%, 30%, 40%, 0}, 25%, 35%
    assert isClicked.return == false

    # rectangle is not clicked (y is out of range)
    @isClicked: {10%, 20%, 30%, 40%, 0}, 15%, 45%
    assert isClicked.return == false

    # x border is excluded
    @isClicked: {10%, 20%, 30%, 40%, 0}, 10%, 35%
    assert isClicked.return == false

    # y border is excluded
    @isClicked: {10%, 20%, 30%, 40%, 0}, 15%, 40%
    assert isClicked.return == false
endproc

@testIsClicked:

procedure testClickedRectangle:
    .rectangles## = {
    ...{10%, 20%, 10%, 90%, 0},
    ...{20%, 30%, 10%, 90%, 0},
    ...{25%, 40%, 10%, 90%, 1}
    ...}

    # rectangle 1 is clicked
    @clickedRectangle: .rectangles##, 15%, 40%
    assert clickedRectangle.return == 1

    # if multiple rectangles are found, returns the one whose layer is the largest.
    @clickedRectangle: .rectangles##, 26%, 40%
    assert clickedRectangle.return == 3

    # if no rectangles are found, returns -1
    @clickedRectangle: .rectangles##, 80%, 40%
    assert clickedRectangle.return == -1

    # borders are ignored
    @clickedRectangle: .rectangles##, 20%, 40%
    assert clickedRectangle.return == -1
endproc

@testClickedRectangle:

