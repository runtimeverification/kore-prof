module Main where
import Turtle
--import GHC.IO.Encoding (setLocaleEncoding)
import System.IO (latin1)
import qualified Turtle.Bytes as TB
import qualified KoreProf
import System.Environment (withArgs, withProgName)
import Control.Exception (bracket)

testProfSpeedscopeEventlog :: IO ()
testProfSpeedscopeEventlog =
  bracket (TB.output elTempName $ TB.inproc "tar" ["-O", "-xzf", "test/smoketest/example.eventlog.tgz"] mempty)
          (\_ -> rm elTempName)
          (\_ -> TB.output "test/smoketest/test-prof-speedscope.sh.out" withProgName "kore-prof" $ withArgs [elTempName] KoreProf.main)

elTempName :: String
elTempName = "test-prof-speedscope-eventlog"

main :: IO ()
main = do
--  setLocaleEncoding latin1
  testProfSpeedscopeEventlog
  putStrLn $ "done"
