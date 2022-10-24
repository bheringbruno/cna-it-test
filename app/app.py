from flask import Flask
app = Flask(__name__)
result = {'Health': 'UP', 'Status': '200'}

@app.route('/')
def hello_world():
    return 'Hello, World!'

@app.route('/health')
def health():
    return result, 200

if __name__ == '__main__':
    app.run()
