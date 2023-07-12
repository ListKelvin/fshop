
<div class="">
    <!-- Footer -->
    <footer class="text-center text-white bgNavbar" >
        <!-- Grid container -->
        <div class="container">
            <!-- Section: Links -->
            <section class="mt-5">
                <!-- Grid row-->
                <div class="row text-center d-flex justify-content-center pt-5">
                    <!-- Grid column -->
                    <div class="col-md-2">
                        <h6 class="text-uppercase font-weight-bold">
                            <a href="#!" class="text-white">About us</a>
                        </h6>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-2">
                        <h6 class="text-uppercase font-weight-bold">
                            <a href="#!" class="text-white">Products</a>
                        </h6>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-2">
                        <h6 class="text-uppercase font-weight-bold">
                            <a href="#!" class="text-white">Awards</a>
                        </h6>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-2">
                        <h6 class="text-uppercase font-weight-bold">
                            <a href="#!" class="text-white">Help</a>
                        </h6>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-2">
                        <h6 class="text-uppercase font-weight-bold">
                            <a href="#!" class="text-white">Contact</a>
                        </h6>
                    </div>
                    <!-- Grid column -->
                </div>
                <!-- Grid row-->
            </section>
            <!-- Section: Links -->

            <hr class="my-5" />

            <!-- Section: Text -->
            <section class="mb-5">
                <div class="row d-flex justify-content-center">
                    <div class="col-lg-8">
                        <p>
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt
                            distinctio earum repellat quaerat voluptatibus placeat nam,
                            commodi optio pariatur est quia magnam eum harum corrupti
                            dicta, aliquam sequi voluptate quas.
                        </p>
                    </div>
                </div>
            </section>
            <!-- Section: Text -->

            <!-- Section: Social -->
            <section class="text-center mb-5">
                <a href="" class="text-white me-4">
                    <i class="bi bi-facebook"></i>
                </a>
                <a href="" class="text-white me-4">
                    <i class="bi bi-twitter"></i>
                </a>
                <a href="" class="text-white me-4">
                    <i class="bi bi-google"></i>
                </a>
                <a href="" class="text-white me-4">
                    <i class="bi bi-instagram"></i>
                </a>
                <a href="" class="text-white me-4">
                    <i class="bi bi-linkedin"></i>
                </a>
                <a href="" class="text-white me-4">
                    <i class="bi bi-github"></i>
                </a>
            </section>
            <!-- Section: Social -->
        </div>
        <!-- Grid container -->

        <!-- Copyright -->
        <div
            class="text-center p-3"
            style="background-color: rgba(0, 0, 0, 0.2)"
            >
            © Photo, Inc. 2023. We love our users!
        </div>
        <!-- Copyright -->
    </footer>
    <!-- Footer -->
</div>
<!-- End of .container -->


<script>


    function validateEmail() {
        var email = document.getElementById("txtEmail").value;
        if (email.indexOf("@") === -1) {
            document.getElementById("emailError").innerHTML = "Email must contain the @ symbol.";
            return false;
        }
        return true;
    }
    ;

    function validatePassword() {
        var pass = document.getElementById("txtPass").value;
        if (pass.length < 2 || pass.length > 120) {
            document.getElementById("passError").innerHTML = "Age must be a number between 18 and 120.";
            return false;
        } else {
            console.log("check run");
            document.getElementById("passError").innerHTML = "";
        }
        return true;
    }

//    let items = document.querySelectorAll('.carousel .carousel-item');
//
//    items.forEach((el) => {
//        const minPerSlide = 5;
//        let next = el.nextElementSibling;
//        for (var i = 1; i < minPerSlide;
//                i++
//                ) {
//            if (!next) {
//                // wrap carousel by using first child
//                next = items[0];
//            }
//            let cloneChild = next.cloneNode(true);
//            el.appendChild(cloneChild.children[0]);
//            next = next.nextElementSibling;
//        }
//    });



</script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>

<script src="https://accounts.google.com/gsi/client" async defer></script>
<script src="js/bootstrap.bundle.js" crossorigin="anonymous"></script>

</body>
</html>
