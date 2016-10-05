function fetchIdeas(){
  $.ajax({
    method: "GET",
    url: "http://localhost:3000/api/v1/ideas"
  }).then(collectIdeas)
    .then(renderIdeas)
}

function createIdea(){
  $("#idea-form").on('click', '#create-idea', function(){
    var ideaParams = {
      idea: {
        title: $("#idea-title").val(),
        body: $("#idea-body").val()
      }
    }
      $.ajax({
        url: "http://localhost:3000/api/v1/ideas",
        data: ideaParams,
        type: "POST"
      }).then(createIdeaHTML)
        .then(renderIdeas)
  });
}

function deleteIdea(){
  $("#ideas").on("click", "#delete-idea", function(){
    var $idea = $(this).closest(".idea");
    $.ajax({
      url: "http://localhost:3000/api/v1/ideas/" + $idea.data("id") + ".json",
      type: "delete"
    }).then(function(){
      $idea.remove()
    })
  });
}

// function updateIdea(){
//   $("#ideas").on('click', "#edit-idea", function(){
//     var $idea = $(this).closest(".idea");
//     return $("hi")

    // return $('<input id="idea-title" type="text" name="first_name" placeholder="Title" maxlength="100" />'
    //   + '<input id="idea-title" type="text" name="first_name" placeholder="Title" maxlength="100" />'
    //   + '<br />'
    //   + '<input id="idea-body" type="text" name="last_name" placeholder="Body" maxlength="100" />'
    //   + '<br />'
    //   + '<button id="create-idea" type="button" name="button">Create Idea</button>'
    // )
  // });
// }

function collectIdeas( ideaData ){
  return ideaData.map(createIdeaHTML);
}

function createIdeaHTML( idea ){
  return $("<div class='idea' data-id='"
    + idea.id
    + "'><p>Title: "
    + idea.title
    + "</p><p>Description: "
    + idea.body
    + "</p>"
    + "<p>Quality: "
    + idea.quality
    + "</p>"
    + "<input type='image' id='like' value='like' src='' />"
    + "<input type='image' id='dislike' value='dislike' src='' />"
    + "<button id='delete-idea' name='button-fetch'>Delete</button>"
    + "<button id='edit-idea' name='button-fetch'>Edit</button>"
    + "</div>"
  )
}

function renderIdeas( ideaData ){
  $("#ideas").append( ideaData )
}

$(document).ready(function(){

  fetchIdeas();
  createIdea();
  deleteIdea();
  // updateIdea();
})
