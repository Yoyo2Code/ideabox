function fetchIdeas(){
  $.ajax({
    method: "GET",
    url: "http://localhost:3000/api/v1/ideas"
  }).then(collectIdeas)
    .then(renderIdeas)
}

function createIdea(){
  $("#idea-form").on('click', '#create-idea', function(){
    if($("#idea-title").val() != "" || $("#idea-body").val() != "")
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

        $("#idea-title").val("")
        $("#idea-body").val("")
  });
}

function deleteIdea(){
  $("#ideas").on("click", "#delete-idea", function(){
    var $idea = $(this).closest(".idea");
    $.ajax({
      url: "http://localhost:3000/api/v1/ideas/" + $idea.data("id") + ".json",
      type: "DELETE"
    }).then(function(){
      $idea.remove()
    })
  });
}

function titleData(ideaId, data) {
  var ideaParams = {
    id: ideaId,
    idea: {
      title: data
    }
  };
  return ideaParams;
};

function bodyData(ideaId, data) {
  var ideaParams = {
    id: ideaId,
    idea: {
      body: data
    }
  };
  return ideaParams;
};

function updateIdea(){
  $("#ideas").on('blur', '#title, #body', function(){
    var ideaParams;
    var idea = $(this);

    var data = idea.val();
    var ideaId = idea.parent().attr("data-id");
    var attribute = idea.attr("id");

    if(attribute === 'title'){
      ideaParams = titleData(ideaId, data);
    };

    if(attribute === 'body'){
      ideaParams = bodyData(ideaId, data);
    };

      $.ajax({
        url: "http://localhost:3000/api/v1/ideas/" + ideaId,
        data: ideaParams,
        type: "PUT"
      })
    $( this ).replaceWith("<p id='idea-" + attribute + "'>" + data + "</p>");

  });
}

function editIdeaTitle(){
  $("#ideas").on('click', "#idea-title", function(){
    $( this ).replaceWith( "<input id='title' type='text' value='" + $( this ).text() + "'/>" );
    $("#title").focus();
  });
}

function editIdeaBody(){
  $("#ideas").on('click', "#idea-body", function(){
    $( this ).replaceWith( "<input id='body' type='text' value='" + $( this ).text() + "'/>" );
    $("#body").focus();
  });
}

function increaseQuality(quality){
  if(quality === 'swill') {
    return 'plausible';
  } else if(quality === 'plausible') {
    return 'genius';
  }
};

function decreaseQuality(quality){
  if(quality === 'genius') {
    return 'plausible';
  } else if(quality === 'plausible') {
    return 'swill';
  }
};

function likeButton(){
  $("#ideas").on('click', "#like", function() {

    var $idea   = $(this).closest(".idea");
    var ideaId  = $idea.attr("data-id");
    var $quality = $idea.find("#quality");
    var qualityText = $quality.text();

    var newQuality = increaseQuality(qualityText)
    if(newQuality != undefined){
      updateIdeaQuality(ideaId, newQuality);
    };

    $idea.find("#quality").text(newQuality)
  })
}

function updateIdeaQuality(ideaId, newQuality) {
    var ideaParams = {
      id: ideaId,
      idea: {
        quality: newQuality
      }
    };

    $.ajax({
      url: "http://localhost:3000/api/v1/ideas/" + ideaId,
      data: ideaParams,
      type: "PUT"
    })
}

function dislikeButton(){
  $("#ideas").on('click', "#dislike", function() {

    var $idea   = $(this).closest(".idea");
    var ideaId  = $idea.attr("data-id");
    var $quality = $idea.find("#quality");
    var qualityText = $quality.text();

    var newQuality = decreaseQuality(qualityText)
    if(newQuality != undefined){
      updateIdeaQuality(ideaId, newQuality);
    };

    $idea.find("#quality").text(newQuality)
  })
}

function collectIdeas( ideaData ){
  return ideaData.map(createIdeaHTML);
}

function createIdeaHTML( idea ){
  return $("<div class='idea' data-id='"
    + idea.id
    + "'><h3>Title: </h3>"
    + "<p id='idea-title'>"
    + idea.title
    + "</p><h3>Body: </h3>"
    + "<p id='idea-body'>"
    + idea.body
    + "</p>"
    + "<h3>Quality: </h3>"
    + "<p id='quality'>"
    + idea.quality
    + "</p>"
    + "<button id='like'>Thumbs Up</button>"
    + "<button id='dislike'>Thumbs Down</button>"
    + "<button id='delete-idea' name='button-fetch'>Delete</button>"
    + "</div>"
  )
}

function finishedEdit(){
  $("#ideas").on('blur', '#edit-idea', function(){
  });
}

function searchParams() {
  $(".search").keyup(function(){
    var filter = $(this).val();

    $(".idea").each(function() {

      if( $(this).find("#idea-title").text().includes(filter) ) {
        $(this).show();
      } else if( $(this).find("#idea-body").text().includes(filter) ) {
        $(this).show();
      } else {
        $(this).hide();
      };
    });
  });
}

function renderIdeas( ideaData ){
  $("#ideas").append( ideaData )
}

$(document).ready(function(){

  fetchIdeas();
  createIdea();
  deleteIdea();
  editIdeaBody();
  editIdeaTitle();
  finishedEdit();
  updateIdea();
  likeButton();
  dislikeButton();
  searchParams();
})
