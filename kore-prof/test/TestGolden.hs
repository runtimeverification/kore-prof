module Main where
import Turtle
import GHC.IO.Encoding (setLocaleEncoding)
import System.IO (latin1)

testProfSpeedscopeEventlog :: IO ()
testProfSpeedscopeEventlog = do
  output "test-prof-speedscope-eventlog" $ inproc "tar" ["-O", "-xzf", "test/prof-smoketest/example.eventlog.tgz"] mempty

main :: IO ()
main = do
  setLocaleEncoding latin1
  testProfSpeedscopeEventlog
