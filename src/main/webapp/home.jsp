<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags/"%>

<c:import url="page/Header.jsp"><c:param name="title" value="Home Page"/></c:import>
    <link rel="stylesheet" href="style/index.css"/>

    <h1>Hello World!</h1>       
    <section class="container d-flex align-items-center justify-content-center">
        <div class="w-100 bgProduct p-5 h-100">
            <div class="wrapper">
                <div class=" row align-items-center justify-content-center gap-3">
                <tag:product_card className="col-md-4" category="do dien tu" productName="testjdfslkajflskdajfljdsalkjflksdflsdjafkljsdalfjdsljflkdjslfjdslajldsajfldsjafljdsalkfjdslk" img="./assest/E-commerce_1.png" price="100$"/>
                <tag:product_card className="col-md-4" category="do dien tu" productName="testjdfslkajflskdajfljdsalkjflksdflsdjafkljsdalfjdsljflkdjslfjdslajldsajfldsjafljdsalkfjdslk" img="./assest/E-commerce_1.png" price="100$"/>
                <tag:product_card className="col-md-4" category="do dien tu" productName="testjdfslkajflskdajfljdsalkjflksdflsdjafkljsdalfjdsljflkdjslfjdslajldsajfldsjafljdsalkfjdslk" img="./assest/E-commerce_1.png" price="100$"/>
                <tag:product_card className="col-md-4" category="do dien tu" productName="testjdfslkajflskdajfljdsalkjflksdflsdjafkljsdalfjdsljflkdjslfjdslajldsajfldsjafljdsalkfjdslk" img="./assest/E-commerce_1.png" price="100$"/>
                <tag:product_card className="col-md-4" category="do dien tu" productName="testjdfslkajflskdajfljdsalkjflksdflsdjafkljsdalfjdsljflkdjslfjdslajldsajfldsjafljdsalkfjdslk" img="./assest/E-commerce_1.png" price="100$"/>
                <tag:product_card className="col-md-4" category="do dien tu" productName="testjdfslkajflskdajfljdsalkjflksdflsdjafkljsdalfjdsljflkdjslfjdslajldsajfldsjafljdsalkfjdslk" img="./assest/E-commerce_1.png" price="100$"/>
                <tag:product_card className="col-md-4" category="do dien tu" productName="testjdfslkajflskdajfljdsalkjflksdflsdjafkljsdalfjdsljflkdjslfjdslajldsajfldsjafljdsalkfjdslk" img="./assest/E-commerce_1.png" price="100$"/>
                <tag:product_card className="col-md-4" category="do dien tu" productName="testjdfslkajflskdajfljdsalkjflksdflsdjafkljsdalfjdsljflkdjslfjdslajldsajfldsjafljdsalkfjdslk" img="./assest/E-commerce_1.png" price="100$"/>
                <tag:product_card className="col-md-4" category="do dien tu" productName="testjdfslkajflskdajfljdsalkjflksdflsdjafkljsdalfjdsljflkdjslfjdslajldsajfldsjafljdsalkfjdslk" img="./assest/E-commerce_1.png" price="100$"/>
                <tag:product_card className="col-md-4" category="do dien tu" productName="testjdfslkajflskdajfljdsalkjflksdflsdjafkljsdalfjdsljflkdjslfjdslajldsajfldsjafljdsalkfjdslk" img="./assest/E-commerce_1.png" price="100$"/>
                <tag:product_card className="col-md-4" category="do dien tu" productName="testjdfslkajflskdajfljdsalkjflksdflsdjafkljsdalfjdsljflkdjslfjdslajldsajfldsjafljdsalkfjdslk" img="./assest/E-commerce_1.png" price="100$"/>
            </div>
        </div>
    </div>

</section>

<c:import url="page/Footer.jsp"></c:import>