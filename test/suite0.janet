(import ../sparkline)

(assert (=
    (sparkline/generate [0 1 2 3 4 5 6 7 8 9])
    "▁▁▂▃▄▅▆▇██"))

(assert (=
    (sparkline/generate [0 1 2 3 4 5 6 7 8 9] ["1" "2" "3"])
    "1112223333"))