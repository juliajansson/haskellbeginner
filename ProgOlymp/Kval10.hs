cube:: Int -> [Int]
cube 1=[]
cube a=[b,c,d|a³==b³+c³+d³, 0<b, 0<c, 0<d, b<a, c<a, d<a]
