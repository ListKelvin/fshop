
<div class="">
    <!-- Footer -->
    <footer class="text-center text-white" style="background-color: #3f51b5">
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
                    <i class="fab fa-facebook-f"></i>
                </a>
                <a href="" class="text-white me-4">
                    <i class="fab fa-twitter"></i>
                </a>
                <a href="" class="text-white me-4">
                    <i class="fab fa-google"></i>
                </a>
                <a href="" class="text-white me-4">
                    <i class="fab fa-instagram"></i>
                </a>
                <a href="" class="text-white me-4">
                    <i class="fab fa-linkedin"></i>
                </a>
                <a href="" class="text-white me-4">
                    <i class="fab fa-github"></i>
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
            � 2020 Copyright:
            <a class="text-white" href="https://mdbootstrap.com/"
               >MDBootstrap.com</a
            >
        </div>
        <!-- Copyright -->
    </footer>
    <!-- Footer -->
</div>
<!-- End of .container -->


<script>


    function validateEmail() {
        var email = document.getElementById("txtEmail").value;
        if (email.indexOf("@") == -1) {
            document.getElementById("emailError").innerHTML = "Email must contain the @ symbol.";
            return false;
        }
        return true;
    }

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
</script>

<script src="https://accounts.google.com/gsi/client" async defer></script>
<script src="js/bootstrap.bundle.js" crossorigin="anonymous"></script>
</body>
</html>