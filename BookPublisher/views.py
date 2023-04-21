from django.shortcuts import render,redirect,HttpResponse, HttpResponseRedirect
from django.views.decorators.clickjacking import xframe_options_exempt
from rest_framework.renderers import TemplateHTMLRenderer
from rest_framework.response import Response
from rest_framework.views import APIView
from django.contrib import messages
from django.db.models import Q
from .models import *
import datetime
import random

#==================== Create ===================#


# adding a new book
def newBook(request):
    if not(request.user.is_authenticated):
        messages.warning(request,"please login to add books!")
        return render("/")
    if request.method=="POST":
        name = request.POST.get('name')
        bookTitle = request.POST.get('bookTitle')
        authorName = request.POST.get('authorName')
        bookThumbnail = request.FILES.get('bookThumbnail')
        gener = request.POST.get('gener')
        description = request.POST.get('description')
        bookpdf = request.FILES.get('bookpdf')
        releaseDate = request.POST.get('releaseDate')
        published = request.POST.get('published')
        try:
            book = Books.objects.create(
                name = name,
                bookTitle = bookTitle,
                authorName = authorName,
                bookThumbnail = bookThumbnail,
                gener = gener,
                description = description,
                bookpdf = bookpdf,
                releaseDate = releaseDate,
                publisher_id_id = request.user.id,
                published = published,
            )
            messages.success(request,"uploaded")
            return redirect("/")
        except Exception as e:
            print(e)
            messages.error(request,"something went wrong!")
            return redirect("/books/")
    return render(request,"add_book.html")



# Book Descripition 
def bookDescription(request,id):
    book = Books.objects.filter(id = id).first()
    user_liked_book = bookLikes.objects.filter(book_id = id).filter(user_id = request.user.id).first() 
    book_likes = bookLikes.objects.filter(book_id = id)
    likes = len(book_likes)
    recomendedBooks = Books.objects.filter(Q(gener__icontains = book.gener) | Q(authorName__icontains = book.authorName)).exclude(id = id)[:5]
    if not(recomendedBooks):
        recomendedBooks = Books.objects.all().exclude(id = id)
        recomendedBooks = random.sample(list(recomendedBooks),3)
    user_feedback = BookFeedback.objects.filter(book_id = id).filter(user_id = request.user.id).first()
    return render(request,"bookDescription.html",{"book":book,"recomendedBooks":recomendedBooks,"user_feedback":user_feedback,"gener":book.gener,"likes":likes,"user_liked_book":user_liked_book}) 



# Edit Book details
def editBook(request,book_id):
    book = Books.objects.filter(id = book_id).filter(publisher_id= request.user.id)
    if request.method == "POST":
        try:
            book.update(
                name = request.POST.get('name') if request.POST.get('name') else book.first().name,
                bookTitle = request.POST.get('bookTitle') if request.POST.get('bookTitle') else book.first().bookTitle,
                authorName = request.POST.get('authorName') if request.POST.get('authorName') else book.first().authorName,
                bookThumbnail = request.FILES.get('bookThumbnail') if request.FILES.get('bookThumbnail') else book.first().bookThumbnail,
                gener = request.POST.get('gener') if request.POST.get('gener') else book.first().gener,
                description = request.POST.get('description') if request.POST.get('description') else book.first().description,
                bookpdf = request.FILES.get('bookpdf') if request.FILES.get('bookpdf') else book.first().bookpdf,
                releaseDate = request.POST.get('releaseDate') if request.POST.get('releaseDate') else book.first().releaseDate,
                publisher_id = request.POST.get('publisher_id') if request.POST.get('publisher_id') else book.first().publisher_id,
                published = request.POST.get('published') if request.POST.get('published') else book.first().published,
            )
            messages.success(request,"updated")
            return redirect(f"/book-publisher/book/{book_id}/edit")
        except Exception as e:
            print(e)
            messages.error(request,"something went wrong!")
            return redirect(f"/book-publisher/book/{book_id}/edit")
    return render(request,"edit_book.html",{"book":book.first()})
    


# Delete Book 
def deleteBook(request,book_id):
    if request.user.is_authenticated:
        if request.method == "POST":
            book = Books.objects.filter(id = book_id).filter(publisher_id = request.user.id).first()

            book.delete()
            messages.success(request,"book deleted")
            return redirect("/mybooks")
        return HttpResponse("invalid path")
    else:
        return redirect("/user/login")



# Like a book
def bookLikesView(request):
    if request.user.is_authenticated:
        if request.method == "POST":
            user_id = request.POST.get('user_id')
            book_id = request.POST.get('book_id')
            like = bookLikes.objects.filter(user_id = user_id).filter(book_id = book_id).first()
            if like:
                like.delete()
                return redirect(f"/book-publisher/book/{book_id}/")
            else:
                bookLikes.objects.create(user_id_id = user_id, book_id_id= book_id)
                return redirect(f"/book-publisher/book/{book_id}/")
        else:
            return redirect(f"/book-publisher/book/{book_id}/")
    messages.warning(request,"Login required")
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))


# read book 
@xframe_options_exempt
def readBook(request,id):
    book = Books.objects.filter(id = id)
    return render(request,"read_book.html",{"book":book.first()})



# read book class
class Read_Book_API(APIView):
    renderer_classes = [TemplateHTMLRenderer]
    template_name = "read_book.html"
    
    @xframe_options_exempt
    def get(self,request,id):
        book = Books.objects.filter(id = id)
        books = Books.objects.filter(gener__icontains = book.first().gener).exclude(id = id)
        return Response({"book":book.first(),"books":books[0:2]})



# book feedback
def book_feedback(request,book_id):
    
    if not(request.user.is_authenticated):
        messages.warning(request,"login required!")
        return HttpResponseRedirect(request.META.get("HTTP_REFERER"))
    
    existing_feedback =BookFeedback.objects.filter(book_id = book_id).filter(user_id = request.user.id)
    book = Books.objects.filter(id=book_id ).first()
    

    if request.method == "POST":

        if book.publisher_id == request.user.id:
            messages.warning(request,"cannot send feedback to your own books!")
            return redirect(f"/book-publisher/book/{book_id}")
        try:
            if existing_feedback.exists():
                feedback = BookFeedback.objects.filter(book_id = book_id).filter(user_id = request.user.id).update(
                feedback =  request.POST['feedback'],
                feedback_date = datetime.date.today().__format__("%Y:%M:%D"),
            )
            else:    
                feedback = BookFeedback.objects.create(
                    book_id_id = book_id, 
                    user_id_id = request.user.id, 
                    feedback =  request.POST['feedback'],
                    is_opened = False,
                )
            messages.success(request,"feedback sent")
            return redirect(f"/book-publisher/book/{book_id}")
        except Exception as e:
            print(e)
            messages.error(request,"something went wrong!")
            return redirect(f"/book-publisher/book/{book_id}")



# get user feedbacks
def show_user_feedback(request):
    user_feedback = BookFeedback.objects.filter(book_id__publisher_id = request.user.id)
    return render(request,"feedback.html",{"user_feedback":user_feedback,"user_feedback_length":user_feedback.filter(is_opened = False).count()})



# marking feedback as read
def mark_feedback_read(request,feedback_id):
        user_feedback = BookFeedback.objects.filter(id = feedback_id).update(
            is_opened = True
        )
        
        messages.success(request,"message read")
        return redirect("/book-publisher/book/feedback/view")





