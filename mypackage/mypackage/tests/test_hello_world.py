from unittest import TestCase

import mypackage

class SampleTest(TestCase):
    def test_is_none(self):
        self.assertIsNone(mypackage.hello_world.greeting())

