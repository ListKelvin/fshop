<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags/"%>

<c:import url="page/Header.jsp"><c:param name="title" value="Home Page"/></c:import>


    <section class="container d-flex align-items-center justify-content-center flex-column ">
        <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active" data-bs-interval="10000">
                    <img src="assest/E-commerce.png" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item" data-bs-interval="2000">
                    <img src="assest/E-commerce.png" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="assest/Rectangle.png" class="d-block w-100" alt="...">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>

        <div class="w-100 bgProduct h-100 mb-3">
            <div class="wrapper px-2 rounded shadow ">
              <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 gap-3 p-5">
                <tag:product_card className="col" category="do dien tu" productName="testjdfslkajflskdajfljdsalkjflksdflsdjafkljsdalfjdsljflkdjslfjdslajldsajfldsjafljdsalkfjdslk" img="./assest/E-commerce_1.png" price="100$"/>
                <tag:product_card className="col" category="do dien tu" productName="testjdfslkajflskdajfljdsalkjflksdflsdjafkljsdalfjdsljflkdjslfjdslajldsajfldsjafljdsalkfjdslk" img="./assest/E-commerce_1.png" price="100$"/>
                <tag:product_card className="col" category="do dien tu" productName="testjdfslkajflskdajfljdsalkjflksdflsdjafkljsdalfjdsljflkdjslfjdslajldsajfldsjafljdsalkfjdslk" img="./assest/E-commerce_1.png" price="100$"/>
                <tag:product_card className="col" category="do dien tu" productName="testjdfslkajflskdajfljdsalkjflksdflsdjafkljsdalfjdsljflkdjslfjdslajldsajfldsjafljdsalkfjdslk" img="./assest/E-commerce_1.png" price="100$"/>
                <tag:product_card className="col" category="do dien tu" productName="testjdfslkajflskdajfljdsalkjflksdflsdjafkljsdalfjdsljflkdjslfjdslajldsajfldsjafljdsalkfjdslk" img="./assest/E-commerce_1.png" price="100$"/>
                <tag:product_card className="col" category="do dien tu" productName="testjdfslkajflskdajfljdsalkjflksdflsdjafkljsdalfjdsljflkdjslfjdslajldsajfldsjafljdsalkfjdslk" img="./assest/E-commerce_1.png" price="100$"/>
                <tag:product_card className="col" category="do dien tu" productName="testjdfslkajflskdajfljdsalkjflksdflsdjafkljsdalfjdsljflkdjslfjdslajldsajfldsjafljdsalkfjdslk" img="./assest/E-commerce_1.png" price="100$"/>
                <tag:product_card className="col" category="do dien tu" productName="testjdfslkajflskdajfljdsalkjflksdflsdjafkljsdalfjdsljflkdjslfjdslajldsajfldsjafljdsalkfjdslk" img="./assest/E-commerce_1.png" price="100$"/>
                <tag:product_card className="col" category="do dien tu" productName="testjdfslkajflskdajfljdsalkjflksdflsdjafkljsdalfjdsljflkdjslfjdslajldsajfldsjafljdsalkfjdslk" img="./assest/E-commerce_1.png" price="100$"/>
                <tag:product_card className="col" category="do dien tu" productName="testjdfslkajflskdajfljdsalkjflksdflsdjafkljsdalfjdsljflkdjslfjdslajldsajfldsjafljdsalkfjdslk" img="./assest/E-commerce_1.png" price="100$"/>
                <tag:product_card className="col" category="do dien tu" productName="testjdfslkajflskdajfljdsalkjflksdflsdjafkljsdalfjdsljflkdjslfjdslajldsajfldsjafljdsalkfjdslk" img="./assest/E-commerce_1.png" price="100$"/>
            </div>
        </div>
    </div>

</section>

<c:import url="page/Footer.jsp"></c:import>