def progress(MaxDays):
    Sum = int()
    for i in range(MaxDays):
        if len(str(i)) == 2:
            Sum += int(str(i)[0])
            Sum += int(str(i)[1])
        else:
            Sum += i
    return Sum

while True:
    Year = int(input("Введите год: "))
    Months = {31:["Январь", "Март", "Май", "Июль", "Август", "Октябрь", "Декабрь"], 28:["Февраль"], 30:["Апрель", "Июнь", "Сентябрь", "Ноябрь"]}
    Sum = int()
    if Year % 4 == 0:
        Sum += progress(30)
    else:
        Sum += progress(29)
    for key in Months:
        if key == 31:
            for i in range(7):
                Sum += progress(key + 1)
        if key == 30:
            for i in range(4):
                Sum += progress(key + 1)
    print(Sum)
