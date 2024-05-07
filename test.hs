import Test.HUnit
import Parcial

main = runTestTT tests

tests = test [
    "lista vacia" ~: (hayQueCodificar 'f' []) ~?= False,
    "es el primero" ~: (hayQueCodificar 'f' [('f','l'),('o','r')]) ~?= True,
    "es el segundo" ~: (hayQueCodificar 'o' [('f','l'),('o','r')]) ~?= True,
    "no es ninguno" ~: (hayQueCodificar 'k' [('f','l'),('o','r')]) ~?= False,

    "lista vacia" ~: (cuantasVecesHayQueCodificar 'f' [] [('c','g'),('h','l')]) ~?= 0
    
      ]