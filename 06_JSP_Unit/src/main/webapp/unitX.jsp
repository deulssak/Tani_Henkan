<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>TaniHenkan</title>

    <!-- <script>
function noSpaceForm(obj) { // 공백사용못하게
    var str_space = /\s/;  // 공백체크
    if(str_space.exec(obj.value)) { //공백 체크
        //alert("해당 항목에는 공백을 사용할수 없습니다.\n\n공백은 자동적으로 제거 됩니다.");
        obj.focus();
        obj.value = obj.value.replace(/\s| /gi,''); // 공백제거
        return false;
    }
}
</script> -->
  </head>
  <link rel="stylesheet" href="css/main.css" />
  <script src="js/main.js"></script>
  
  <body style="width: 100%; height: 100%">
  <% 
    String henkan = request.getParameter("henkan"); 
	double num =Double.parseDouble(request.getParameter("num")); 
	double re = 0; 
	String reS = "";
	String bf_tani = "km/h"; 
	String af_tani = "m/h"; 
	String color1 = "rgb(251, 247,184)"; 
	String color2 = "rgb(151, 247, 245)"; 

	if (henkan.equals("cmInch")){
		re = num/2.54;
		color1 = "rgb(251, 247, 184)"; 
		color2 = "rgb(194, 187, 255)";
    	bf_tani = "cm"; 
		af_tani = "inch"; 
	} else if (henkan.equals("m2P")){ 
		//근삿값인 3.306으로 나눈 값으로 환산 
		re = num/3.306; 		
		color1 = "#FFD1FF";
    	color2 = "#FBD0C8"; 
    	bf_tani = "㎡"; 
    	af_tani = "평"; 
    } else if (henkan.equals("cF")){
    	re = (num*1.8)+32; 
    	color1 = "rgb(188, 236, 255)";
    	color2 = "rgb(194, 187, 255)"; 
    	bf_tani = "℃"; af_tani = "℉"; 
    } else {
    	re =num*0.621371; }
	reS= String.format("%.2f", re);
    %>

    <div class="main";     
    	style="background: linear-gradient(<%=color1%>, <%=color2%>);
    	position: relative;">
      <div class="subtitle";>
       결과 확인
      </div>
      <div id="kotae">
	      <div id="kotae2">
    	    <%=num%><%=bf_tani%>는 <br />
        	<%=reS%><%=af_tani%> 입니다.
      	  </div>
      </div>
      <div class="btnBox">
      	<button class="btn" onclick="location.href='Main.html'">다시 하기</button>
      </div>
    </div>
  </body>
</html>
