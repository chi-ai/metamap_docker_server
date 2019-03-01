#!/usr/bin/env python

from flask import Flask
from flask import request

from subprocess import Popen, PIPE, STDOUT
import sys


app = Flask(__name__)

@app.route('/form', methods = ['POST'])
def index():
    if request.form['args'] and request.form['input']:
        #p = Popen(['/opt/public_mm/bin/metamap16', '2>&1', request.form['args'], '| tee -a some_log' ], stdout=PIPE, stdin=PIPE, stderr=PIPE)
        _input = request.form['input'] 
        if not _input:
            return "Please provide input string!"

        _args = request.form['args']
        #_args = '-N -Q 4 -V USAbase -y --sldiID -f -A -j --silent -Q 4'
        if not _args:
            return "Please provide args!"

        p = Popen(['/opt/public_mm/bin/metamap16', _args], stdout=PIPE, stdin=PIPE, stderr=PIPE)
       
        sys.stderr.write("Arguments: " + _args)
        _input += "\n" #metamap waits for a new line at the end
        _input = _input.encode('utf-8').decode('unicode_escape')
        sys.stderr.write("Input stream to metamap: " + _input)

        outs = p.communicate(input=_input.encode())
        sys.stderr.write("Error stream: " + outs[1].decode())
        
        return outs[0].decode()

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True, port=8080) #run app in debug mode on port 5000
