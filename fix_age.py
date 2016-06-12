import sys

index = 0
for line in open(sys.argv[1]):
    index +=1
    if index ==1: print line,
    else:
        items = line.rstrip().split(',')

        age_string = items[5]  # change this to 7 if train; to 5 if test
        if len(age_string.split())!=2:
            age = ''
        else:
            num, unit = age_string.split()

            if 'day' in unit:
                age = int(num)*1.0
            elif 'week' in unit:
                age = float(num) * 7.0
            elif 'month' in unit:
                age = float(num)*30.0
            elif 'year' in unit:
                age = float(num)*365
            else:
                raise Exception("unit of age unknown: "+unit)
       
        items[5] = str(age) # change this to 7 if train; to 5 if test
        print ",".join(items)
