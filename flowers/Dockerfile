# IMAGE: docker build . -t ody55eus/flowers
FROM python:3.7

WORKDIR /root

RUN python -m pip install --upgrade pip
RUN pip install pytest kaggle
RUN pip install keras-preprocessing numpy pandas scikit-learn scipy seaborn tensorboard tensorflow>=2.2 tensorflow-probability opencv-python pydot==1.2.3 jupyterlab
RUN mkdir data && cd data
RUN mkdir data1 && cd data1
RUN kaggle datasets download mgornergoogle/five-flowers
RUN cd ..
RUN mkdir data2 && cd data2
RUN kaggle datasets download ianmoone0617/flower-goggle-tpu-classification
RUN cd data/data1
RUN unzip five-flowers.zip && rm five-flowers.zip
RUN cd ../data2
RUN unzip flower-goggle-tpu-classification.zip
RUN rm flower-goggle-tpu-classification.zip

WORKDIR /root

