FROM python:3.9.0

WORKDIR /home/

RUN echo "asdgsfadsaf"

RUN git clone https://github.com/AISchool-SJH/GIS_4_2_Web.git

WORKDIR /home/GIS_4_2_Web/

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

EXPOSE 8000

CMD ["bash", "-c", "python manage.py collectstatic --noinput --settings=GI_4_2.settings.deploy && python manage.py migrate --settings=GI_4_2.settings.deploy && gunicorn --env DJANGO_SETTINGS_MODULE=GI_4_2.settings.deploy GI_4_2.wsgi --bind 0.0.0.0:8000"]