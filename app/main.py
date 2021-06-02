from flask import Flask, render_template
import json

app = Flask(__name__)


def readJson():
    with open('./conf/config.json') as config:
        return json.load(config)


@app.route("/")
def main():
    texts = readJson()

    return render_template('index.html', texts=texts)


@app.route('/health')
def health():
    return "OK"


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080, debug=True, threaded=True)
