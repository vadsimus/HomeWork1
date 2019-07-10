function buttonClick() {
    x1_field = document.getElementById('x1');
    x2_field = document.getElementById('x2');
    if (x1_field.value.length >> 0 && x2_field.value.length >> 0) { //Проверяем не пустые ли поля
        var x1 = parseInt(x1_field.value);
        var x2 = parseInt(x2_field.value);
        var resultDiv = document.getElementById('result');
        var radio = document.getElementsByName('type');
        if (x1 >= x2) {                                             //Проверяем чтоб х1 был мень х2
            alert("Первое число должно быть меньше второго");
        }else{
        if (Number.isNaN(x1) || Number.isNaN(x2)) {                 //Если не цыфры, получим NaN и будем ругаться
            alert("В полях х1 и х2 должны быть только цифры");

        } else {
            resultDiv.innerHTML = ('x1:' + x1 + '|  x2: ' + x2 + " | ");    //Покажем с чем приходится работать

            if (radio[0].checked) { //Сумма чисел
                summ = 0;
                for (i = x1; i <= x2; i++) {
                    summ += i;
                }
                resultDiv.append(" сумма чисел от х1 до х2: " + summ);
            }

            if (radio[1].checked) { //произведение чисел
                if (x1 == 0 || x2 == 0) {
                    alert("Будем умножать на 0???")
                } else {
                    multiplication = 1;
                    for (i = x1; i <= x2; i++) {
                        multiplication *= i;
                    }
                    resultDiv.append(" произведение чисел от х1 до х2: " + multiplication);
                }

            }
            if (radio[2].checked) { //простые числа
                var list = simpl(x1, x2);
                resultDiv.append(" простые числа от х1 до х2: " + list);
            }

            if (radio[3].checked) { //Суперпростые числа
                var super_simple = new Array;
                var list2 = simpl(x1, x2);
                var full = simpl(2, x2);

                for (i = 0; i <= list2.length - 1; i++) {
                    k = full.length - list2.length + i;
                    if (full.indexOf(k + 1) != -1) {
                        super_simple.push(list2[i]);
                    }
                }
                resultDiv.append(" суперпростые числа от х1 до х2: " + super_simple);
            }
        }
    }
    } else {
        alert("Все поля должны быть заполнены")
    }

    function simpl(x1, x2) {        //Поиск простых чисел между х1 и х2
        var list = new Array;
        for (i = x1; i <= x2; i++) {
            for (j = 2; j <= i; j++) {
                if (i == j) {
                    list.push(i);
                }
                if (i % j == 0) {
                    break;
                }
            }
        }
        return list;
    }
}




function clearFields() {  //почистим все
    document.getElementById('x2').value = "";
    document.getElementById('x1').value = "";
    document.getElementById('result').innerHTML = ('');
}
