import os
import matplotlib.pyplot as plt

def csv_2_list(filename):
    with open(os.path.join('captures', filename)) as f:
        for l in f.readlines()[1:]:
            yield int(l.split(',')[3], base=16)



csvs = list()
  
# Iterate for each dict object in os.walk()
for root, dirs, files in os.walk("captures"):
    csvs.extend(files)
sigs = [] 
for sine in csvs:
    sigs.append([a for a in csv_2_list(sine)])

for i in range(len(sigs)):
    plt.plot(sigs[i], 'o')

plt.legend(['x3', 'x6', 'x2', 'x1'])
plt.title('Generated Sinewaves')
plt.grid('on')
plt.xlabel('ILA sample [N]')
plt.ylabel('8-bit level')
plt.show()
