from django.contrib.auth import login,logout,authenticate
from django.shortcuts import redirect,render,HttpResponse
from BookPublisher.models import Books
from django.contrib import messages
from .models import User




# activae or create user
def signUpUser(request):
    if request.method == "POST":
        password = request.POST.get('password')

        try:
            username = request.POST.get('username')
            email = request.POST.get('email')
            password = request.POST.get('password')
            first_name = request.POST.get('first_name')
            last_name = request.POST.get('last_name')
            security_question1 = request.POST.get('security_question1')
            security_question2 = request.POST.get('security_question2')
            security_question2_value = request.POST.get('security_question2_value')
            security_question1_value = request.POST.get('security_question1_value')
            user = User.objects.create(username=username if request.POST.get('username') else "null",
                                            email=email,
                                            security_question1 = security_question1,
                                            security_question2 = security_question2,
                                            security_question1_value = security_question1_value,
                                            security_question2_value = security_question2_value,
                                            phone_number = request.POST.get('phone_number') if request.POST.get('phone_number') else "null",
                                            country = request.POST.get('country') if request.POST.get('country') else "null",
                                            profile = request.FILES.get('profile') if request.FILES.get('profile') else "null", 
                )
            user.first_name = first_name
            user.last_name = last_name
            user.is_active = True
            user.set_password(password)
            user.save()
            print(user.id)
            return Login(request,email,password)
        except Exception as e:
            print(e)
            messages.error(request,"something went wrong")
            return redirect("/user/signup")
    return render(request,"user_signup.html")



# login user
def userLogin(request):
    if request.method == "POST":
        email = request.POST.get('email')
        password = request.POST.get('password')

        user = authenticate(request,email=email,password=password)
        if user is not None:
            login(request,user)
            messages.success(request,"Logged In")
            return redirect("/")
        messages.error(request,"Wrong Email or Password!")
    return render(request,"login.html")



# login directly after signup
def Login(request,email,password):
    user = authenticate(request,email=email,password=password)
    if user is not None:
        login(request,user)
        messages.success(request,"Logged In")
        return redirect("/")



# logout user
def logoutUser(request,user_id):
    if user_id == request.user.id:
        if request.method == "POST":
            logout(request)
            messages.success(request,"logged Out")
            return redirect("/")
    return HttpResponse("invalid path")



# delete user
def deleteUser(request,user_id):
    if request.method == "POST":
        user = User.objects.filter(user_id = user_id).first()
        user2 = User.objects.filter(id = user_id).first()
        if not(user) or not(user2):
            messages.error(request,"no such user exists")
        user.delete()
        user2.delete()
        messages.success(request,"account delete permanently")
        return redirect("/")
    return HttpResponse("Invalid Path")



# edit user details
def editUser(request,user_id):
    user = User.objects.filter(user_ptr_id=user_id)
    if request.method == 'POST':
        user.update(
            username = request.POST['username'] if request.POST['username'] else user.first().username,
            email = request.POST['email'] if request.POST['email'] else user.first().email,
            first_name = request.POST['first_name'] if request.POST['first_name'] else user.first().first_name,
            last_name = request.POST['last_name'] if request.POST['last_name'] else user.first().last_name,
            phone_number = request.POST.get('phone_number') if request.POST.get('phone_number') else "null",
            country = request.POST.get('country') if request.POST.get('country') else user.first().country,
            profile = request.FILES.get('profile') if request.FILES.get('profile') else user.first().profile, 
        )
        messages.success(request,"updated")
        return redirect(f"/user/{user_id}/edit")
    return render(request,"edit_user.html",{"user":user.first()})



# showing books added by particular user
def myBooks(request):
    if request.user.is_anonymous:
        return redirect("/user/login")
    books = Books.objects.filter(publisher_id=request.user.id).filter(published = True)
    draftbooks=Books.objects.filter(publisher_id=request.user.id).filter(published = False)
    return render(request,"myBooks.html",{"books":books,"draftbooks":draftbooks})
        


# checking if user is genunin by security questions
def forgot_password(request):
    if request.method == "POST":
        email = request.POST.get('email')
        security_question1 = request.POST.get('security_question1')
        security_question2 = request.POST.get('security_question2')
        security_question1_value = request.POST.get('security_question1_value')
        security_question2_value = request.POST.get('security_question2_value')
        
        user = User.objects.filter(email = email).first()
        if user is None:
            messages.error(request,"user do not exists")
            return redirect("/user/forgot-password")
        if user.security_question1 == security_question1 and user.security_question1_value == security_question1_value and user.security_question2==security_question2 and user.security_question2_value == security_question2_value:
            return render(request,"forgot_password.html",{"value":True,"email":email})
        else:
            messages.error(request,"wrong email or security questions! Please try again.")
            return redirect("/user/forgot-password")
    return render(request,"forgot_password.html")
            # return redirect("user/reset-password")



# resetting user password 
def reset_password(request):
    if request.method == "POST":
        new_password = request.POST.get('password')
        email = request.POST.get('email')
        print("email = ",email)
        print("password = ",new_password)
        user = User.objects.filter(email=email).first()
        print(user)
        auth_user = User.objects.filter(email = email).first()
        user.password = new_password
        auth_user.set_password(new_password)
        user.save()
        auth_user.save()
        messages.success(request,"password updated")
        return redirect("/")
    messages.error(request,"inavlid request")
    return redirect("/")



      

"""

changed in actual model in django lib

django-->contrib-->auth-->models


under User

email field modifeid to unique true and blank removed 
username filed unique true removed
USERNAME_FIELD set to email
"""