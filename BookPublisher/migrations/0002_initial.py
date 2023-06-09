# Generated by Django 4.1 on 2023-04-12 11:34

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('user', '0001_initial'),
        ('BookPublisher', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='booklikes',
            name='user_id',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='user.user'),
        ),
        migrations.AddField(
            model_name='bookfeedback',
            name='book_id',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='BookPublisher.books'),
        ),
        migrations.AddField(
            model_name='bookfeedback',
            name='user_id',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='user.user'),
        ),
    ]
