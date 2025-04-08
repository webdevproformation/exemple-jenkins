from flask import Flask , render_template

app = Flask(__name__)

@app.route("/")
def hello_world():
    formation = "Découverte Python Docker et Flask"
    # return "<p>Bonjour les amis !!! comment allez vous ?? </p>"
    return render_template("index.html", formation=formation)

if __name__ == "__main__" :
    app.run(host="0.0.0.0" , port=8082, debug=True )

# http://127.0.0.1:8082