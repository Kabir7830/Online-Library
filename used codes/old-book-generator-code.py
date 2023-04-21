# {% extends 'books.html' %}
# {% block  booksarea%}

# <script type="text/javascript">
    
    
#   let Length = Number("{{length}}");
#   let quo = Math.floor(Length/4);
#   let rem = (Length%4);
#   let total_groups = quo+rem;
#   let count = 0;
#   let group_number = 1;
#   let card;
#   let heading ;
#   let rect;
#   let image;
#   let card_group;
#   let breaktag = document.createElement("br");
#   let fiction=document.querySelector("div[id='id_fiction']");
#   document.write("{%for book in books%}")
#   // for (let i=1;i<=Number("{{length}}");i++)
#     if ("{{book.gener | lower}}" == "{{gener}}")
#   {
#     if ((count%5)==0)
#     {
        
#       card_group=document.createElement("div");
#       Object.assign(card_group, {className: 'card-group', style: 'margin-left:40px;', id: `card_group${group_number++}`});
      
#     }
#     card =document.createElement('div');
#     Object.assign(card, {className: 'card'});
    
#     heading = document.createElement("h3");
#     Object.assign(heading, {className: 'title'});
#     heading.innerText = "{{book.bookTitle}}";

#     rect = document.createElement('div');
#     Object.assign(rect, {className: 'rect'});

#     image = document.createElement('img');
#     Object.assign(image, {src: "/media/{{book.bookThumbnail}}",style:"width:150px;height:220px;"});

    
#     rect.appendChild(image);
#     card.appendChild(heading);
#     card.appendChild(rect);
#     card_group.appendChild(card);
#     fiction.append(breaktag)
#     fiction.appendChild(card_group);
    

#     count = count+1;
#   }
#   document.write("{%endfor%}")
    
# </script>

# {% endblock booksarea %}



