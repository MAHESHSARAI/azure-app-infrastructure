from flask import Flask, jsonify
import os

app = Flask(__name__)

@app.route('/api/secure-data', methods=['GET'])
def get_secure_data():
    private_key = os.getenv('API_PRIVATE_KEY')
    if not private_key:
        return jsonify({"error": "API private key not found"}), 500

    secure_data = {"message": "Secure data accessed using private key", "private_key": private_key}
    return jsonify(secure_data)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
