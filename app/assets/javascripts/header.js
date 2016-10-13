$(document).ready(function(e){
  // drop-down menu
	$('.dropdown-button').dropdown({ hover: false });

  // add favorite star to blog_post
  $(document).on('click', '.js-favorite', function(e){
    console.debug('clicked');
    e.preventDefault()
    if ($(this).hasClass('favorite')) {
      $(this).removeClass('favorite');
      $(this).text('star_border');
    } else {
      $(this).addClass('favorite');
      $(this).text('star');
    }
  });

  // create new blog_post
  $(document).on('click', '.new_blog_post', function(e){
    console.debug("Call Ajax - create new Blog Post");
    $.ajax({
      url: '/blog_posts/create',
      data: {blogpost: {
        title: $('.blog_title').val()
      }},
      method: 'POST',
      success: function(res){
        if(res.error) {
          console.debug("ERROR");
        } else {
          console.debug("Redirect to single: ", res.blogPost.id);
          window.location.href = "/blog_posts/"+res.blogPost.id;
        }
        console.debug('res: ', res);
      }
    }); // end ajax
  }); // end blog_blog post click

  // initialize text editor
  $(function() {
      $('#edit').froalaEditor()
  });

  // save post description
  $(document).on('click', '.save-editor-text', function(e){
    e.preventDefault();
    var id = $('.post_id').val();
    var text = $('#edit').val();
    $('.description-content').html(text);
    $('.description_p').hide();

    $.ajax({
      method: 'PATCH',
      url: '/blog_posts/'+id,
      data: {blogpost: {
        post_id: id,
        description: text
      }},
      success: function(res){
        if(res.error) {
          console.debug("ERROR");
        } else {
          console.debug("Post successfully updated");
        }
        console.debug('res: ', res);
      }
    }); // end ajax
  }) // end onClick

  // blog-post change role public/private
  $(document).on('change', '.switch', function(e){
    var isPublic = $(".chk").is(':checked');
    var id = $('.post_id').val();

    $.ajax({
      method: 'PATCH',
      url: '/blog_posts/'+id,
      data: {blogpost: {
        post_id: id,
        isPublic: isPublic
      }},
      success: function(res){
        if(res.error) {
          console.debug("ERROR");
        } else {
          console.debug("Post successfully updated");
        }
        console.debug('res: ', res);
      }
    }); // end ajax
  }) // end role change

  // edit blogPostTitle
  $(document).on('click', '.edit_title', function(e){
    $('.blog_post_title').toggle();
    $('.new_blog_title').toggle();
  });

  $(document).on('click', '.edit_cancel_button', function(e){
    var original_title = $('.blog_post_title').find('span').text();
    $('.blog_post_title').toggle();
    $('.new_blog_title').toggle();
    $('.new_titel_text').val(original_title);
  });

  $(document).on('click', '.edit_title_button', function(e){
    var new_title = $('.new_titel_text').val();
    var id = $('.post_id').val();

    $.ajax({
      method: 'PATCH',
      url: '/blog_posts/'+id,
      data: {blogpost: {
        post_id: id,
        title: new_title
      }},
      success: function(res){
        if(res.error) {
          console.debug("ERROR");
        } else {
          console.debug("Post successfully updated");
          $('.blog_post_title').find('span').text(new_title);
          $('.blog_post_title').toggle();
          $('.new_blog_title').toggle();
        }
        console.debug('res: ', res);
      }
    }); // end ajax
  }); // end function

  // sidebar blog click
  $(document).on('click', '.link_list', function(e){
    e.preventDefault();
    var id = $(this).attr('id');
    console.debug('id: ', id);

    // ajax load blog_post
    $.ajax({
      method: 'GET',
      url: '/blog_posts/'+id,
      //data: {id: id},
      success: function(res){
        if(res.error) {
          console.debug("ERROR");
        } else {
          console.debug("Post successfully updated");
          $('.selected_blog_title').text(res.title);
          $('.selected_blog_description').html(res.description);
          $('.blog_id').val(id);
        }
        console.debug('res: ', res);
      }
    }); // end ajax
  });

  // comment on post
  $(document).on('keyup', '.text-editor', function(e){
    e.preventDefault();
    if (e.which == 13) {
      var a = $('#edit')
      console.debug("test: ", a.val());
      $('.fr-element').text('')
    }
  })

});