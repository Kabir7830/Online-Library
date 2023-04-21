
from django import forms
from .models import *
from django.forms.widgets import *
from django.forms import TextInput
class bookPublisherForm(forms.ModelForm):
    class Meta:
        model = Books
        fields = [
            "name",
            "authorName",
            "releaseDate",
            "bookThumbnail",
            "bookTitle",
            "gener",
            "description",
            "bookpdf",
            "publisher_id",
            "published",
        ]


class bookEditForm(forms.ModelForm):
    class Meta:
        model = Books
        fields = [
            "name",
            "authorName",
            "releaseDate",
            "bookThumbnail",
            "bookTitle",
            "gener",
            "description",
            "bookpdf",
            "published",
        
        ]


class likeForm(forms.ModelForm):
    class Meta:
        model = bookLikes
        fields = [
            "book_id",
            "user_id",
        ]