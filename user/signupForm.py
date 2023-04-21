from  .models import User
from django import forms
from django.forms.widgets import TextInput,PasswordInput

class User_Form(forms.ModelForm):
    class Meta:
        model = User
        fields = [
            "first_name",
            "last_name",
            "username",
            "email",
            "password",
            "security_question1",
            "security_question2",
            "security_question2_value",
            "security_question1_value",
            "is_admin",
        ]
        widgets = {
            "first_name":TextInput(attrs={"placeholder":"First Name","class":"firstName"}),
            "last_name":TextInput(attrs={"placeholder":"Last Name","class":"lastName"}),
            "email":TextInput(attrs={"placeholder":"example@gmail.com","class":"email"}),
            "username":TextInput(attrs={"placeholder":"Username","username":"userName"}),
            "password":PasswordInput(attrs={"placeholder":"password","class":"password"}),
        }


class userEditForm(forms.ModelForm):
    class Meta:
        model = User
        fields = [
            "first_name",
            "last_name",
            "username",
            "email",
        ]
        widgets = {
            "first_name":TextInput(attrs={"placeholder":"First Name","class":"form-control"}),
            "last_name":TextInput(attrs={"placeholder":"Last Name","class":"form-control"}),
            "email":TextInput(attrs={"placeholder":"example@gmail.com","class":"form-control"}),
            "username":TextInput(attrs={"placeholder":"Username","username":"form-control"}),
        }

