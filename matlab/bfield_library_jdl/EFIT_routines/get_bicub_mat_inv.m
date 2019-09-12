function bicub_mat = get_bicub_mat_inv()
bicub_mat = [ ...
     1     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
     0     0     0     0     1     0     0     0     0     0     0     0     0     0     0     0
    -3     3     0     0    -2    -1     0     0     0     0     0     0     0     0     0     0
     2    -2     0     0     1     1     0     0     0     0     0     0     0     0     0     0
     0     0     0     0     0     0     0     0     1     0     0     0     0     0     0     0
     0     0     0     0     0     0     0     0     0     0     0     0     1     0     0     0
     0     0     0     0     0     0     0     0    -3     3     0     0    -2    -1     0     0
     0     0     0     0     0     0     0     0     2    -2     0     0     1     1     0     0
    -3     0     3     0     0     0     0     0    -2     0    -1     0     0     0     0     0
     0     0     0     0    -3     0     3     0     0     0     0     0    -2     0    -1     0
     9    -9    -9     9     6     3    -6    -3     6    -6     3    -3     4     2     2     1
    -6     6     6    -6    -3    -3     3     3    -4     4    -2     2    -2    -2    -1    -1
     2     0    -2     0     0     0     0     0     1     0     1     0     0     0     0     0
     0     0     0     0     2     0    -2     0     0     0     0     0     1     0     1     0
    -6     6     6    -6    -4    -2     4     2    -3     3    -3     3    -2    -1    -2    -1
     4    -4    -4     4     2     2    -2    -2     2    -2     2    -2     1     1     1     1];