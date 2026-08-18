```
cd OctoPrint
virtualenv venv
source venv/bin/activate
pip install -e '.[develop,plugins]'
octoprint serve

# To exit
deactivate
```