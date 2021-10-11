import os
import matplotlib.pyplot as plt

def csv_2_list(filename):
    with open(os.path.join('signal_captures', filename)) as f:
        for l in f.readlines()[1:]:
            yield int(l.split(',')[3], base=16)s

csvs = list()
  
# Iterate for each dict object in os.walk()
for root, dirs, files in os.walk("signal_captures"):
    csvs.extend(files)
sigs = [] 
for sine in csvs:
    sigs.append([a for a in csv_2_list(sine)])

for i in range(len(sigs)):
    plt.plot(sigs[i], 'o')

print(csvs)
plt.legend([n.split('.csv')[0] for n in csvs])
plt.title('Generated Sinewaves')
plt.grid('on')
plt.xlabel('ILA sample [N]')
plt.ylabel('8-bit level')
plt.show()
