import os
from flask import Flask, jsonify, request

import pandas as pd

app = Flask(__name__)

# to solve the problem "AttributeError: 'Request' object has no attribute 'is_xhr'"
app.config['JSONIFY_PRETTYPRINT_REGULAR'] = False

@app.route('/')
def Welcome():
    print('Now, this function welcome is called!')
    return app.send_static_file('index.html')
@app.route('/test')
def test():
    print('Now, this function test is called!')
    message =  {'test': os.environ['TEST']}
    return jsonify(message)

port = os.getenv('PORT', '5000')
if __name__ == "__main__":
	app.run(host='0.0.0.0', port=int(port))
