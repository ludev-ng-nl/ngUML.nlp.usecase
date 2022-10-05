<h1 align="center">
  ngUML.nlp.usecase
</h1>
<p align="center">Models for the extraction of UML Use Case metadata out of natural language.</p>

## ⚡️ Quick start

> ☝️ This project presumes you are running a POSIX-based system.

First, [download](https://www.python.org/downloads/) and install **Python**. Version `3.8` or higher is required.
You might need to additionally download or add [the `venv` module](https://docs.python.org/3/library/venv.html), 
you can test this with the command: `python -m venv --help` or `python3 -m venv --help`.

```bash
# Start in an empty directory
mkdir -p usecase-app & cd usecase-app

# Create and activate virtual environment
python -m venv venv
source venv/bin/activate

# Install spacy and wheel
pip install spacy wheel

# Install the models
pip install https://github.com/ludev-ng-nl/nguml.nlp.usecase/releases/download/1.0.0/en_nguml_nlp_usecase_ner-1.0.0-py3-none-any.whl
pip install https://github.com/ludev-ng-nl/nguml.nlp.usecase/releases/download/1.0.0/en_nguml_nlp_usecase_rel-1.0.0-py3-none-any.whl
```

Use the models:

```python
import en_nguml_nlp_usecase_rel
import en_nguml_nlp_usecase_ner

usecase_rel_nlp = en_nguml_nlp_usecase_rel.load()
usecase_ner_nlp = en_nguml_nlp_usecase_ner.load()
```

## ⚙️ Development

...