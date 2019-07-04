FROM python:3.6.6

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y bash python3 python3-pip python3-dev && \
    apt-get install -y --no-install-recommends sudo vim unzip && \
    apt-get install -y mecab libmecab-dev mecab-ipadic-utf8 && \
    apt-get install -y fonts-ipaexfont && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY requirements/ /tmp
RUN pip install --upgrade pip
RUN pip3 install -r /tmp/jupyter.txt

# Install jupyter lab extension
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get install -y nodejs
## table index
RUN jupyter labextension install @jupyterlab/toc
## plotly
RUN jupyter labextension install @jupyterlab/plotly-extension
## for tqdm
RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension
RUN jupyter labextension install ipyvolume
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager
# variable inspector
RUN jupyter labextension install @lckr/jupyterlab_variableinspector
# jump to definition via alt + click
RUN jupyter labextension install @krassowski/jupyterlab_go_to_definition

WORKDIR /work 
