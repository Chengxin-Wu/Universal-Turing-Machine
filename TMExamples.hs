module TMExamples where

import TM
import UniversalTM

-- following suggestion by Junnan in class
tripletm =
  TM [1 .. 6] "abc" "abc*! " id ' ' '!' trans 1 [6]
  where
    trans = goRight 1 ' ' ' ' 6 ++
            loopRight 1 "*" ++
            goRight 1 'a' '*' 2 ++
            loopRight 2 "a*" ++
            goRight 2 'b' '*' 3 ++
            loopRight 3 "b*" ++
            goRight 3 'c' '*' 4 ++
            loopRight 4 "c*" ++
            goLeft 4 ' ' ' ' 5 ++
            loopLeft 5 "abc*" ++
            goRight 5 '!' '!' 1 

myUTM = 
  TM [1 .. 118] "01#,." "01#,.*_!| " id ' ' '!' trans 1 [27]
  where 
    trans = goRight 1 ' ' ' ' 18 ++
            loopRight 1 "01#," ++
            goRight 1 '.' '.' 2 ++
            loopLeft 2 "01." ++
            goRight 2 '#' '#' 3 ++
            goRight 3 '0' '*' 4 ++
            loopRight 4 "01#,." ++
            goRight 4 ' ' '0' 5 ++
            loopLeft 5 "01#,. " ++
            goRight 5 '*' '0' 3 ++
            goRight 3 '1' '*' 6 ++
            loopRight 6 "01#,." ++
            goRight 6 ' ' '1' 7 ++
            loopLeft 7 "01#,. " ++
            goRight 7 '*' '1' 3 ++
            goRight 3 '.' '.' 8 ++
            loopRight 8 "01#,." ++
            goRight 8 ' ' ',' 9 ++
            -- find the start state and record at end.
            loopLeft 9 "01#, " ++
            goRight 9 '.' '.' 10 ++
            goRight 10 ',' ',' 11 ++
            goRight 11 '#' '#' 12 ++
            goRight 12 '0' '*' 13 ++
            loopRight 13 "01#,." ++
            goRight 13 ' ' '0' 14 ++
            loopLeft 14 "01#,. " ++ 
            goRight 14 '*' '0' 12 ++
            goRight 12 '1' '*' 15 ++
            loopRight 15 "01#,." ++
            goRight 15 ' ' '1' 16 ++
            loopLeft 16 "01#,. " ++
            goRight 16 '*' '1' 12 ++
            goRight 12 ',' '_' 17 ++
            loopRight 17 "01#,. " ++
            goRight 17 ' ' '#' 18 ++
            -- find the first input character and record at end
            loopLeft 18 "01#,._ " ++
            goRight 18 '!' '!' 19 ++
            loopRight 19 "10#,_" ++
            goRight 19 '.' '.' 20 ++
            loopRight 20 "01._" ++
            goRight 20 ',' ',' 21 ++
            goRight 21 ',' ',' 20 ++
            goRight 21 '1' '*' 22 ++
            loopRight 22 "01#*,._" ++
            goLeft 22 '#' '#' 23 ++
            goLeft 23 ',' ',' 24 ++
            loopLeft 24 "01*" ++
            goLeft 24 ',' ',' 25 ++
            loopLeft 25 "01*" ++
            goRight 25 '#' '#' 26 ++
            loopRight 26 "*" ++
            goRight 26 '1' '*' 27 ++
            loopLeft 27 "01#,._ " ++
            goRight 27 '*' '1' 21 ++
            goRight 21 '0' '*' 29 ++
            loopRight 29 "01#,._" ++
            goLeft 29 '#' '#' 30 ++
            goLeft 30 ',' ',' 31 ++
            loopLeft 31 "01*" ++
            goLeft 31 ',' ',' 32 ++
            loopLeft 32 "01*" ++
            goRight 32 '#' '#' 33 ++
            loopRight 33 "*" ++
            goRight 33 '0' '*' 34 ++
            loopLeft 35 "01#,._ " ++
            goRight 35 '*' '0' 21 ++
            goRight 21 '.' '.' 36 ++
            goRight 36 '1' '*' 37 ++
            loopRight 37 "01#,._" ++
            goLeft 38 '#' '#' 39 ++
            goLeft 39 ',' ',' 40 ++
            loopLeft 40 "01*" ++
            goRight 41 ',' ',' 42 ++
            goRight 42 '1' '*' 43 ++
            loopLeft 44 "01,.#_ " ++
            goRight 44 '*' '1' 36 ++
            goRight 36 '0' '*' 45 ++
            loopRight 45 "01#,._" ++
            goLeft 45 '#' '#' 46 ++
            goLeft 46 ',' ',' 47 ++
            loopLeft 47 "01*" ++
            goRight 47 ',' ',' 48 ++
            goRight 48 '0' '*' 49 ++
            loopLeft 49 "01,.#_ " ++
            goRight 49 '*' '1' 36 ++
            goRight 36 '.' '*' 50 ++
            loopRight 50 "01" ++
            goRight 50 '.' '.' 51 ++
            loopRight 51 "10" ++
            goRight 51 '.' '.' 52 ++
            goRight 52 '1' '*' 53 ++
            loopRight 53 "01,.#* " ++
            goLeft 53 '_' '_' 54 ++
            loopLeft 54 "01" ++
            goRight 55 '0' '1' 56 ++
            goRight 55 '1' '1' 56 ++
            goRight 56 '0' '*' 57 ++
            goRight 56 '1' '*' 57 ++
            loopLeft 57 "01,.#" ++
            goRight 57 '*' '1' 64 ++
            goRight 52 '0' '*' 58 ++
            loopRight 58 "01,.#* " ++
            goLeft 58 '_' '_' 59 ++
            loopLeft 59 "01" ++
            goRight 59 '0' '0' 60 ++
            goRight 60 '1' '0' 61 ++
            goRight 61 '0' '*' 62 ++
            goRight 62 '1' '*' 63 ++
            loopLeft 63 "01,.#" ++
            goRight 63 '*' '0' 64 ++
            goRight 64 '1' '*' 65 ++
            loopRight 65 "01#,." ++
            goRight 65 '*' '1' 66 ++
            goRight 66 '0' '*' 67 ++
            goRight 66 '1' '*' 67 ++
            loopLeft 68 "01#,. " ++
            goRight 68 '*' '1' 64 ++
            goRight 64 '0' '*' 69 ++
            loopRight 69 "01#,." ++
            goRight 69 '*' '0' 70 ++
            goRight 70 '0' '*' 71 ++
            goRight 71 '1' '*' 72 ++
            loopLeft 72 "01#,. " ++
            goRight 72 '*' '0' 64 ++
            goRight 64 '.' '.' 73 ++
            goLeft 73 '.' '.' 74 ++
            loopLeft 74 "01" ++
            goLeft 74 '.' '.' 75 ++
            loopLeft 75 "01" ++
            goRight 75 '.' '|' 76 ++
            goRight 76 '1' '*' 77 ++
            loopRight 77 "01#*,._" ++
            goRight 77 ' ' '1' 78 ++
            loopLeft 78 "01#,.* " ++
            goLeft 78 '_' '_' 79 ++
            loopLeft 79 "01#,. " ++
            goRight 79 '*' '1' 76 ++
            goRight 76 '0' '*' 81 ++
            loopRight 81 "01#*,._" ++
            goRight 81 ' ' '0'  82 ++
            loopLeft 82 "01#,.* " ++
            goLeft 82 '_' '_' 83 ++
            loopLeft 83 "01#,. " ++
            goRight 83 '*' '0' 76 ++ 
            goRight 76 '.' '.' 84 ++
            loopRight 84 "01#*,._" ++
            goRight 84 ' ' ',' 85 ++
            -- record the new state
            goLeft 85 ',' ',' 92 ++
            goLeft 92 '1' '|' 93 ++
            loopLeft 93 "01#*,._ " ++
            goRight 93 '!' '!' 94 ++
            loopRight 94 "01#" ++
            goLeft 94 '1' '1' 95 ++
            goLeft 95 '1' '1' 96 ++
            loopRight 96 "01#*,._" ++
            goRight 96 '|' '1' 97 ++
            goLeft 97 '1' '1' 98 ++
            goLeft 95 '0' '0' 99 ++
            loopRight 100 "01#*,._" ++
            goRight 100 '|' '1' 101 ++
            goLeft 101 '0' '0' 102 ++
            goLeft 92 '0' '|' 103 ++
            loopLeft 103 "01#*,._ " ++
            goRight 103 '!' '!' 104 ++
            loopRight 104 "01#" ++
            goLeft 104 '1' '1' 105 ++
            goLeft 105 '1' '1' 106 ++
            loopRight 106 "01#*,._" ++
            goRight 106 '|' '0' 107 ++
            goLeft 107 '1' '1' 108 ++
            goLeft 108 '0' '0' 109 ++
            loopRight 109 "01#*,._" ++
            goRight 109 '|' '0' 110 ++
            goLeft 110 '0' '0' 102 ++
            goLeft 102 '1' '1' 111 ++
            loopLeft 111 "01#*,._ " ++
            goRight 111 '!' '!' 112 ++
            loopRight 112 "01" ++
            goRight 112 '#' '#' 113 ++
            loopRight 113 "01" ++
            goRight 113 '#' '#' 114 ++
            loopRight 114 "01" ++
            goRight 114 '#' '#' 115 ++
            goRight 115 '1' '1' 116 ++
            goLeft 102 '0' '0' 117 ++
            loopLeft 117 "01#*,._ " ++
            goRight 117 '!' '!' 118 ++
            loopRight 118 "01" ++
            goRight 118 '#' '#' 119 ++
            loopRight 119 "01" ++
            goRight 120 '#' '#' 121 ++
            loopRight 122 "01" ++
            goRight 122 '#' '#' 123 ++
            goRight 123 '1' '1' 118 ++
            -- check whether the new state is final state
            loopLeft 85 "01#*,._ " ++
            goLeft 85 '|' '.' 86 ++
            goLeft 86 '1' '1' 87 ++
            loopLeft 87 "01#*,. " ++
            goRight 87 '_' ',' 88 ++
            loopLeft 88 "01" ++
            goLeft 88 ',' ',' 89 ++
            loopLeft 89 "01" ++
            goRight 89 ',' ',' 12 ++
            goLeft 86 '0' '0' 90 ++
            loopLeft 91 "01#*,. " ++
            goRight 91 '_' ',' 12
            -- record the new string and start loop.

            {--
            goLeft 18 '#' '#' 19 ++
            loopLeft 19 "01," ++
            goRight 19 '#' '#' 20 ++
            goRight 20 '0' '*' 21 ++
            goLeft 21 '*' '*' 22 ++
            loopLeft 22 "01#,._" ++
            goRight 22 '!' '!' 23 ++
            loopRight 23 "01#,._" ++
            goRight 23 '0' '*' 24 ++
            loopRight 24 "01#,._" ++
            goRight 24 '*' '0' 20 ++
            goRight 20 '1' '*' 25 ++
            goLeft 25 '*' '*' 26 ++
            loopLeft 26 "01#,._"
            goRight 26 '!' '!' 27 ++
            loopRight 27 "01#,._" ++
            -}

acceptsh' :: (Eq state, Eq tape) => TM input state tape -> [Config state tape] -> [Config state tape]
acceptsh' tm [] = []
acceptsh' tm (c@(Config st _ _ _) : cs) =
  if elem st (final tm) then []
  else
    (cs ++ newConfigs tm c) ++ acceptsh' tm (cs ++ newConfigs tm c)

findConfig :: (Eq state, Eq tape) => TM input state tape -> [input] -> [Config state tape]
findConfig tm xs = acceptsh' tm [initialConfig tm xs]

debugTool :: (Eq state, Eq tape) => [Config state tape] -> Config state tape
debugTool xs
  | null (tail xs) = head xs
  | otherwise = debugTool (tail xs)

accepts' :: (Eq state, Eq tape) => TM input state tape -> [input] -> Config state tape
accepts' tm xs = debugTool (findConfig tm xs)

-- "100001#000001#1#011,#1.000001.0.011.000001.,1.010101.0.1.010101.,1.100011.0.011.010101.,#010101,100011#"