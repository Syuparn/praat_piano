include util.praat

procedure testNth:
    @nth: {{1, 2}, {3, 4}}, 1
    assert nth.return# == {1, 2}

    # nRow and nCol are different
    @nth: {{1, 2, 3}, {4, 5, 6}}, 2
    assert nth.return# == {4, 5, 6}
endproc

@testNth:
