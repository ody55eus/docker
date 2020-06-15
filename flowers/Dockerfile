# IMAGE: docker build . -t ody55eus/flowers
FROM python:3.7

WORKDIR /root

# Add Kaggle API
ADD kaggle.json /root/.kaggle/kaggle.json
RUN chmod 600 /root/.kaggle/kaggle.json

# Install Python Requirements
RUN python -m pip install --upgrade pip
RUN pip install pytest kaggle
RUN pip install keras-preprocessing numpy pandas scikit-learn scipy seaborn tensorboard tensorflow>=2.2 tensorflow-probability opencv-python pydot==1.2.3 jupyterlab PIL

# Download images from Kaggle
RUN mkdir data && cd data
RUN mkdir data1 && cd data1
RUN kaggle datasets download mgornergoogle/five-flowers
RUN unzip five-flowers.zip && rm five-flowers.zip
RUN cd ..
RUN mkdir data2 && cd data2
RUN kaggle datasets download ianmoone0617/flower-goggle-tpu-classification
RUN unzip flower-goggle-tpu-classification.zip && rm flower-goggle-tpu-classification.zip

# Delete Kaggle API Key
RUN rm /root/.kaggle/kaggle.json

WORKDIR /root

