import sys

fh = open('imputed.csv')
for line in fh:
    items = line.rstrip().split(',')

    if items[0] =='OutcomeType':
        print line.rstrip()+",breed,breedm,color,colorm"
    else:
        bstring = items[4]
        cstring = items[5]

        if '/' in cstring:
            color = cstring.split('/').pop()
            colorm = 1
        else:
            color = color = cstring
            colorm = 0

        if '/' in bstring:
            breed = bstring.split('/').pop()
            breedm= 1
        elif 'Mix' in bstring:
            temp = bstring.split()
            temp.pop()
            breed = " ".join(temp)
            breedm = 1
        else:
            breed = bstring
            breedm = 0

        breed = breed.lower()
        for strain in ('hound', 'bulldog', 'collie', 'shepherd', 
                'terrier', 'chin', 'Retriever', 'Mastiff','Spitz',
                'Rex', 'Husky', 'Setter'):
            if strain in breed:
                shortbreed = strain
                break
            else:
                shortbreed = 'other'
        breed = shortbreed

        color = color.lower()
        for i in ('white', 'black', 'red', 'brown', 'gold', 'silver',
                'orange', 'gray', 'blue', 'yellow', 'pink'):
            if i in color:
                shortcolor = i
                break
            else:
                shortcolor = 'other'
        color = shortcolor
                

        print line.rstrip()+",",
        print ",".join([str(x) for x in [breed,breedm,color,colorm]])
