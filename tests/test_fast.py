from fastapi.testclient import TestClient
from apiannegit import app  # Replace 'apiannegit' with the actual name of your Python file if it's different

client = TestClient(app)

def test_index():
    response = client.get('/')
    assert response.status_code == 200
    assert response.json() == {'message': 'Hello, stranger, from GitHub actions'}

def test_get_name():
    response = client.get('/John')
    assert response.status_code == 200
    assert response.json() == {'message': 'Hello, John'}

    response = client.get('/Jane')
    assert response.status_code == 200
    assert response.json() == {'message': 'Hello, Jane'}
