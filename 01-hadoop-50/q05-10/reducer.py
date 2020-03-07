
import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
#!/usr/bin/env python3
if __name__ == "__main__":
	total = 0
	actualkey=None
	for line in sys.stdin:
		
		# Setting some defaults
		
		key,value =line.split("\t")
		value = int(value)
        
		if actualkey==key:
			total = total + value
            
		else:
			if actualkey is not None:
				sys.stdout.write("{}\t{}\n".format(actualkey, total))
			actualkey=key
			total = value
	sys.stdout.write("{}\t{}\n".format(actualkey, total))
