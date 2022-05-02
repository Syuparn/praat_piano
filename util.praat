true = 1
false = 0

endproc$ = "endproc"

procedure nth: .mat##, .n
    assert (.n > 0) || (.n > numberOfRows(.mat##))

    .v# = zero#(numberOfColumns(.mat##))
    .v# ~ .mat##[.n, col]

    .return# = .v#
endproc
