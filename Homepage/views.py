from django.shortcuts import render,redirect
from BookPublisher.models import Books as  bookPublisher,bookLikes
from django.db.models import Q
from django.contrib import messages
from django.core.paginator import Paginator
from BookPublisher.models import BookFeedback
from django.db.models import Count
def display_homepage(request):
    return render(request,"homepage.html")

def display_Books(request):
    books1 = bookPublisher.objects.filter(published=True)
    books_like = bookLikes.objects.annotate(books_count=Count('book_id')).order_by('-book_id')
    user_feedback = BookFeedback.objects.filter(book_id__publisher_id = request.user.id).filter(is_opened = False)
    length = 5
    return render(request,"extend_book.html",{"books":books1[0:5],"length":length,"user_feedback":user_feedback,"user_feedback_length":user_feedback.count(),"fiction_books":books1.filter(gener__icontains = "fiction"),"thriller_books":books1.filter(gener__icontains = "thriller"),"trending_books":books_like[0:5]})

def bookGener(request,gener):
    books = bookPublisher.objects.filter(gener = gener)
    length = len(books)
    return render(request,"book_gener.html",{"books":books,"gener":gener,"length":length})


def searchBook(request):
    query = request.GET.get('query')
    queryName = query # this is to show actual typed query 
    gener_dict = {"si-fi":"science fiction"} # if searched abrivated words change them to original
    for gener in gener_dict:
        if query == gener:
            query = gener_dict[gener]
            break
    # books1 = bookPublisher.objects.all() # sending all books to html then filtering books using JS
    books1 = bookPublisher.objects.filter(Q(gener__icontains=query) | Q(authorName__icontains=query) | Q(name__icontains=query) | Q(bookTitle__icontains=query))
    print(books1)
    p = Paginator(books1, 20)
    page_number = request.GET.get('page')
    books = p.get_page(page_number)
    return render(request,"search_page.html",{"books":books,"query":query,"queryName":queryName})



def myLikedBooks(request):

    liked_books = bookLikes.objects.filter(user_id = request.user.id)
    books = []
    for book in liked_books:
        books.append(bookPublisher.objects.filter(id = book.book_id_id))

    return render(request,"myLikedBooks.html",{"books":books})    


def display_all_books(request):
    books1 = bookPublisher.objects.filter(published=True)
    user_feedback = BookFeedback.objects.filter(book_id__publisher_id = request.user.id).filter(is_opened = False)
    p = Paginator(books1, 10)
    page_number = request.GET.get('page')
    books = p.get_page(page_number)
    length = len(books)
    return render(request,"all_books.html",{"books":books,"length":length,"user_feedback":user_feedback,"user_feedback_length":user_feedback.count()})


