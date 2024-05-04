# find the 13 adjacent digits in (the 1000-digit number (that have the greatest product)).

const Series = ""*
"73167176531330624919225119674426574742355349194934" *
"96983520312774506326239578318016984801869478851843" *
"85861560789112949495459501737958331952853208805511" *
"12540698747158523863050715693290963295227443043557" *
"66896648950445244523161731856403098711121722383113" *
"62229893423380308135336276614282806444486645238749" *
"30358907296290491560440772390713810515859307960866" *
"70172427121883998797908792274921901699720888093776" *
"65727333001053367881220235421809751254540594752243" *
"52584907711670556013604839586446706324415722155397" *
"53697817977846174064955149290862569321978468622482" *
"83972241375657056057490261407972968652414535100474" *
"82166370484403199890008895243450658541227588666881" *
"16427171479924442928230863465674813919123162824586" *
"17866458359124566529476545682848912883142607690042" *
"24219022671055626321111109370544217506941658960408" *
"07198403850962455444362981230987879927244284909188" *
"84580156166097919133875499200524063689912560717606" *
"05886116467109405077541002256983155200055935729725" *
"71636269561882670428252483600823257530420752963450"

function listOfProduct(series::AbstractString)
  product = 1
  for digit in series
    num = parse(Int, digit)
    product *= num
  end
  return product
end

#tidySeries2 = split(replace(Series, r"0\d{0,12}0" => "0"), "0")

# Splits the string by 0, then leaves only those with length greater than 12.
tidySeries = [i for i in split(Series, "0") if length(i) > 12]

println("tidySeries:")
#display(tidySeries)
map(x -> println("length: $(length(x)), seq,$(x)"), tidySeries)

# Finds the product of the 13 adjacent digits.
global maxProduct = 0

for element in tidySeries
  for i in 1:length(element)-12
    product = listOfProduct(element[i:i+12])
    if product > maxProduct
      global maxProduct = product
    end
  end
end

println("\nmaxProduct: $maxProduct\n")
