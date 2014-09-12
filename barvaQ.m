function [col]=barvaQ(Q)
    if sign(Q)<0.0;
        col='navy';
    else
        col='red';
    endif
endfunction
