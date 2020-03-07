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
		if len(splits[2]) == 1:
			sys.stdout.write("{}\t00{}\t{}\n".format(splits[0],splits[2],splits[1]))
		elif len(splits[2]) == 2:
			sys.stdout.write("{}\t0{}\t{}\n".format(splits[0],splits[2],splits[1]))
		else:
			sys.stdout.write("{}\t{}\t{}\n".format(splits[0],splits[2],splits[1]))
