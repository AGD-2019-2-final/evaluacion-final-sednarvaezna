import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
#!/usr/bin/env python3
if __name__ == "__main__":
	for line in sys.stdin:
		# Setting some defaults
		line=line.strip()
		splits=line.split("\t")
		splits2 = splits[1].split(",")
		for letter in splits2:
			if len(splits[0])==1:          
				sys.stdout.write("{}\t0{}\n".format(letter,splits[0]))
			else:
				sys.stdout.write("{}\t{}\n".format(letter,splits[0]))
