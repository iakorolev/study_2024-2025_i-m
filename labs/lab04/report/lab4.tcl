# Создание объекта симулятора
set ns [new Simulator]

# Открытие файла out.nam для записи данных визуализации NAM
set nf [open out.nam w]

# Настройка записи трассировочных данных для визуализатора NAM в файл out.nam
$ns namtrace-all $nf

# Открытие файла out.tr для записи событий симуляции
set f [open out.tr w]

# Настройка записи всех событий симуляции в файл out.tr
$ns trace-all $f

# Установка параметров TCP-агента: размер окна TCP равен 32
Agent/TCP set window_ 32

# Установка размера пакетов TCP на 500 байт
Agent/TCP set pktSize_ 500

# Определение процедуры finish, которая завершает симуляцию и запускает анализ результатов
proc finish {} {
    global tchan_

    # Код на AWK для обработки выходных данных
    set awkCode {
        {
            if ($1 == "Q" && NF>2) {
                print $2, $3 >> "temp.q";
                set end $2
            }
            else if ($1 == "a" && NF>2)
                print $2, $3 >> "temp.a";
        }
    }

    # Удаление временных файлов, если они существуют
    exec rm -f temp.q temp.a

    # Создание пустых файлов temp.q и temp.a
    exec touch temp.a temp.q

    # Добавление заголовка цвета для файла temp.q
    set f [open temp.q w]
    puts $f "0.Color: Purple"
    close $f

    # Добавление заголовка цвета для файла temp.a
    set f [open temp.a w]
    puts $f "0.Color: Purple"
    close $f

    # Запуск обработки файлов через AWK
    exec awk $awkCode all.q

    # Запуск графиков xgraph для визуализации окна TCP и очереди
    exec xgraph -fg pink -bg purple -bb -tk -x time -t "TCPRenoCWND" WindowVsTimeRenoOne
    exec xgraph -fg pink -bg purple -bb -tk -x time -t "TCPRenoCWND" WindowVsTimeRenoAll
    exec xgraph -bb -tk -x time -y queue temp.q &
    exec xgraph -bb -tk -x time -y queue temp.a &

    # Запуск NAM для визуализации симуляции
    exec nam out.nam &

    # Завершение работы симулятора
    exit 0
}

# Определение процедуры plotWindow для мониторинга размера окна TCP
proc plotWindow {tcpSource file} {
    global ns
    set time 0.01

    # Получение текущего времени симуляции
    set now [$ns now]

    # Получение текущего размера окна TCP
    set cwnd [$tcpSource set cwnd_]

    # Запись значения окна TCP в файл
    puts $file "$now $cwnd"

    # Запланировать повторное выполнение через 0.01 секунды
    $ns at [expr $now+$time] "plotWindow $tcpSource $file"
}

# Создание двух узлов маршрутизаторов
set r1 [$ns node]
set r2 [$ns node]

# Создание симплексных каналов с различными параметрами
$ns simplex-link $r1 $r2 20Mb 15ms RED  # Пропускная способность 20 Мбит/с, задержка 15 мс, очередь RED
$ns simplex-link $r2 $r1 15Mb 20ms DropTail  # Пропускная способность 15 Мбит/с, задержка 20 мс, очередь DropTail

# Ограничение размера очереди между r1 и r2 до 300 пакетов
$ns queue-limit $r1 $r2 300

# Количество создаваемых узлов
set N 30

# Цикл создания 30 TCP-соединений
for {set i 0} {$i < $N} {incr i} {
    # Создание узлов отправителя и получателя
    set n1($i) [$ns node]
    set n2($i) [$ns node]

    # Создание дуплексных каналов с параметрами
    $ns duplex-link $n1($i) $r1 100Mb 20ms DropTail
    $ns duplex-link $n2($i) $r2 100Mb 20ms DropTail

    # Создание TCP-соединения между узлами
    set tcp($i) [$ns create-connection TCP/Reno $n1($i) TCPSink $n2($i) $i]

    # Привязка TCP-источника к FTP-приложению
    set ftp($i) [$tcp($i) attach-source FTP]
}

# Открытие файлов для записи данных о размере окна TCP
set windowVsTimeOne [open WindowVsTimeRenoOne w]
puts $windowVsTimeOne "0.Color: White"
set windowVsTimeAll [open WindowVsTimeRenoAll w]
puts $windowVsTimeAll "0.Color: White"

# Мониторинг очереди между r1 и r2 с интервалом 0.1 секунды
set qmon [$ns monitor-queue $r1 $r2 [open qm.out w] 0.1];

# Запуск таймера выборки для очереди
[$ns link $r1 $r2] queue-sample-timeout;

# Получение ссылки на очередь RED и настройка параметров RED-буфера
set redq [[$ns link $r1 $r2] queue]
$redq set thresh_ 75       # Минимальный порог очереди
$redq set maxthresh_ 150   # Максимальный порог очереди
$redq set q_weight_ 0.002  # Вес очереди
$redq set linterm_ 10      # Линейный интервал

# Открытие файла для записи данных об очереди
set tchan_ [open all.q w]

# Настройка трассировки параметров очереди RED
$redq trace curq_  # Текущий размер очереди
$redq trace ave_   # Средний размер очереди

# Привязка файла к RED-очереди
$redq attach $tchan_

# Запуск всех TCP-источников и мониторинг окон TCP
for {set i 0} {$i < $N} {incr i} {
    $ns at 0.0 "$ftp($i) start"  # Запуск передачи FTP
    $ns at 0.0 "plotWindow $tcp($i) $windowVsTimeAll"  # Мониторинг окна TCP
}

# Мониторинг окна TCP для конкретного TCP-соединения
$ns at 0.0 "plotWindow $tcp(1) $windowVsTimeOne"

# Планирование завершения симуляции через 20 секунд
$ns at 20.0 "finish"

# Запуск симуляции
$ns run

