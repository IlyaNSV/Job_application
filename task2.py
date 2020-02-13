import re
import collections

filename = "hits.txt"
with open(filename, "r") as file:
    content = file.read()
    ip_massive = re.findall("\d{1,3}.\d{1,3}.\d{1,3}.\d{1,3}", content)  

c = dict(collections.Counter(ip_massive))
c = dict(
    zip(c.values(), c.keys()))  # меняем местами ключ и значение, чтобы значением был ip, а ключом - кол-во повторов.
repeats = list(c.keys())
repeats.sort(reverse=True)
for i in range(5):
    print(c.get(repeats[i]))
