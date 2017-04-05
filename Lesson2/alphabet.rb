alpha = {}
vowel = %w(e u o a i)

('a'..'z').each_with_index { |e, i|  alpha[e] = i + 1 if vowel.include?(e) }

p alpha

