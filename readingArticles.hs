{-

There are n programming concept articles you want to read, where each article i has an intellectual value of intellectuali and a length of pagesi pages. You must read an article at least two times to learn the concept it describes, and each concept can only be learned once (i.e., there is no increase in intellectual value if you attempt to relearn an article's concept ). In a single day, you can read up to a maximum of p pages.

 

Complete the readingArticles function in the editor below. It has three parameters:

    An array, intellectual, of n positive integers.
    An array, pages, of n positive integers.
    An integer, p, denoting the maximum number of pages you can read in a single day.

The function must return an integer denoting the maximum intellectual value you can gain in a single day by reading the articles.

 

Input Format

Locked stub code in the editor reads the following input from stdin and passes it to the function:

The first line contains an integer, n, denoting the number of elements in intellectual.

Each line i of the n subsequent lines contains an integer describing intellectuali.

The next line contains an integer, n, denoting the number of elements in pages.

Each line i of the n subsequent lines contains an integer describing pagesi.

The last line contains an integer, p, denoting the maximum number of pages you can read in a single day.

 

Constraints

    1 ≤ n ≤ 103
    1 ≤ intellectuali ≤ 106, where 0 ≤ i < n.
    1 ≤ pagesi ≤ 100, where 0 ≤ i < n.
    1 ≤ p ≤ 103

 

Output Format

The function must return a single integer which is the maximum intellectual value you can learn today by reading the articles. This is printed to stdout by locked stub code in the editor.

 

Sample Input 0

3
3
2
2
3
3
2
2
9

 

Sample Output 0

4

 

Explanation 0

There are n = 3 articles described as intellectual = [3, 2, 2] and pages = [3, 2, 2], and you're able to read a maximum of p = 9 pages per day. The best approach is to read the second and third articles twice, which means you'd read 2 · pages1 + 2 · pages2 = 2 · 2 + 2 · 2 = 8 pages and and gain a total intellectual value of intellectual1 + intellectual2 = 2 + 2 = 4. We then return 4 as our answer.

 

Sample Input 1

4
1
4
6
3
4
1
2
2
3
8

 

Sample Output 1

10

 

Explanation 1

There are n = 4 articles described as intellectual = [1, 4, 6, 3] and pages = [1, 2, 2, 3], and you're able to read a maximum of p = 8 pages per day. The best approach is to read the second and third articles twice, which means you'd read 2 · pages1 + 2 · pages2 = 2 · 2 + 2 · 2 = 8 pages and and gain a total intellectual value of intellectual1 + intellectual2 = 4 + 6 = 10. We then return 10 as our answer.

 

Sample Input 2

5
1
4
2
5
3
5
2
6
4
7
1
13

 

Sample Output 2

5

 

Explanation 2

There are n = 5 articles described as intellectual = [1, 4, 2, 5, 3] and pages = [2, 6, 4, 7, 1], and you're able to read a maximum of p = 13 pages per day. The best approach is to read the third and fifth articles twice, which means you'd read 2 · pages2 + 2 · pages4 = 2 · 4 + 2 · 1 = 10 pages and and gain a total intellectual value of intellectual2 + intellectual4 = 2 + 3 = 5. We then return 5 as our answer.

-}

import Data.List

orderIntellectualValueRatios :: (Fractional a, Ord a) =>
  (a, Int) -> (a, Int) -> Ordering
orderIntellectualValueRatios (ratio1, i1) (ratio2, i2) =
  compare ratio1 ratio2
  

readingArticles :: [Int] -> [Int] -> Int -> Int
readingArticles intellectual pages p =
  let
    twoPages = fmap (*2) pages
    intellectualValueRatios :: (Fractional a, Ord a) => [(a, Int)]
    intellectualValueRatios = zipWith (\i p -> (2.5, i)) intellectual twoPages
    srtd :: (Fractional a, Ord a) => [(a, Int)]
    srtd = sortBy orderIntellectualValueRatios intellectualValueRatios
    dailyReading :: (Fractional a, Ord a) => [(a, Int)]
    dailyReading = take p srtd
    totalIntellectualValue :: Int
    totalIntellectualValue = foldl (\s tup -> fst tup + s) 0 dailyReading
  in
    totalIntellectualValue

