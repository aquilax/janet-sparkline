(def default-steps
  "Steps dictionary"
  ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"])

(defn- normalize
  "Normalizes the numbers"
  [numbers step-count]
  (def min-value (apply min numbers))
  (def num-capped (map (fn [n] (- n min-value)) numbers))
  (def max-value (apply max num-capped))
  (map
    (fn [n]
      (def n1 (/ n max-value))
      (def n2 (* n1 step-count))
      (if (= n2 step-count)
        (- step-count 1)
        (math/floor n2)))
    num-capped))

(defn generate
  "Creates sparkline string from array of numbers"
  [numbers &opt steps]
  (default steps default-steps)
  (def step-count (length steps))
  (def indexes (normalize numbers step-count))
  (def buffer @[])
  (string/join
    (reduce
      (fn
        [acc el]
        (array/push acc (get steps el)))
      buffer
      indexes)))
