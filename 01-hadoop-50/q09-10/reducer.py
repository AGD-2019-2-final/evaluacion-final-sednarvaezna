#!/usr/bin/env python

import sys

##
## Esta funcion reduce los elementos que
## tienen la misma clave
##

if __name__ == '__main__':

    curkey = None
    suma = 0
    counter = 0

    ##
    ## cada linea de texto recibida es una
    ## entrada clave \tabulador valor
    ##
    for line in sys.stdin:
        line = line.strip()
        val, key, date = line.split("\t")
        val = int(val)
        
        
        if counter <= 5:
            ##
            ## No se ha cambiado de clave. Aca se
            ## acumulan los valores para la misma clave.
            ##
            sys.stdout.write("{}\t{}\t{}\n".format(key,date,val))
            counter += 1
