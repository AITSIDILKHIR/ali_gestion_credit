# Generated by Django 3.2.16 on 2023-02-23 19:51

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app1', '0010_credits_durée'),
    ]

    operations = [
        migrations.AddField(
            model_name='credits',
            name='etat_credit',
            field=models.TextField(default='non reglé'),
        ),
    ]
