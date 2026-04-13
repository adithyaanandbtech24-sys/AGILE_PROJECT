import unittest
from app import app

class TestCivicHubAPI(unittest.TestCase):

    def setUp(self):
        """Set up test client before each test."""
        self.app = app.test_client()
        self.app.testing = True

    def test_home_endpoint(self):
        """Test the home endpoint returns 200 and correct message."""
        response = self.app.get('/')
        self.assertEqual(response.status_code, 200)
        self.assertIn(b'Welcome to the Civic Hub API', response.data)

    def test_get_all_contacts(self):
        """Test fetching all contacts."""
        response = self.app.get('/contacts')
        self.assertEqual(response.status_code, 200)
        self.assertIn(b'bescom', response.data)

    def test_get_specific_contact(self):
        """Test fetching a valid specific contact."""
        response = self.app.get('/contacts/bbmp')
        self.assertEqual(response.status_code, 200)
        self.assertIn(b'1533', response.data)

    def test_get_invalid_contact(self):
        """Test fetching an invalid contact returns 404."""
        response = self.app.get('/contacts/invalid_dept')
        self.assertEqual(response.status_code, 404)

if __name__ == '__main__':
    unittest.main()
