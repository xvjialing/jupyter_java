FROM jupyter/scipy-notebook:ubuntu-20.04
USER root

RUN apt-get update && \
	apt-get install --no-install-recommends -y openjdk-13-jdk wget unzip && \
	wget https://github.com/SpencerPark/IJava/releases/download/v1.3.0/ijava-1.3.0.zip && \
	mkdir -p ijava-1.3.0 && \
	unzip -o ijava-1.3.0.zip -d ijava-1.3.0 && \
	cd ijava-1.3.0 && \
	python3 install.py && \
	cd .. && \
	rm -rf ijava-1.3.0.zip ijava-1.3.0 && \
	apt-get remove -y wget unzip && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

USER ${NB_UID}
