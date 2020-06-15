# IMAGE: docker build . -t ody55eus/flowers
FROM python:3.7

WORKDIR /root

ADD kaggle.json
RUN <<EOR
        python -m pip install --upgrade pip
        pip install pytest kaggle
        pip install keras-preprocessing numpy pandas scikit-learn scipy seaborn tensorboard tensorflow>=2.2 tensorflow-probability opencv-python pydot==1.2.3 jupyterlab
        mkdir data && cd data
        mkdir data1 && cd data1
        kaggle datasets download mgornergoogle/five-flowers
        cd ..
        mkdir data2 && cd data2
        kaggle datasets download ianmoone0617/flower-goggle-tpu-classification
        cd data/data1
        unzip five-flowers.zip && rm five-flowers.zip
        cd ../data2
        unzip flower-goggle-tpu-classification.zip
        rm flower-goggle-tpu-classification.zip
EOR

WORKDIR /root

