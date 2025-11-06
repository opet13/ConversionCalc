type Student = (String, [Int])

students :: [Student]
students =
    [ ("Ali",    [85, 90, 82])
    , ("Siti",   [78, 80, 75])
    , ("John",   [92, 88, 95])
    , ("Aisha",  [65, 70, 60])
    , ("Farah",  [89, 84, 87])
    ]


average :: [Int] -> Float
average xs = fromIntegral (sum xs) / fromIntegral (length xs)

distinction :: [Student] -> [Student]
distinction = filter (\(_, grades) -> average grades > 80)

topStudent :: [Student] -> Student
topStudent = foldl1 (\s1@(n1,g1) s2@(n2,g2) ->
                      if average g1 >= average g2 then s1 else s2)

main :: IO ()
main = do
    putStrLn "\n=== Student Grade Analysis ==="
    
    putStrLn "\nAverage Grades:"
    mapM_ (\(name, grades) ->
        putStrLn (name ++ ": " ++ show (average grades))) students

    putStrLn "\nStudents with Distinction (>80):"
    mapM_ (\(name,_) -> putStrLn name) (distinction students)

    let (bestName, bestGrades) = topStudent students
    putStrLn ("\nTop-Performing Student: " ++ bestName ++
              " with average " ++ show (average bestGrades))
