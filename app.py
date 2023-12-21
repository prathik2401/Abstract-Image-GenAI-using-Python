from flask import Flask, send_file
import main_gen  # Import your code

app = Flask(__name__)

@app.route('/')
def generate_image():
    # Call your draw function
    seed_value = main_gen.draw(3000, 2000, color=main_gen.random.randint(10, 500), perlinFactorW=4, perlinFactorH=5, step=main_gen.random_float_scaled)
    
    # Return the generated image to the browser
    return send_file('image_{}.jpg'.format(seed_value), mimetype='image/png')

if __name__ == '__main__':
    app.run(debug=True)
