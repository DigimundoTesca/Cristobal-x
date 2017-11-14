$(document).ready(function() {
    // Forms handlers
    // $(".mailitbtn").on("click", function(e) {
    //   e.preventDefault();
    //   swal({
    //     title: "Su pregunta será enviada!",
    //     text: "Espere pronto una respuesta",
    //     type: "success",
    //     showCancelButton: true,
    //     cancelButtonText: "Cancelar",
    //     cancelButtonClass: 'btn btn-danger',
    //     confirmButtonText: "Entendido",
    //     confirmButtonClass: 'btn btn-success'
    //     }).then(function () {
    //       document.vacaquest.submit();
    //     });
    // });
    $(".caballomailitbtn").on("click", function(e) {
      e.preventDefault();
      swal({
        title: "Su pregunta será enviada!",
        text: "Espere pronto una respuesta",
        type: "success",
        showCancelButton: true,
        cancelButtonText: "Cancelar",
        cancelButtonClass: 'btn btn-danger',
        confirmButtonText: "Entendido",
        confirmButtonClass: 'btn btn-success'
        }).then(function () {
          document.caballoquest.submit();
        });
    });
    $(".ovejamailitbtn").on("click", function(e) {
      e.preventDefault();
      swal({
        title: "Su pregunta será enviada!",
        text: "Espere pronto una respuesta",
        type: "success",
        showCancelButton: true,
        cancelButtonText: "Cancelar",
        cancelButtonClass: 'btn btn-danger',
        confirmButtonText: "Entendido",
        confirmButtonClass: 'btn btn-success'
        }).then(function () {
          document.ovejaquest.submit();
        });
    });
    $(".cerdomailitbtn").on("click", function(e) {
      e.preventDefault();
      swal({
        title: "Su pregunta será enviada!",
        text: "Espere pronto una respuesta",
        type: "success",
        showCancelButton: true,
        cancelButtonText: "Cancelar",
        cancelButtonClass: 'btn btn-danger',
        confirmButtonText: "Entendido",
        confirmButtonClass: 'btn btn-success'
        }).then(function () {
          document.cerdoquest.submit();
        });
    });
    $(".conejomailitbtn").on("click", function(e) {
      e.preventDefault();
      swal({
        title: "Su pregunta será enviada!",
        text: "Espere pronto una respuesta",
        type: "success",
        showCancelButton: true,
        cancelButtonText: "Cancelar",
        cancelButtonClass: 'btn btn-danger',
        confirmButtonText: "Entendido",
        confirmButtonClass: 'btn btn-success'
        }).then(function () {
          document.conejoquest.submit();
        });
    });
    $(".gallomailitbtn").on("click", function(e) {
      e.preventDefault();
      swal({
        title: "Su pregunta será enviada!",
        text: "Espere pronto una respuesta",
        type: "success",
        showCancelButton: true,
        cancelButtonText: "Cancelar",
        cancelButtonClass: 'btn btn-danger',
        confirmButtonText: "Entendido",
        confirmButtonClass: 'btn btn-success'
        }).then(function () {
          document.galloquest.submit();
        });
    });
    $(".avemailitbtn").on("click", function(e) {
      e.preventDefault();
      swal({
        title: "Su pregunta será enviada!",
        text: "Espere pronto una respuesta",
        type: "success",
        showCancelButton: true,
        cancelButtonText: "Cancelar",
        cancelButtonClass: 'btn btn-danger',
        confirmButtonText: "Entendido",
        confirmButtonClass: 'btn btn-success'
        }).then(function () {
          document.avequest.submit();
        });
    });
    $(".perromailitbtn").on("click", function(e) {
      e.preventDefault();
      swal({
        title: "Su pregunta será enviada!",
        text: "Espere pronto una respuesta",
        type: "success",
        showCancelButton: true,
        cancelButtonText: "Cancelar",
        cancelButtonClass: 'btn btn-danger',
        confirmButtonText: "Entendido",
        confirmButtonClass: 'btn btn-success'
        }).then(function () {
          document.perroquest.submit();
        });
    });
    $(".gatomailitbtn").on("click", function(e) {
      e.preventDefault();
      swal({
        title: "Su pregunta será enviada!",
        text: "Espere pronto una respuesta",
        type: "success",
        showCancelButton: true,
        cancelButtonText: "Cancelar",
        cancelButtonClass: 'btn btn-danger',
        confirmButtonText: "Entendido",
        confirmButtonClass: 'btn btn-success'
        }).then(function () {
          document.gatoquest.submit();
        });
    });
    $(".faunamailitbtn").on("click", function(e) {
      e.preventDefault();
      swal({
        title: "Su pregunta será enviada!",
        text: "Espere pronto una respuesta",
        type: "success",
        showCancelButton: true,
        cancelButtonText: "Cancelar",
        cancelButtonClass: 'btn btn-danger',
        confirmButtonText: "Entendido",
        confirmButtonClass: 'btn btn-success'
        }).then(function () {
          document.faunaquest.submit();
        });
    });
    // Login form handler

    $("#LogInOut").click(function (e) {
      e.preventDefault();
      var username = $('#email').val();
      var password = $('#password').val();
      console.log(username)      
      console.log(password)

      $.ajax({
        url: "{% url 'home:inicio' %}",
        type: 'POST',
        data: {
          'username': username,
          'password': password,
          csrfmiddlewaretoken: '{{ csrf_token }}',          
        },
        dataType: 'json',
        success: function (data) {
          if (data.check == 'Valido') {
            swal({
            title: "¡Bienvenido!",
            text: "Bienvenido Juan Perez",
            type: "success",
            confirmButtonText: "Vamos",
            confirmButtonClass: 'btn btn-success'
            }).then(function () {
                $(".logIn").css('display', 'none');
                $(".newQuestion").css("display","inline");
            });            
          }else{
            alert("La contrasenia es incorrecta.");
          }
        }
      });

    });

    $( "#LogInOuta" ).click(function(e) {
      e.preventDefault();
      swal({
        title: "¡Bienvenido!",
        text: "Bienvenido Juan Perez",
        type: "success",
        confirmButtonText: "Vamos",
        confirmButtonClass: 'btn btn-success'
        }).then(function () {
            $(".logIn").css('display', 'none');
            $(".newQuestion").css("display","inline");
        });
    });
    // Sinlge Question gallery
    jQuery(document).ready(function(){ 
        jQuery("#gallery").unitegallery(); 
    }); 
    // Animal icons popover
    $(document).ready(function(){
        if (screen.width>=1100) {
            $('[data-toggle="popover"]').popover();   
        }
    });
    // Register form password validation
    (function($) {
      $('#id_password1, #id_password2').keyup(function() {
        var pass1 = $('#id_password1').val();
        var pass2 = $('#id_password2').val();
        if ( pass1 == pass2) {
          $('#messagepass').html('Las contraseñas coinciden').css('color', 'green');
          if (pass1.length  > '7') {
            $('#regisbtn').prop("disabled", false);
          }
        } else 
        $('#messagepass').html('Las contraseñas no coinciden').css('color', 'red');
      });
    })(jQuery);



});