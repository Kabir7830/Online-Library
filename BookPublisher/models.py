from django.db import models
from user.models import User
# id
# Name
# Book Title
# Book ThumbNail
# Author name
# Gener
# Description
# released Date

class Books(models.Model):
    name = models.CharField(max_length = 75)
    bookTitle = models.CharField(max_length=500)
    authorName = models.CharField(max_length = 75)
    bookThumbnail = models.FileField( blank=True,upload_to = 'bookthumbnails/')
    gener = models.CharField(max_length = 30)
    description = models.TextField()
    bookpdf = models.FileField(null=False,upload_to = 'book-pdfs/')
    releaseDate = models.CharField(max_length = 20)
    publisher_id = models.ForeignKey(User,on_delete=models.CASCADE)
    published = models.BooleanField(default=True,blank=True,choices=((True,'publish'),(False,'Save Draft')),max_length=5)

class bookLikes(models.Model):

    book_id = models.ForeignKey(Books,on_delete=models.CASCADE)
    user_id = models.ForeignKey(User,on_delete=models.CASCADE)


class BookFeedback(models.Model):

    class Meta:
        db_table = "BookFeedback"

    book_id = models.ForeignKey(Books,on_delete=models.CASCADE)
    user_id = models.ForeignKey(User,on_delete=models.CASCADE)
    feedback = models.TextField()
    feedback_date = models.DateField(null=True,blank=True)
    is_opened = models.BooleanField()