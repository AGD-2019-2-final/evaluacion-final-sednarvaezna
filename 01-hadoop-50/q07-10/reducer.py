#!/usr/bin/env python

import sys

##
## Esta funcion reduce los elementos que
## tienen la misma clave
##

if __name__ == '__main__':

    curkey = None
    
    
    ##
    ## cada linea de texto recibida es una
    ## entrada clave \tabulador valor
    ##
    for line in sys.stdin:
        line=line.strip()
        key, val , date = line.split("\t")
        val = int(val)
        sys.stdout.write("{}\t{}\t{}\n".format(key, date,val))
