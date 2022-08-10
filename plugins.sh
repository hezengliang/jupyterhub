#!/bin/bash
echo "Installing jupyter plugins"

# jupyter extensions
jupyter labextension install @jupyterlab/hub-extension
jupyter serverextension enable --py jupyterlab --sys-prefix

# jupyterlab_code_formatter
pip install jupyterlab-code-formatter
pip install black isort

# nbdime
pip install nbdime

# jupyterlab-git
pip install --upgrade jupyterlab jupyterlab-git

# ipywidgets
pip install ipywidgets

# jupyterlab-github
pip install jupyterlab-github
jupyter server extension enable jupyterlab_github

# Collapsible_Headings
pip install aquirdturtle_collapsible_headings
