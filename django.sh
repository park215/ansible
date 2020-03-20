#!/bin/bash
#fun django tutorial https://data-flair.training/blogs/django-migrations-and-database-connectivity/

yum -y install python-pip python-devel gcc postgresql-devel postgresql-contrib
pip install --upgrade pip
pip install virtualenv
mkdir /opt/nti310
cd /opt/nti310
virtualenv nti310env
source nti310env/bin/activate
pip install django psycopg2
django-admin.py startproject nti310 .
#vim /opt/nti310/nti310/setting.py
perl -i -0pe "BEGIN{undef $/;} s/        'ENGINE':.*db.sqlite3'\),/        'ENGINE': 'django.db.backends.postgresql_psycopg2',\n        'NAME': 'nti310',\n        'USER': 'nti310user',\n        'PASSWORD': 'password',\n        'HOST': 'postgres2',\n        'PORT': '5432',/smg" /opt/nti310/nti310/settings.py

python manage.py startapp Cars
echo "class Specs(models.Model):
    name = models.CharField(max_length = 20)
    price = models.DecimalField(max_digits=8, decimal_places=2)
    weight = models.PositiveIntegerField()" >> Cars/models.py
  
# put sed into the INSTALLED_APPS variable
sed -i "40i \ \ \ \ 'Cars'," nti310/settings.py

python manage.py makemigrations Cars
python manage.py migrate Cars
python manage.py runserver 0.0.0:8000
python manage.py makemigrations
python manage.py migrate

echo "*.info;mail.none;authpriv.none;cron.none   @10.128.15.5" >> /etc/rsyslog.conf && systemctl restart rsyslog.service
