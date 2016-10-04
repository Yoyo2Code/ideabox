function fetchIdeas(){
  $.ajax({
    method: "GET",
    url: "http://localhost:3000/api/v1/ideas"
  }).then(collectIdeas)
    .then(renderIdeas)
}

function createIdea(){
  $("#idea-form").on('click', '#create-idea', function(){
    var IdeaParams = {
      idea: {
        title: $("#idea-title").val();
        body: $("#idea-body").val();
      }
      $.ajax({
        url: "http://localhost:3000/api/v1/ideas",
        data: ideaParams,
        type: "POST"
      }).then(createIdeaHTML)
        .then(renderIdea)
  }
})

function collectIdeas( ideaData ){
  return ideaData.map(createIdeaHTML);
}

function createIdeaHTML( idea ){
  return $("<div class='idea' data-id='"
    + idea.id
    + "'><h6>Title: "
    + idea.title
    + "</h6><p>"
    + idea.body
    + "</p>"
    + "<button id='delete-idea' name='button-fetch'>Delete</button>"
    + "</div>"
  )
}

function renderIdeas( ideaData ){
  $("#ideas").append( ideaData )
}

function createIdea(){
  var ideaTitle = $("#idea-title").val();
  var ideaBody = $("#idea-body").val();


}


$(document).ready(function(){

  fetchIdeas();
  createIdeas();
})
