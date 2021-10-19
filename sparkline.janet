(def- defaultSteps
  "Steps dictionary"
  ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"])

(defn- normalize
  "Normalizes the numbers"
  [numbers stepCount]
  (def minValue (apply min numbers))
  (def numCapped (map (fn [n] (- n minValue)) numbers))
  (def maxValue (apply max numCapped))
  (map
    (fn [n]
      (def n1 (/ n maxValue))
      (def n2 (* n1 stepCount))
      (if (= n2 stepCount)
        (- stepCount 1)
        (math/floor n2)))
    numCapped))

(defn generate
  "Creates sparkline string from array of numbers"
  [numbers &opt steps]
  (default steps defaultSteps)
  (def stepCount (length steps))
  (def indexes (normalize numbers stepCount))
  (def buffer @[])
  (string/join
    (reduce
      (fn
        [acc el]
        (array/push acc (get steps el)))
      buffer
      indexes)))
