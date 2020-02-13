filename = "names.txt"
# читаем файл и создаем список из слов без кавычек, выполняем функцию сортировки(по умолчанию лексикографический
# порядок)
with open(filename, "r") as file:
    content = ((file.read()).replace('"', "")).split(",")
    content.sort()


# создаем функцию, считающую сумму алфавитных порядков букв в слове, чтобы не усложнять словарем берем значения из
# unicode и вычетаем 64
def alph_sum(name):
    summ = 0
    for latter in name:
        summ += (ord(latter) - 64)
    return (summ)


# создаем цикл с счетчиком позиции слова и переменной позиции*сумму букв, к ответу прибавляем каждую переменную
i = 0
answer = 0
for word in content:
    i += 1
    pos_summ = i * alph_sum(word)
    answer += pos_summ
print(answer)
