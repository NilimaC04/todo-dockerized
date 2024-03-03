FROM ubuntu

COPY . . 

RUN apt update -y 
RUN apt install pip -y 
RUN python3 -m pip install Django==5.0.2 
RUN python3 manage.py makemigrations 
RUN python3 manage.py migrate  
RUN python3 manage.py createsuperuser

EXPOSE 8000
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
