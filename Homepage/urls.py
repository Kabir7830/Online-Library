from django.contrib import admin
from django.urls import path
from . import views
urlpatterns = [
   path("",views.display_Books), 
   path("books/",views.display_Books), 
   path("books/all",views.display_all_books), 
   path("book-gener/<str:gener>/",views.bookGener), 
   path("search/",views.searchBook), 
   path("my-liked-books/",views.myLikedBooks), 
]
