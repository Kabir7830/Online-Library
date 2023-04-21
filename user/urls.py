from django.urls import path
from . import views

urlpatterns = [
    path("login",views.userLogin),
    path("signup",views.signUpUser),
    path("<int:user_id>/logout",views.logoutUser),
    path("<int:user_id>/edit",views.editUser),
    path("<int:user_id>/delete",views.deleteUser),
    path("forgot-password",views.forgot_password),
    path("reset-password",views.reset_password)
 
]
