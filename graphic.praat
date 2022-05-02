procedure drawRectangle: .color$, .rectangle# 
    if .color$ == "white"
        demo Draw Rectangle: .rectangle#[1], .rectangle#[2], .rectangle#[3], .rectangle#[4]
    else
        demo Paint rectangle: .color$, .rectangle#[1], .rectangle#[2], .rectangle#[3], .rectangle#[4]
    endif
endproc
