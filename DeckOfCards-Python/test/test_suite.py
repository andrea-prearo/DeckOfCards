import unittest
import sys, os
sys.path.append(os.path.dirname(os.path.realpath(__file__)) + "/../src")
from card_tests import TestCard
from deck_tests import TestDeck

def suite():
    return unittest.TestSuite((
        unittest.makeSuite(TestCard),
        unittest.makeSuite(TestDeck)))

if __name__ == "__main__":
    unittest.TextTestRunner(verbosity=2).run(suite())
