from django.contrib.auth.models import User as UserModel
from django.conf import settings
from django.db import models



class User(UserModel):
    security_question1 = (
        ('what is the name of your first pet','what is the name of your first pet'),
        ('what is the name of your birth place','what is the name of your birth place'),
        ('what is the name of place where you live','what is the name of place where you live'),
    )

    security_question2 = (
        ('what is the name of your first school','what is the name of your first pet'),
        ('what is the name of your friend','what is the name of your friend'),
        ('what is your favourite color','what is your favourite color'),
    )

    security_question1 = models.CharField(max_length=150 , choices=security_question1)
    security_question1_value = models.CharField(max_length=50)
    security_question2 = models.CharField(max_length=150, choices= security_question2)
    security_question2_value = models.CharField(max_length=50)
    is_admin = models.BooleanField(default=False,blank=True)
    phone_number = models.CharField(max_length=12,null=True,blank=True)
    profile = models.FileField(upload_to='user/profiles',blank=True,null=True)
    country = models.CharField(max_length=100,null=True,blank=True)


class User_Reviews(models.Model):
    class Meta:
        db_table = "User_Reviews"

    user_id = models.ForeignKey(User,on_delete=models.CASCADE)
    review = models.TextField()


# class Forgot_Passowrd(models.Model):

    


