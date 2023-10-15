import Euler1
import Euler30
import Test.HUnit (Test (..), assertEqual, runTestTTAndExit)

-----------------------------------------------------------------------------------------

main :: IO ()
main = runTestTTAndExit tests

-----------------------------------------------------------------------------------------

euler1Rec :: Test
euler1Rec = TestCase (assertEqual "Test assert euler1Rec" (findSumMultiplies3or5below_rec 1000) 233168)

euler1Tail :: Test
euler1Tail = TestCase (assertEqual "Test assert euler1Tail" (findSumMultiplies3or5below_tail 1000) 233168)

euler1Map :: Test
euler1Map = TestCase (assertEqual "Test assert euler1Map" (findSumMultiplies3or5below_map 1000) 233168)

euler1ListGen :: Test
euler1ListGen = TestCase (assertEqual "Test assert euler1ListGen" (findSumMultiplies3or5below_listgen 1000) 233168)

euler1InfList :: Test
euler1InfList = TestCase (assertEqual "Test assert euler1InfList" (findSumMultiplies3or5below_inflist 1000) 233168)

-----------------------------------------------------------------------------------------

euler30Rec :: Test
euler30Rec = TestCase (assertEqual "Test assert euler30Rec" (solveRec 5 1000000) 443839)

euler30Tail :: Test
euler30Tail = TestCase (assertEqual "Test assert euler30Tail" (solveRecTail 5 1000000) 443839)

euler30Map :: Test
euler30Map = TestCase (assertEqual "Test assert euler30Map" (solveMap 5 1000000) 443839)

euler30ListGen :: Test
euler30ListGen = TestCase (assertEqual "Test assert euler30ListGen" (solveListGen 5 1000000) 443839)

euler30InfList :: Test
euler30InfList = TestCase (assertEqual "Test assert euler30Inflist" (solveInfList 5 1000000) 443839)

tests :: Test
tests =
  TestList
    [ TestLabel "euler1_rec" euler1Rec,
      TestLabel "euler1_tail" euler1Tail,
      TestLabel "euler1_map" euler1Map,
      TestLabel "euler1_listgen" euler1ListGen,
      TestLabel "euler1_inflist" euler1InfList,
      TestLabel "euler30_rec" euler30Rec,
      TestLabel "euler30_tail" euler30Tail,
      TestLabel "euler30_map" euler30Map,
      TestLabel "euler30_listgen" euler30ListGen,
      TestLabel "euler30_inflist" euler30InfList
    ]
