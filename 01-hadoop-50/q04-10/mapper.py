
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
		sys.stdout.write("{}\t{}\t{}\n".format(splits[1],splits[0],splits[2]))
