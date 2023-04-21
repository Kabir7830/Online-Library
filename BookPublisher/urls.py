from django.conf.urls.static import static
from django.conf import settings
from django.urls import path
from . import views

urlpatterns = [
    
    path("new-book/",views.newBook),
    path("book/<int:id>/",views.bookDescription),
    path("book/<int:book_id>/feedback",views.book_feedback),
    path("book/<int:feedback_id>/feedback/mark-read",views.mark_feedback_read),
    path("book/feedback/view",views.show_user_feedback),
    path("book/<int:id>/read",views.Read_Book_API.as_view()),
    path("book/<int:book_id>/edit",views.editBook),
    path("book/<int:book_id>/delete",views.deleteBook),
    path("book/like/",views.bookLikesView),
    
]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
