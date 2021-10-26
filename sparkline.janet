(def default-steps
  "Steps dictionary"
  ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"])

(defn- normalize
  "Normalizes the numbers"
  [numbers step-count]
  (let [min-value (apply min numbers)
        num-capped (map (fn [n] (- n min-value)) numbers)
        max-value (apply max num-capped)]
    (map
      (fn [n]
        (let [n1 (/ n max-value)
              n2 (* n1 step-count)]
          (if (= n2 step-count)
            (- step-count 1)
            (math/floor n2))))
      num-capped)))

(defn generate
  "Creates sparkline string from array of numbers"
  [numbers &opt steps]
  (default steps default-steps)
  (let [step-count (length steps)
        indexes (normalize numbers step-count)]
    (string/join
      (map
        (fn
          [el]
          (get steps el))
        indexes))))
