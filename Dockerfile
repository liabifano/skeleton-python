FROM python:3.6.6

COPY setup.py /skeleton/
COPY requirements.txt /skeleton/
COPY src/ /skeleton/src/

RUN find . | grep -E "(__pycache__|\.pyc$)" | xargs rm -rf
RUN pip install -U -r job-skeleton/requirements.txt
RUN pip install skeleton/.
