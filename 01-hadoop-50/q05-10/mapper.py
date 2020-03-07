
import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
#!/usr/bin/env python3
if __name__ == "__main__":
	for line in sys.stdin:
		# Setting some defaults
		line=line.strip()
		splits=line.split("   ")
		splits=splits[1].split("-")        
		sys.stdout.write("{}\t1\n".format(splits[1]))
