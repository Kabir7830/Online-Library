from django.shortcuts import render

# Create your views here.
def Admin_Login(request):
    return render(request,"admin_login.html")