# Generated by Django 4.1 on 2023-04-12 11:53

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0002_user_country_user_phone_number_user_profile'),
        ('BookPublisher', '0003_alter_books_booktitle'),
    ]

    operations = [
        migrations.AlterField(
            model_name='books',
            name='publisher_id',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='user.user'),
        ),
    ]